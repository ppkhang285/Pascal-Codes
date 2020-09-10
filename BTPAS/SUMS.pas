const fi ='SUMS.INP';fo ='SUMS.OUT';
var A:array[0..1001] of longint;
    F:array[0..1001] of int64;
    n,S: longint;
procedure nhap;
 var i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n,S);
                For i:=1 to n do read(a[i]);
 end;
procedure process;
 var i,j,res:longint;
 begin
     F[0]:=0;
     res:=0;
     For i:=1 to n do F[i]:=F[i-1]+A[i];
     For i:=1 to n do
        For j:=i to n do
                if (F[j]-F[i-1]) = S then res:=res+1;
     writeln(res);
 end;
BEGIN
        nhap;
        process;
END.