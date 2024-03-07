clear;
clc;
cd('C:\Local Matlab Data')
pause(0.1)


%%%%%%%%%%%%%%%Example: Population impact of center lat/lon and radius.
center_lat=37.543;
center_lon=-78.234;
radius_km=100;


%%%%%%%%%%%Draw a circle;
[contour_lat,contour_lon] = scircle1(center_lat,center_lon,km2deg(radius_km));


load('Cascade_new_full_census_2010.mat','new_full_census_2010')%%%%%%%Geo Id, Center Lat, Center Lon,  NLCD (1-4), Population
mid_lat=new_full_census_2010(:,2);
mid_lon=new_full_census_2010(:,3);
census_pop=new_full_census_2010(:,5);
tic;
inside_idx=find(inpolygon(mid_lon,mid_lat,contour_lon,contour_lat)); %Check to see if the points are in the polygon
toc;


total_pop_inside=sum(census_pop(inside_idx))


figure;
hold on;
plot(contour_lon,contour_lat,':m','LineWidth',3)
plot(center_lon,center_lat,'xb','LineWidth',3)
plot(mid_lon(inside_idx),mid_lat(inside_idx),'sr','LineWidth',1)
grid on;
plot_google_map('maptype','terrain','APIKey','AIzaSyCgnWnM3NMYbWe7N4svoOXE7B2jwIv28F8') %%%Google's API key made by nick.matlab.error@gmail.com
pause(0.1)




