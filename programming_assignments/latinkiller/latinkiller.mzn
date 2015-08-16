int: n;
set of int: Num = 1..n;         % number of row(column)
int: m;                         % number of groups
set of int: Group = 1..m;
set of int: Group0 = 0..m;
array[Group] of int: s;
array[Num,Num] of Group0: a;    % a[i, j] means element[i, j] belongs to group a[i, j]

array[Num,Num] of var Num: x;   & value of element[i, j]

%%%%%%%
include "alldifferent.mzn";
% all row numbers are different
constraint forall(i in Num) (alldifferent([x[i, j]| j in Num]));
% all column numbers are different
constraint forall(j in Num) (alldifferent([x[i, j]| i in Num]));
% all elements in group 1-m are different
constraint forall(k in Group) (alldifferent([x[i, j]| i, j in Num where a[i, j] = k]));
% sum of all elements in groupi(i = 1~m) equals to s[k]
constraint forall(k in Group) (sum(i, j in Num where a[i, j] = k) (x[i, j]) = s[k]);

%%%%%%%

solve satisfy;

output ["x = [|"] ++
       [ if j = 1 /\ 2 <= i /\ i <= n then "| " else "" endif ++
         show(x[i,j]) ++ 
         if j == n then "\n" else ", " endif  
       | i,j in Num ] 
       ++
       ["|];\n"]
;

