const fi='TILE.INP';fo='TILE.OUT';
     limit=1000000007;
type     maxtrix=array[1..3,1..3] of int64;
var  f,c,x:array[1..3,1..3] of int64;
     n,res:int64;
     k:int64;
     t,i:integer;
procedure nhap;
 begin

 end;
procedure ready;
 begin
    f[1,1]:=1;
   f[1,2]:=2;
   f[2,1]:=1;
   f[2,2]:=0;
 end;
function mult(a,b:maxtrix):maxtrix;
 var  i,j,k:longint;
 begin
  fillchar(mult,sizeof(mult),0);
  for i:=1 to 2 do
   for k:=1 to 2 do
    for j:=1 to 2 do
      mult[i,k]:=(mult[i,k]+((a[i,j]*b[j,k]) mod limit)) mod limit;
  end;
function power(a:maxtrix;k:int64):maxtrix;
 begin
  if k=1 then exit(a);
  x:=power(a,k div 2);
  x:=mult(x,x);
  if k mod 2<>0 then x:=mult(x,f);
   exit(x);
 end;
BEGIN
 ready;
 assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(t);
   for i:=1 to t do
   begin
     readln(n);
   c:=power(f,n-1);
   res:=(c[1,1]+c[1,2]) mod limit;
   writeln(res);
  end;
  close(input);
  close(output);
END.

