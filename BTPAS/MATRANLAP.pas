const fi='MATRANLAP.INP';fo='MATRANLAP.OUT';
type matrix=array[1..100,1..100] of  int64;
var  a:array[1..100,1..100] of int64;
     k,n:longint;

procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,k);
   for i:=1 to n do
    for j:=1 to n do read(a[i,j]);
  close(input);
 end;
function mult(x,y:matrix):matrix;
 var c:matrix;
     i,j,k:longint;
 begin
  fillchar(c,sizeof(c),0);
  for i:=1 to n do
   for k:=1 to n do
    for j:=1 to n do
     c[i,k]:=c[i,k]+(x[i,j]*y[j,k]);
   exit(c);
  end;
function power(a:matrix;k:longint):matrix;
 var i:longint;
     b:matrix;
 begin
  b:=a;
  if k=1 then exit(a);
  for i:=2 to k do
   b:=mult(b,a);
  exit(b);
 end;
procedure xuat;
 var i,j:longint;
     f:matrix;
 begin
  assign(output,fo);rewrite(output);
   f:=power(a,k);
   for i:=1 to n do
    begin
     for j:=1 to n do write(f[i,j],' ');
     writeln;
    end;
 close(output);
 end;
BEGIN
 nhap;
 xuat;
END.