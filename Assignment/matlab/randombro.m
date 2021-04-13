clear
clc
q = randn([1,4000]);
r = rand([1,10000]);
mean1 = mean(q)
mean2 = mean(r)
std1 = std(q)
std2 = std(r)

figure(1)
histogram(q)
figure(2)
histogram(r)
