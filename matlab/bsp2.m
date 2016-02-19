function [val,model] = bsp2(MASS,HEIGHT,varargin)

if nargin == 0
  MASS = 70; HEIGHT = 1.8;
end

MASS_g    = MASS*1000;
HEIGHT_cm = HEIGHT*100;

REPO_PATH = '/Users/will/Repo/Biomech/body-segment-param';
DATA_PATH = [REPO_PATH,'/data/regr-mass-height/'];

model = init_models();
M = numel(model);

model = read_models(model);
model = calc_models(model);

segments = {'head','thorax','abdo','pelvis','thigh','shank','foot','arm','forearm','hand'};
S = numel(segments);

param_calc = {'mass','moiap'};
P = numel(param_calc);

for pp = 1:P
  val{pp} = table(nan(S,0),'RowNames',segments);
end


%% Subfunctions

  function model = init_models(mnames)
    
    if nargin == 0
      mnames = {'shan-bohn-MC'};
    end
    
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
        model(ii).regr.(param) = importdata(filename);
        model(ii).calc.(param) = [];
      end
      
    end
    
  end

  function model = calc_models(model)
    
    for ii = 1:M
      regr_var = [1;MASS;HEIGHT]./model(ii).units([1;2;3]);
      for jj = 1:model(ii).NP
        param = model(ii).param{jj};
        model(ii).calc.(param) = ...
          model(ii).regr.(param)(:,[1,2,3]) * regr_var;
      end
    end
    
  end

end