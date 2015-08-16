var 1..9: M;
var 0..9: I;
var 0..9: N;
var 1..5: Z;
var 0..9: C;
var 1..9: R;
var 0..9: O;
var 0..9: K;

include "alldifferent.mzn";
constraint alldifferent([M, I, N, Z, C , R, O, K]);

constraint 1000 * M + 100 * I + 10 * N + I
        +  1000 * Z + 100 * I + 10 * N + C
        = 10000 * R + 1000 * O + 100 * C + 10 * K + Z;

solve satisfy;
