const fi='SEQ.INP';fo='SEQ.OUT';
      mol=1000000000;
type matrix=array[0..12,0..12] of int64;

var  c,b:array[0..12] of int64;
     n,k:longint;
function Mul(a,b:matrix):matrix;
 var i,j,l:longint;
     c:matrix;
 begin
  fillchar(c,sizeof(c),0);
  for i:=1 to k do
   for l:=1 to k do
    for j:=1 to k do
     c[i,l]:=(c[i,l]+((a[i,j]*b[j,l]) mod mol)) mod mol;
    exit(c);
 end;
function Mul2(a,b:matrix;q,w,e:longint):matrix;
var i,j,l:longint;
    c:matrix;
begin
  fillchar(c,sizeof(c),0);
  for i:=1 to q do
   for l:=1 to e do
    for j:=1 to w do
     c[i,l]:=(c[i,l]+((a[i,j]*b[j,l]) mod mol)) mod mol;
    exit(c);
 end;
Function power(H:matrix; d:longint):matrix;
 var x:matrix;
 begin
  fillchar(x,sizeof(x),0);
  if d<=1 then exit(h);
  x:=power(h,d div 2);
  x:=mul(x,x);
  if (d mod 2)<>0 then x:=mul(x,h);
  exit(x);
 end;
procedure process;
 var Q,z,i:longint;
     F,G,T,res:matrix;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
  readln(q);
  for z:=1 to Q do
   begin
    readln(k);
    for i:=1 to k do read(b[i]);
    readln;
    for i:=1 to k do read(c[i]);
    readln;
    readln(n);
    if (n<=k) then writeln(b[n] mod mol)
     else
      begin
       fillchar(T,sizeof(t),0);
       Fillchar(G,sizeof(G),0);
       fillchar(res,sizeof(res),0);
       Fillchar(F,sizeof(F),0);
      for i:=2 to k do
        T[i-1,i]:=1;
       for i:=1 to k do
        T[k,i]:=C[k-i+1];
        F:=power(T,n-k);
        for i:=1 to k do
         G[i,1]:=b[i];
         res:=Mul2(F,G,k,k,1);
        writeln(res[k,1] mod mol);
       end;
   end;
  close(input);close(output);
end;
BEGIN
 process;
END.


