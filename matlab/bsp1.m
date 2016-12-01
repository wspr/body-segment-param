function bsp_mass = bsp1(MASS,varargin)

repopath = '/Users/will/Repo/Biomech/body-segment-param/';
datapath = [repopath,'data/scaled-mass/'];

bsp_mass = table();

%% Proportional models
%
% col 1 = segment, column 2 = original data, column 3 = rescaled to 100%

%omitted = {};
modfilenames = {'harless1860','braune1889','dempster1955',...
  'fujikawa1963',...
  'clauser1969','zats-selu1979m','zats-selu1979f',...
  'jensen1989-6yr','jensen1986-12yr',...
  ...'jensen1986-15yr',...
  'jensen1989-18yr',...
  'jensen1994M','jensen1994F','cheng2000','pavol2002M','pavol2002F','chen2011','ma2011M','ma2011F'};

for mm = 1:numel(modfilenames)
  T = readtable([datapath,modfilenames{mm},'.csv']);
  modname = T.Properties.VariableNames{1};
  new = table(MASS*T{:,3}/100,'VariableNames',{modname},'RowNames',T{:,1});
  if mm == 1
    newtable = new;
  else
    newtable = fakejoin(bsp_mass,new);
  end
  bsp_mass = newtable;
end

%%

modnames = bsp_mass.Properties.VariableNames;

for mm = 1:numel(modnames)

  modname = modnames{mm};

  if not(isnan(bsp_mass{'shoulder',modname})) && not(isnan(bsp_mass{'chest',modname})) && not(not(isnan(bsp_mass{'thorax',modname})))
    bsp_mass{'thorax',modname} = 2*bsp_mass{'shoulder',modname} + bsp_mass{'chest',modname};
  end
  if not(isnan(bsp_mass{'abdo',modname})) && not(isnan(bsp_mass{'pelvis',modname})) && not(not(isnan(bsp_mass{'abdopelvis',modname})))
    bsp_mass{'abdopelvis',modname} = bsp_mass{'abdo',modname} + bsp_mass{'pelvis',modname};
  end
  if not(isnan(bsp_mass{'abdo',modname})) && not(isnan(bsp_mass{'thorax',modname})) && not(not(isnan(bsp_mass{'thoraxabdo',modname})))
    bsp_mass{'abdopelvis',modname} = bsp_mass{'abdo',modname} + bsp_mass{'pelvis',modname};
  end

  if (isnan(bsp_mass{'trunk',modname}))
    if not(isnan(bsp_mass{'abdopelvis',modname})) && not(isnan(bsp_mass{'thorax',modname}))
      bsp_mass{'trunk',modname} = ...
        bsp_mass{'abdopelvis',modname} + bsp_mass{'thorax',modname};
    elseif not(isnan(bsp_mass{'thoraxabdo',modname})) && not(isnan(bsp_mass{'pelvis',modname}))
      bsp_mass{'trunk',modname} = ...
        bsp_mass{'thoraxabdo',modname} + bsp_mass{'pelvis',modname};
    else
      warning('Cannot resolve TRUNK segment for model "%s".',modname);
    end
  end

end

%%

end

%%

function C = fakejoin(A,B)

fake = {'FakeRowNames'};

AT = array2table(A.Properties.RowNames,'VariableNames',fake);
BT = array2table(B.Properties.RowNames,'VariableNames',fake);

% these can't be inlined into outerjoin() for some reason!
AV = [AT, A];
BV = [BT, B];

CV = outerjoin(AV,BV,'Keys',1,'MergeKeys',true);

C = CV(:,2:end);
C.Properties.RowNames = CV{:,1};

end