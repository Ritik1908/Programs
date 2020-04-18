clc;
close all; clear all; t=linspace(0,2*pi,200); x=exp(t); y=100+exp(2*t); loglog(x,y); title('loglog');
grid