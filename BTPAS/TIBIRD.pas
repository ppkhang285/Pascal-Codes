const fi ='TIBIRD.INP';fo='TIBIRD.OUT';
var A,F:array[0..1000005] of longint;
    N,Res:longint;
procedure nhap;
 var i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(N);
                for i:=1 to n do read(A[i]);

 end;
function max(x,y:longint):longint;
 begin
        if x>y then exit(x) else exit(y);
 end;
function min(x,y:longint):longint;
 begin
        if x<y then exit(x) else exit(y);
 end;

procedure solve;
 var i,minN:longint;

 begin
        F[1]:= A[1];
        for i:=2 to n do F[i]:= F[i-1] +A[i];
        minN := 0;
        res:=A[1];
        For i:=1 to n do
         begin
                res:= max(res, F[i] - minN);
                minN := min(MinN, F[i]);
         end;
        writeln(res);
 end;
BEGIN
        nhap;
        solve;
END.