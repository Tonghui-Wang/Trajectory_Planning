%直线轨迹规划
%输入：起始时刻的位移，终止时刻的位移，时间段内的恒定速度
%输出：该时间段内的位移、速度、加速度
function [xsh,vel,acc]=TrajPlan3(start_x,const_v, end_x)

    end_t=(end_x-start_x)/const_v;
    
    t=0:0.01:end_t;
    xsh=zeros(1,length(t));
    vel=zeros(1,length(t));
    acc=zeros(1,length(t));
    
    for i=1:length(t)
        xsh(i)=start_x+const_v*t(i);
        vel(i)=const_v;
        acc(i)=0;
    end
end
