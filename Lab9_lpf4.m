% 2D FIR filter LPF4
delta = 0.05;
h1d_4 = remez(20,[ 0 (0.3+delta) (0.6+delta) 1],[1 1 0 0],[1 5]);
h2d_4 = h1d_4'*h1d_4;% 2D FIR filter LPF4