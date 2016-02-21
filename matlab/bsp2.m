function [tableval,model] = bsp2(MASS,HEIGHT,varargin)

%% BSP2  Interface to mass/height regressions for body segment parameter estimation.
%
% Usage:
%          T = BSP2(MASS,HEIGHT)
%          T = BSP2(__,'models',  {m1,m2,m3,...})
%          T = BSP2(__,'segments',{s1,s2,s3,...})
%          T = BSP2(__,'params',  {p1,p2,p3,...})
%
% MASS must be in units of kg, and HEIGHT in units of m. (I.e., SI.)
% Type BSP2() to output a list of known models, segments, and parameters
% to choose from; by default, all are output. Note that not all models will
% have data for all segments and all parameters.

REPO_PATH = '/Users/will/Repo/Biomech/body-segment-param';
DATA_PATH = [REPO_PATH,'/data/regr-mass-height/'];

% should be auto-generated from searching through the DATA_PATH directory:
all_models   = {'shan-bohn-FC','shan-bohn-MC','shan-bohn-FG','shan-bohn-MG','zats2-F','zats2-M'};
all_segments = {'head','thorax','abdo','pelvis','thigh','shank','foot','arm','forearm','hand'};
all_params   = {'mass','centroid','length','moi-ap','moi-ml','moi-si'};

if nargin == 0
  nm = numel(all_models);
  ns = numel(all_segments);
  np = numel(all_params);
  NN = 2+max([nm,ns,np]);
  printcell = cell(NN,3);
  printcell(1,:) = {'MODELS','SEGMENTS','PARAMETERS'};
  printcell(2,:) = {'======','========','=========='};
  printcell((1:nm)+2,1) = transpose(all_models);
  printcell((1:ns)+2,2) = transpose(all_segments);
  printcell((1:np)+2,3) = transpose(all_params);
  help bsp2
  for nn = 1:NN
    fprintf('%15s  %15s  %15s\n',printcell{nn,:});
  end
  return
end

p = inputParser();
p.addOptional('models',all_models);
p.addOptional('segments',all_segments);
p.addOptional('param',all_params);
p.parse(varargin{:})


[model_names, M] = check_inputs('models',  p.Results.models,  all_models);
[segments]       = check_inputs('segments',p.Results.segments,all_segments);
[param_calc, P]  = check_inputs('param',   p.Results.param,   all_params);

model    = init_models();
model    = read_models(model);
model    = calc_models(model);
tableval = extract_calcs(model);


%% Subfunctions
%
% A fair few shared variables, so these are nested subfunctions rather than
% independent ones. Just keeps things a bit simpler in the code.

%% Check inputs
%
% This function actually does two things: it outputs the number of models,
% segments, and parameters, and it ensures that the inputs requested match
% up with known calculation outputs.

  function [names, X] = check_inputs(s,names,all)
    
    if isstr(names), names = {names}; end
    X = numel(names);
    
    for xx = 1:X
      if ~any(strcmp(names{xx},all))
        % I don't know how to get all of this into a single string for
        % the error() function:
        fprintf('Available options for ''%s'' are:\n',s);
        disp(all')
        error('"%s" not found in the list above',names{xx})
      end
    end
    
  end

%% Init models
%
% This is currently extremely simple, but longer term I want to include
% metadata into each model (somehow).

  function model = init_models()
    model = struct('name',model_names); 
  end

%% Read models

  function model = read_models(model)
    % use importdata() because it's convenient; doesn't seem too slow
    
    for ii = 1:M

      prefix = [DATA_PATH,model(ii).name];
      model(ii).rows     = importdata([prefix,'-rows.csv']);
      model(ii).param    = importdata([prefix,'-param.csv']);
      colunits = importdata([prefix,'-columns.csv']);
      model(ii).columns  = colunits.textdata;
      model(ii).units    = colunits.data.'; % needs to be a column for later
      
      model(ii).NP    = numel(model(ii).param);

      for jj = 1:model(ii).NP
        param = model(ii).param{jj};
        filename = [prefix,'-',param,'.csv'];
        model(ii).regr(jj).coeff = importdata(filename);
        model(ii).calc(jj).val  = [];
        model(ii).calc(jj).name = param;
      end
      
    end
    
  end

%% Calc models
%
% There's no reason to separate this from |read_models| except for
% separating two concepts.

  function model = calc_models(model)
    
    for ii = 1:M
      regr_var = [1;MASS;HEIGHT]./model(ii).units([1;2;3]);
      for jj = 1:model(ii).NP
        model(ii).calc(jj).val = ...
          model(ii).regr(jj).coeff(:,[1,2,3]) * regr_var;
      end
    end
    
  end

%% Extract calcs
%
% It's all well and good having done the calculations, but it's a bit messy
% to get the data out again. This organises things into a better format,
% including only extracting a subset of the results if requested.

  function tableval = extract_calcs(model)
    
    tableval = struct();
    
    for pp = 1:P
      param_name = param_calc{pp};
      param_name = regexprep(param_name,'-','_');
      tableval.(param_name) = [];
      
      for mm = 1:M
        
        ind = strcmp(model(mm).param,param_name);
        if ~any(ind)
          results_array = nan(1,numel(model(mm).rows));
        else
          results_array = transpose(model(mm).calc(ind).val);
        end
        
        rownames = {regexprep([num2str(mm),'_',model(mm).name],'-','_')};
        results_tbl = array2table(results_array,...
          'RowNames',rownames,'VariableNames',model(mm).rows);
        
        tableval.(param_name) = [...
          tableval.(param_name);
          results_tbl(:,segments);
          ];
      end
    end
    
  end

%% The end

end