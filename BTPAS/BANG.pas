const fi ='BANG.INP';fo ='BANG.OUT';
var  A,D,F,G:array[0..105,0..105] of longint;
     n:longint;
procedure getip;
 var  i,j:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                for i:=1 to n do
                 begin
                        for j:=1 to n do
                         begin
                                read(a[i,j]);
                                if (A[i,j] = 0) then G[i,j]:=0 else G[i,j]:=1;
                         end;
                        readln;
                 end;
 end;
procedure init;
 var i,j:longint;
 begin
        F[1,1]:=A[1,1];
        D[1,1]:=G[1,1];
        for i:=1 to n do
         for j:=1 to n do
         begin
                F[i,j]:= (F[i-1,j] + F[i,j-1] - F[i-1,j-1]) + A[i,j];
                D[i,j]:= (D[i-1,j] + D[i,j-1] - D[i-1,j-1]) + G[i,j];
         end;
 end;
function max(x,y:longint):longint;
  begin
        if (x>y) then exit(X) else exit(y);
  end;
procedure solve;
 var  i,j,k,R,ans:longint;
 begin
        ans:=0;
        for i:=1 to n do
                for j:=1 to n do
                 if (A[i,j] <>0) then
                 begin
                        if (n-j<=n-i) then R:=n else R:=n-i+j;
                        //[i,j] -- //[k-j +i, k]
                        for k:=j to R+1 do
                        if (D[k-j+i,k] - D[k-j+i,j-1] - D[i-1,k] + D[i-1,j-1]) <> (k-j+1)*(k-j+1) then
                                break;
                        k:=k-1;
                        ans:= max(ans,F[k-j+i,k] - F[k-j+i,j-1] - F[i-1,k] + F[i-1,j-1] );

                 end;
        writeln(ans);
 end;
BEGIN
        getip;
        init;
        solve;
END.