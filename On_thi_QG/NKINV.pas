const fi = 'NKINV.INP';fo = 'NKINV.OUT';
var
    A,F:array[0..60005] of longint;
    n,Max:longint;
    res:int64;
function get(i:longint):int64;
 var temp:longint;
 begin
        temp:=0;
        while (i<=Max) do
         begin
               temp:= temp + F[i];
               i:= i + (i and (-i));
         end;
        exit(temp);
 end;
procedure Update(i:longint);
 begin
        while (i>=1) do
         begin
                F[i]:=F[i] + 1;
                i:= i -  (i and (-i));
         end;
 end;
procedure nhap;
 var i,x:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                fillchar(F,sizeof(F),0);
                res:=0;
                for i:=1 to n do
                 begin
                        readln(A[i]);
                        if (A[i])> Max then Max:=A[i];
                 end;
        for i:=1 to n do
         begin
                res:= res+ Get(A[i]+1);
                Update(A[i]);
         end;
        writeln(res);
 end;

BEGIN
        nhap;
END.
