% 2D FIR filter LPF2
delta = 0.05;
h1d_2 = remez(20,[ 0 (0.3-delta) (0.6-delta) 1],[1 1 0 0],[1 5]);
h2d_2 = h1d_2'*h1d_2;% 2D FIR filter LPF2