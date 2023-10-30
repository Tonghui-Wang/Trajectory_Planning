% close all
clear;
clc;

%% 约束条件
t0=0;  x0=10;  v0=5;  a0=1; %p0点：时间0，路程10，速度5，加速度1
t1=5;  x1=60;  v1=10; a1=3; %p1点：时间5，路程60，速度10，加速度3
t2=13; x2=100; v2=15; a2=5; %p2点：时间13，路程100，速度15，加速度5
t3=20; x3=200; v3=20; a3=8; %p3点：时间20，路程200，速度20，加速度8

%% 三次多项式
[x01,v01,a01]=TrajPlan1(t0,x0,v0,t1,x1,v1);%p0~p1段规划
[x12,v12,a12]=TrajPlan1(t1,x1,v1,t2,x2,v2);%p1~p2段规划
[x23,v23,a23]=TrajPlan1(t2,x2,v2,t3,x3,v3);%p2~p3段规划

x=[x01 x12 x23];
v=[v01 v12 v23];
a=[a01 a12 a23];

figure(1);
subplot(3,1,1);
plot(x,'r','LineWidth',1.2);
axis([ t0*100 t3*100 -inf inf]);
ylabel('position');

subplot(3,1,2);
plot(v,'g','LineWidth',1.2);
axis([ t0*100 t3*100 -inf inf]);
ylabel('velocity');

subplot(3,1,3);
plot(a,'b','LineWidth',1.2);
axis([ t0*100 t3*100 -inf inf]);
ylabel('acceleration');
xlabel('time');

sgtitle('三次多项式','color','cyan','Fontsize',16);
hold on;

%% 五次多项式
[x01,v01,a01]=TrajPlan2(t0,x0,v0,a0,t1,x1,v1,a1);%p0~p1段规划
[x12,v12,a12]=TrajPlan2(0,x1,v1,a1,t2-t1,x2,v2,a2);%p1~p2段规划
[x23,v23,a23]=TrajPlan2(0,x2,v2,a2,t3-t2,x3,v3,a3);%p2~p3段规划

x=[x01 x12 x23];
v=[v01 v12 v23];
a=[a01 a12 a23];

figure(2);
subplot(3,1,1);
plot(x,'r','LineWidth',1.2);
axis([ t0*100 t3*100 -inf inf]);
ylabel('position');

subplot(3,1,2);
plot(v,'g','LineWidth',1.2);
axis([ t0*100 t3*100 -inf inf]);
ylabel('velocity');

subplot(3,1,3);
plot(a,'b','LineWidth',1.2);
axis([ t0*100 t3*100 -inf inf]);
ylabel('acceleration');
xlabel('time');

sgtitle('五次多项式','color','cyan','Fontsize',16);
hold on;

%% 直线
[x01,v01,a01]=TrajPlan3(x0,v0,x1);%p0~p1段规划
[x12,v12,a12]=TrajPlan3(x1,v1,x2);%p1~p2段规划
[x23,v23,a23]=TrajPlan3(x2,v2,x3);%p2~p3段规划

x=[x01 x12 x23];
v=[v01 v12 v23];
a=[a01 a12 a23];

figure(3);
title('直线');
subplot(3,1,1);
plot(x,'r','LineWidth',1.2);
% axis([ t0*100 t3*100 -inf inf]);
ylabel('position');

subplot(3,1,2);
plot(v,'g','LineWidth',1.2);
% axis([ t0*100 t3*100 -inf inf]);
ylabel('velocity');

subplot(3,1,3);
plot(a,'b','LineWidth',1.2);
% axis([ t0*100 t3*100 -inf inf]);
ylabel('acceleration');
xlabel('time');

sgtitle('直线','color','cyan','Fontsize',16);
hold on;
