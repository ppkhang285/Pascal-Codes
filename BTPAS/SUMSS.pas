const fi ='SUMSS.INP';fo='SUMSS.OUT';
var  A,F:array[0..105] of longint;
     res,K,B,N:longint;
procedure nhap;
 var  i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(N,K,B);
                for i:=1 to n do read(A[i]);
 end;
procedure solve;
 var  i,X,res:longint;
 begin
        F[0]:=0;
        for i:=1 to n do F[i]:= F[i-1] + A[i];
        res:= 0;
        X:= B mod N;
        res:= res + F[n] - F[X-1];
        X:= N - X + 1;
        if K>=X then
         begin
                K:= K - X;
                res:= res + (K div N)*F[n] + F[K mod N];
         end
        else
         begin
                X:= B mod N;
                res:= F[X+K-1] - F[X-1];
         end;
        writeln(res);
 end;
BEGIN
        nhap;
        solve;
END.
