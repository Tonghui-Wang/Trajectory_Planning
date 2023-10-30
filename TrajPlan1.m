%三次多项式轨迹规划
%输入：起始时刻的时间，起始时刻的位移，起始时刻的速度，终止时刻的时间，终止时刻的位移，终止时刻的速度
%输出：该时间段内的位移、速度、加速度
function [xsh,vel,acc]=TrajPlan1(start_t,start_x,start_v,end_t,end_x,end_v)

    cons=[start_x; end_x; start_v; end_v];
    tran=[1, start_t, start_t^2, start_t^3;
        1, end_t, end_t^2, end_t^3;
        0, 1, 2*start_t, 3*start_t^2;
        0, 1, 2*end_t, 3*end_t^2];
    
    para=(inv(tran))*cons;
    
    a0=para(1);
    a1=para(2);
    a2=para(3);
    a3=para(4);
    
    t=start_t:0.01:end_t;
    xsh=zeros(1,length(t));
    vel=zeros(1,length(t));
    acc=zeros(1,length(t));
    
    for i=1:length(t)
        xsh(i)=a0+a1*t(i)+a2*t(i)^2+a3*t(i)^3;
        vel(i)=a1+2*a2*t(i)+3*a3*t(i)^2;
        acc(i)=2*a2+6*a3*t(i);
    end
end
