x = 3:17;
h = 1:5;

n = length(x);
m = length(h);
N = n+m-1;

y = zeros(1,N);
z = [h zeros(1,m-1)]
l = length(z);
y = zeros(1,N+l-m);
H = fft(z);
for i = 1:m:n
if i<=(n+m-1)
x1 = [x(i:i+l-m) zeros(1,l-m)];
else
x1 = [x(i:n) zeros(1,l-m)];
end
x2 = fft(x1);
x3 = x2.*H;
x4 = round(ifft(x3));
if (i==1)
    y(1:l) = x4(1:l);
else
y(i:i+l-1) = y(i:i+l-1)+x4(1:l);
end
end

subplot(3,1,1);
stem(x(1:n));
title('X(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,2);
stem(h(1:m));
title('H(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,3);
disp(y(1:N));
stem(y(1:N));
title('Convolved Signal');
xlabel('n');
ylabel('Amplitude');