const fi='MAXTRIXx.INP';fo='MAXTRIXx.OUT';
type     maxtrix=array[1..100,1..100] of integer;
var  f,c:array[1..100,1..100] of integer;
     n,k:longint;
procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,k);
   for i:=1 to n do
    for j:=1 to n do
     read(f[i,j]);
  close(input);
 end;
function mult(a,b:maxtrix):maxtrix;
 var  i,j,k:longint;
 begin
  fillchar(mult,sizeof(mult),0);
  for i:=1 to n do
   for k:=1 to n do
    for j:=1 to n do
     mult[i,k]:=mult[i,k]+(a[i,j]*b[j,k]);
  end;
function power(a:maxtrix;k:int64):maxtrix;
 begin
  if k=1 then exit(a);
  if k mod 2=0 then
   power:=mult(power(a,k div 2),power(a,k div 2))
  else
   power:=mult(mult(power(a,k div 2),power(a,k div 2)),a);
 end;
procedure xuat;
 var i,j:longint;
 begin
  assign(output,fo);rewrite(output);
   c:=power(f,k);
   for i:=1 to n do
    begin
     for j:=1 to n do write(c[i,j],' ');
     writeln;
    end;
  close(output);
 end;
BEGIN
 nhap;
 xuat;
END.


