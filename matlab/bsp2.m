function [tableval,model] = bsp2(MASS,HEIGHT,varargin)

if nargin == 0
  MASS = 70; HEIGHT = 1.8;
end

model_names = {'shan-bohn-MC','shan-bohn-MC'};
segments = {'head','shoulder','thorax','abdo','pelvis','thigh','shank','foot','arm','forearm','hand'};
param_calc = {'mass','moi-ap'};

REPO_PATH = '/Users/will/Repo/Biomech/body-segment-param';
DATA_PATH = [REPO_PATH,'/data/regr-mass-height/'];

M = numel(model_names);
S = numel(segments);
P = numel(param_calc);

model = init_models(model_names);
model = read_models(model);
model = calc_models(model);

for pp = 1:P
  tableval(pp).name = param_calc{pp};
  tableval(pp).res  = [];
  
  for mm = 1:M
    ind = strcmp(model(mm).param,tableval(pp).name);
    tableval(pp).res = [tableval(pp).res; array2table(model(mm).calc(ind).val.',...
      'RowNames',{regexprep([num2str(mm),'_',model(mm).name],'-','_')},'VariableNames',model(mm).rows)];
  end  
end


%% Subfunctions

  function model = init_models(mnames)
    model = struct('name',mnames); 
  end

  function model = read_models(model)
    % use importdata() because it's convenient; doesn't seem too slow
    
    for ii = 1:M
      prefix = [DATA_PATH,model(ii).name];
      model(ii).rows     = importdata([prefix,'-rows.csv']);
      model(ii).param    = importdata([prefix,'-param.csv']);
      colunits = importdata([prefix,'-columns.csv']);
      model(ii).columns  = colunits.textdata;
      model(ii).units    = colunits.data.'; % need a column for later
      
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

  function model = calc_models(model)
    
    for ii = 1:M
      regr_var = [1;MASS;HEIGHT]./model(ii).units([1;2;3]);
      for jj = 1:model(ii).NP
        model(ii).calc(jj).val = ...
          model(ii).regr(jj).coeff(:,[1,2,3]) * regr_var;
      end
    end
    
  end

end