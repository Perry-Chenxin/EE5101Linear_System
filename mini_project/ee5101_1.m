clc
clear all
syms s;
%a0260045r
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

s0 = -0.26 + 0.3*i; s1 = -0.26 - 0.3*i; s2 = -4; s3 = -4;
m = (s-s0)*(s-s1)*(s-s2)*(s-s3);
a = expand(m)

wc = [B A*B A*A*B  A*A*A*B];
rank(wc)
b1=B(:,1);
b2=B(:,2);
C_1=[b1,A*b1,b2,A*b2];
C_t=inv(C_1);
q1 = C_t(1,:);
q2=C_t(2,:);
q3=C_t(3,:);
q4 = C_t(4,:);
T=[q2;q2*A;q4;q4*A];
Abar=T*A/T;
Bbar=T*B;
Adbar = [0 1 0 0 ;
    0 0 1 0;
    0 0 0 1;
    -8776/625 -9588/625 -26297/1250 -213/25]; % Ad = Abar - Bbar*Kbar

Kbar = pinv(Bbar) * (Abar - Adbar);
K = Kbar *T

