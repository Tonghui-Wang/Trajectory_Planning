%五次多项式轨迹规划
%输入：起始时刻的时间，起始时刻的位移，起始时刻的速度，起始时刻的加速度，终止时刻的时间，终止时刻的位移，终止时刻的速度，终止时刻的加速度
%输出：该时间段内的位移、速度、加速度
function [xsh,vel,acc]=TrajPlan2(start_t,start_x,start_v,start_a,end_t,end_x,end_v,end_a)

    cons=[start_x; end_x; start_v; end_v; start_a; end_a];
    tran=[1, start_t, start_t^2, start_t^3, start_t^4, start_t^5;
          1, end_t, end_t^2, end_t^3, end_t^4, end_t^5;
          0, 1, 2*start_t, 3*start_t^2, 4*start_t^3, 5*start_t^4;
          0, 1, 2*end_t, 3*end_t^2, 4*end_t^3, 5*end_t^4;
          0, 0, 2, 6*start_t, 12*start_t^2, 20*start_t^3;
          0, 0, 2, 6*end_t, 12*end_t^2, 20*end_t^3];
      
    para=(inv(tran))*cons;
    
    a0=para(1);
    a1=para(2);
    a2=para(3);
    a3=para(4);
    a4=para(5);
    a5=para(6);
    
    t=start_t:0.01:end_t;
    xsh=zeros(1,length(t));
    vel=zeros(1,length(t));
    acc=zeros(1,length(t));

    for i=1:length(t)
        xsh(i)=a0+a1*t(i)+a2*t(i)^2+a3*t(i)^3+a4*t(i)^4+a5*t(i)^5;
        vel(i)=a1+2*a2*t(i)+3*a3*t(i)^2+4*a4*t(i)^3+5*a5*t(i)^4;
        acc(i)=2*a2+6*a3*t(i)+12*a4*t(i)^2+20*a5*t(i)^3;
    end
end
