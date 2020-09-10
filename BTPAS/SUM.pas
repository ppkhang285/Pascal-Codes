const fi='SUM.inp';
      fo='SUM.out';
var n,k,i,sum:longint;
 t,a,p,q:array[0..10000] of longint;
procedure nhap;
begin
  assign(input,fi);
  reset(input);
  readln(n,k);
  for i:=1 to n do
  read(a[i]);
  for i:=1 to k do
  read(p[i],q[i]);
  close(input);
end;
procedure xuli;
begin
 T[1]:=a[1];
 for i:=2 to n do
 T[i]:=T[i-1]+a[i];
 for i:=1 to k do
  begin
  Sum:=T[q[i]]-T[p[i]-1];
  writeln(Sum);
  end;
 end;
procedure xuat;
begin
  assign(output,fo);
  rewrite(output);
  xuli;
  close(output);
end;
begin
 nhap;
 xuat;
 end.