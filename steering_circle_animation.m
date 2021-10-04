clear, clc, close all


SR = 15 %steering ratio: given from rack and pinion
Steering_Angle = -15:0.01:15; %degrees: desired for better control? degree value varies based on geomtry
delta_vir = [Steering_Angle/SR]*180/pi; %converted from rad to degree

WB = 59.7; %Wheel Base [inches]
TW = 52.9; %Track Width (For the Front Wheels) [inches]

Left_Wheel_Toe= atand( (WB .*tand(delta_vir)) ./ (WB-0.5 .*TW.*tand(delta_vir)))
Right_Wheel_Toe = atand( (WB .*tand(delta_vir)) ./ (WB+0.5 .*TW.*tand(delta_vir)))
%% FIGURE 1
hold on
plot(Steering_Angle, Left_Wheel_Toe,'r') %Left Wheel - Red
plot(Steering_Angle, Right_Wheel_Toe,'b') %Right Wheel - Blue
title('Toe Angle as function of Steering Wheel Angle');
xlabel('Steering Wheel Angle (deg)');
ylabel('Toe Angle (deg)');
hold off

legend('Left Wheel','Right Wheel');

Left_Wheel = [Left_Wheel_Toe; Steering_Angle]'

%Begin Plotting Wheel
D_Wheel = 23; %[inches]

%Front Wheels, this is what will be animated
%% FIGURE 2
figure(2)
% for n = 1:numel(Left_Wheel_Angle)
%     
%     plot([TW/2 TW/2] , [-D_Wheel D_Wheel])
%     plot([-TW/2 -TW/2] , [-D_Wheel D_Wheel])
%     
% end
hold on

%Location of Car's Wheels (Black)
plot([3*TW 3*TW] , [-D_Wheel D_Wheel], 'k') %Front Right Wheel
plot([2*TW 2*TW] , [-D_Wheel D_Wheel], 'k') %Front Left Wheel
plot([3*TW 3*TW] , [-D_Wheel-WB D_Wheel-WB], 'k') %Back Right Wheel
plot([2*TW 2*TW] , [-D_Wheel-WB D_Wheel-WB], 'k')%Back Left Wheel

%Circle 1 (Left Wheel)
h = animatedline;
ax_x1 = -25*25
ax_x2 = -ax_x1
ax_y1 = -25*25
ax_y2 = -ax_y1
axis([2*ax_x1, 2*ax_x2, 2*ax_y1, 2*ax_y2])
axis('square')
% x = linspace(-70,70,450);

theta = 0:0.005:2*pi;
x = -500+600*cos(theta);
y = -TW/2+600*sin(theta);
for k = 1:length(x)
    addpoints(h,x(k),y(k));
    drawnow
end

hold on
h2 = animatedline;
ax2_x1 = -25*25
ax2_x2 = -ax2_x1
ax2_y1 = -25*25
ax2_y2 = -ax2_y1
axis([2*ax2_x1, 2*ax2_x2, 2*ax2_y1, 2*ax2_y2])
% axis('square')

theta2 = 0:0.015:2*pi;
x2 = -445+600*cos(theta2);
y2 = -TW/2+600*sin(theta2);
for k2 = 1:length(x2)
    addpoints(h2,x2(k2),y2(k2));
    drawnow
end
hold off
hold off
hold off
