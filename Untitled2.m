a=10;
b=2000;

A=[1,a,b];B=1;
sys = tf(B,A);
t = 0:0.00001:1;
y = step(sys, t);
figure;plot(t, y);
axis([0 1 -0.001 0.001]);
xlabel('t(��λ����)');ylabel('g(t)');
title('Ƿ����״̬')


a=78;
b=2000;

A=[1,a,b];B=1;
sys = tf(B,A);
t = 0:0.00001:1;
y = step(sys, t);
figure;plot(t, y);
axis([0 1 -0.001 0.001]);
xlabel('t(��λ����)');ylabel('g(t)');
title('�ٽ�����״̬')



a=200;
b=2000;

A=[1,a,b];B=1;
sys = tf(B,A);
t = 0:0.00001:1;
y = step(sys, t);
figure;plot(t, y);
axis([0 1 -0.001 0.001]);
xlabel('t(��λ����)');ylabel('g(t)');
title('������״̬')
