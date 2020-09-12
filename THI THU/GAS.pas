const fi='GAS.INP';fo='GAS.OUT';
var   C:array[0..100000] of longint;
      F:array[0..1000,0..1000] of longint;
      n,k:longint;
procedure nhap;
 var   i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,k);
   for i:=0 to n do read(c[i]);
 end;
function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;
procedure process;
 var i,j,res:longint;
 begin
 //fillchar(f,sizeof(f),0);
  for i:=1 to n do
   for j:=0 to k do F[i,j]:=100000;
  for i:=1 to k do F[0,i]:=i*C[0];
 for i:=1 to n do
  for j:=0 to k do
   F[i,j]:=min(F[i,j],F[i-1,k-j]+j*c[i]);


 // end;
  res:=1000000000;
 for i:=1 to k do
  res:=min(res,F[N,i]);
  writeln(res);
 end;
BEGIN
 nhap;
 process;

 END.

