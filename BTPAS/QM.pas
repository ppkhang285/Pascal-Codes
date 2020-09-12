const fi = 'QM.INP';fo = 'QM.OUT';
var  A,F:array[-2..105,-2..105] of longint;
     n,m:longint;
procedure nhap;
 var     i,j:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n,m);
                for i:=1 to n do
                 begin
                        for j:=1 to m do read(a[i,j]);
                        readln;
                 end;
 end;
function Max(x,y:longint):longint;
 begin
        if (x>y) then exit(x) else exit(y);
 end;
procedure solve;
 var    i,j,res:longint;
 begin
        fillchar(F,sizeof(F),0);
        for i:=1 to m do F[1,i]:= A[1,i];
        for i:=2 to n do
         for j:= 1 to m do
          F[i,j]:= max( max( max(F[i-2,j-1], F[i-2,j+1]), F[i-1,j+2] ), F[i-1,j-2] ) + A[i,j];
        res:= F[n,1];
        for i:=2 to m do res:= max(res, F[n,i]);
        writeln(Res);
 end;
BEGIN
         nhap;
         solve;
END.