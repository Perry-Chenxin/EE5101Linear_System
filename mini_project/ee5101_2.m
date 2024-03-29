clc
clear all
syms s;
a = 0;
b = 0;
c = 4;
d = 5;
B = [0.0564+(b/(10+c)) ,0.0319;
0.0165-(c+d-5)/(1000+20*a),-0.02;
4.4939,1.5985*(a+10)/(b+12);
-1.4269,0.2730];
A =[-8.8487+(a-b)/5  -0.0399  -5.5500+(c+d)/10   3.5846;
    -4.5740       2.5010*((d+5)/(c+5))  -4.3662  -1.1183-(a-c)/20;
    3.7698      16.1212-c/5    -18.2103+(a+d)/(b+4)  4.4936;
    -8.5645-(a-b)/(c+d+2) 8.3742  -4.4331      -7.7181*(c+5)/(b+5)];
C = [-3.2988, -2.1932+(10*c +d)/(100+5*a) ,0.0370 ,-0.0109;
    0.2922-(a*b)/500,  -2.1506,   -0.0104,  0.0163];
x0 = [0.5 -0.1 0.3 -0.8]';

Q = [10 0 0 0; 0 100 0 0; 0 0 100 0; 0 0 0 100];
R = [10 0 ; 0 10];
Gamma=[A,-B/R*B';-Q,-A'];
[x,y]=eig(Gamma);
y=diag(y);
k=1;
for i=1:length(y)
    if(y(i)<0)
        v(:,k)=x(1:4,i);
        mu(:,k)=x(5:8,i);
        k=k+1;
    end
end
P=(mu)*pinv(v)
a = inv(R)*B';
K = real(a*P)
