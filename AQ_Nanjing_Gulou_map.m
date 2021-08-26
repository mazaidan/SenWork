tsunamis = readtable('tsunamis.xlsx');
tsunamis.Cause = categorical(tsunamis.Cause);
figure
gb = geobubble(tsunamis,'Latitude','Longitude', ...
        'SizeVariable','MaxHeight','ColorVariable','Cause');
geolimits([10 65],[-180 -80])
title 'Tsunamis in North America';
gb.SizeLegendTitle = 'Maximum Height';
geobasemap colorterrain

%%

AQ = readtable('DATA/2021_Mar-Jul_AQData_Gulou_district.xlsx');
AQ.Type = categorical(AQ.Type);
%%
figure(5); fig=gcf;
gb = geobubble(AQ,'lat','lon', ...
        'SizeVariable','PM2_5','ColorVariable','Type');
    
%geolimits([32.01 32.07],[118.40 118.50])
title 'PM_{2.5} concentration in Gulou district, Nanjing';
gb.SizeLegendTitle = 'PM_{2.5}';
%geobasemap colorterrain
%geobasemap darkwater
set(findall(fig,'-property','FontSize'),'FontSize',20);
