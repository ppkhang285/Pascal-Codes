const fi = 'CHIADAY1.INP';fo ='CHIADAY1.OUT';
var  A,F:array[0..10005] of longint;
     n:longint;
procedure nhap;
 var i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                for i:=1 to n do readln(a[i]);
 end;
procedure solve;
 var i,j,max:longint;
 begin
        F[0]:=0;
        F[1]:=1;
        for i:=2 to n do
                begin
                        F[i]:=1;
                        for j:=1 to i-1 do
                                if ((A[i] mod A[j]) = 0) and (F[j]+1>F[i]) then F[i]:= F[j]+1;

                end;
        max:=A[1];
        for i:=2 to n do if F[i]>max then max:=F[i];
        writeln(max);
 end;
BEGIN
        nhap;
        solve;
END.