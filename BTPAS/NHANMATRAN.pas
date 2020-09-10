const fi='NHANMATRAN.INP';fo='NHANMATRAN.OUT';
var a,b,c:array[1..100,1..100] of longint;
    n,m,p:longint;
procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
   readln(m,n,p);
   for i:=1 to m do
    for j:=1 to n do
     read(a[i,j]);
   readln;
   for i:=1 to n do
    for j:=1 to p do
     read(b[i,j]);
 end;
procedure process;
 var i,j,k:longint;
 begin
  fillchar(c,sizeof(c),0);
  for i:=1 to m do
   for k:=1 to p do
    for j:=1 to n do
     c[i,k]:=c[i,k]+(a[i,j]*b[j,k]);
 end;
procedure xuat;
 var i,j:longint;
 begin
  assign(output,fo);rewrite(output);
   for i:=1 to m do
    begin
     for j:=1 to p do write(c[i,j],' ');
     writeln;
    end;
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.

