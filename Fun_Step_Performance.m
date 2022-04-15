function [ys,tr,ts,tm,ov] = Fun_Step_Performance(t,y,drawflag)
% [ys,tr,ts,ov] = Fun_Step_Performance(t,y) ��׼��Ծ��Ӧ������ָ�����
% �����������ڱ�׼��Ծ��Ӧ���ߣ�ĩβʱ������Ѿ��ӽ���ֵ̬
% t-y Ϊ��Ծ��Ӧ��ʱ��-���������У�����[y,t] = step(sys)���
% drawflagΪʱ����ͼ��־��������������0ֵʱ��Ĭ����ͼ������0ʱ����ͼ
% ys ��ֵ̬
% tr ����ʱ�䣬Ĭ��Ϊ0-90%������ʱ��
% ts ����ʱ�䣬Ĭ��Ϊ2%�ĵ���ʱ��
% tm Ϊ��ֵʱ��
% ov ������ %
% e.g.
%  sys = tf(1,[1 2*0.5*1 1]);
%  [y,t] = step(sys,15);
%  [ys,tr,ts,tm,ov] = Fun_Step_Performance(t,y,1);
% By ZFS@wust  2020
% ��ȡ����Matlab/Simulinkԭ�����Ϻͳ������ע΢�Ź��ںţ�Matlab Fans


if nargin == 2
    drawflag = 1;   % Ĭ�ϻ�ͼ
end

ys = y(end);         % ��̬����
[ym, ind] = max(y);  % ������
ov = 100*(ym-ys)/ys; % ������
tm = t(ind);         % ��ֵʱ��
ind2 = length(t);
delta = 0.02;        % ����ʱ��Ĭ�Ϸ�Χ2%
while t(ind2) > 0
    if abs(y(ind2)-ys) >= delta*ys
        break
    end
    ind2 =  ind2-1;
end
ts = t(ind2);          % ����ʱ��
ind3 = 1;
while y(ind3) < 0.9*ys
    ind3 = ind3 + 1;
end
tr = t(ind3);          % ����ʱ��

if drawflag ~= 0
    figure
    plot(t,y)
    hold on
    plot([tr tr],[0 0.9*ys],'k:')
    plot([tm tm],[0 ym],'k:')
    plot([ts ts],[0 (1-delta)*ys],'k:')
    plot([t(1) t(end)],[ys ys],'k-.')
    xlabel('ʱ��/s')
    ylabel('���')
    title('��Ծ��Ӧ����')
    text(1.1*tr,0.2*ys,['����ʱ�䣺' num2str(tr)  's'])
    text(1.1*ts,0.6*ys,['����ʱ�䣺' num2str(ts)  's'])
    if  abs(tm-t(end)) > 0.1*tm
        text(1.1*tm,1*ym,['��ֵʱ�䣺' num2str(tm)  's����������' num2str(ov) '%'])
    else
        text(0.55*tm,0.8*ym,['��ֵʱ�䣺' num2str(tm)  's����������' num2str(ov) '%'])
    end
    text(0.7*t(end),0.95*ys,['��ֵ̬��' num2str(ys,3)])
    disp('%% ��Ծ��Ӧָ������')
    disp(['����ʱ�䣺' num2str(tr)  's'])
    disp(['����ʱ�䣺' num2str(ts)  's'])
    disp(['��ֵʱ�䣺' num2str(tm)  's����������' num2str(ov) '%'])
    disp(['��ֵ̬��' num2str(ys,3)])
    disp('%% ��Ծ��Ӧָ������ʾ����')
end