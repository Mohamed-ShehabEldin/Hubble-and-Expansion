clc
clear
z=[0 0.008 0.012 0.014 0.016 0.028 0.045 0.050 0.052 0.064 0.080 0.101 0.124 0.300 0.380 0.430 0.430 0.440 0.480 0.500 0.570 0.620 0.970];
d_MPars=[0 36.14 55.72 66.99 63.10 145.88 236.59 215.77 289.73 335.74 390.84 463.45 660.69 1577.61 2766.94 2546.83 2937.65 2831.39 3147.75 3467.37 3681.29 3999.45 7244.36];
d_meter=(3.08567758*(10^16)*(10^6))*d_MPars;
vel=(((z+1).^2-1)./((z+1).^2+1)).*299792458;
H=vel./d_meter;
t=-d_meter/299792458;  %with zero represents the present and negative represents the past

%ft = fittype ('poly3'); [xdata, ydata] = prepareCurveData(t,H);
%c=fit(xdata,ydata,ft); %no need for this coding as it is easer in matlab_apps


%data file
f=fopen('expansion_data.txt','w')
fprintf(f,'%-20s %-20s %-20s %-20s %-20s %-20s\n','d_MPars','d_meter','z','vel','t','H');
for i=1:1:length(z)
    fprintf(f,'%-20.7f %-20.7e %-20.4f %-20.7e %-20.7e %-20.7e\n',d_MPars(i),d_meter(i),z(i),vel(i),t(i),H(i));
end
fclose(f)