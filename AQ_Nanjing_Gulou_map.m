tsunamis = readtable('tsunamis.xlsx');
tsunamis.Cause = categorical(tsunamis.Cause);
figure
gb = geobubble(tsunamis,'Latitude','Longitude', ...
        'SizeVariable','MaxHeight','ColorVariable','Cause');
geolimits([10 65],[-180 -80])
title 'Tsunamis in North America';
gb.SizeLegendTitle = 'Maximum Height';
geobasemap colorterrain

%% Plotting Nanjing data

AQ = readtable('DATA/2021_Mar-Jul_AQData_Gulou_district.xlsx');
AQ.Type = categorical(AQ.Type);
%% PM2.5
figure(1); 
fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','PM2_5','ColorVariable','Type');
    
%geolimits([32.01 32.07],[118.40 118.50])
title 'PM_{2.5} concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'PM_{2.5}';
%geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

% PM10
figure(2); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','PM10','ColorVariable','Type');
%geolimits([32.01 32.07],[118.40 118.50])
title 'PM_{10} concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'PM_{10}';
geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

% SO2
figure(3); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','SO2','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'SO_{2} concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'SO_{2}';
geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

% NO2
figure(4); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','SO2','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'NO_{2} concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'NO_{2}';
geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

% O3
figure(5); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','O3','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'O_{3} concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'O_{3}';
geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

% CO
figure(6); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','O3','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'CO concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'CO';
geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);
%%
figure(7); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','AQI','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'AQI concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'AQI';
%geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

figure(8); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','TSP','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'TSP concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'TSP';
%geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);

figure(9); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','TVOC','ColorVariable','Type');    
%geolimits([32.01 32.07],[118.40 118.50])
title 'TVOC concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'TVOC';
%geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);
