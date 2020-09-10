const fi='GOODWAYS.INP';fo='GOODWAYS.OUT';
var A,S:array[0..200,0..200] of longint;
    C:array[0..200,0..200,0..200] of longint;
    n,k,m:longint;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
   readln(m,n,k);
   for i:=1 to m do
    for  j:=1 to n do read(a[i,j]);
  close(input);
 end;
procedure QHD;
 var i,j:longint;
 begin
  S[1,1]:=A[1,1];
  for i:=2 to n do S[1,i]:=S[1,i-1]+A[1,i];
  for i:=2 to m do S[i,1]:=S[i-1,1]+A[i,1];
  for i:=2 to m do
   for j:=2 to n do
    S[i,j]:=max(S[i,j-1],S[i-1,j])+A[i,j];
 end;
procedure init;
 var i,j,ko:longint;
 begin
  for i:=1 to m do
   for ko:=0 to k do
    C[ko,i,1]:=1;
  for j:=1 to n do
   for ko:=0 to k do
    C[ko,1,j]:=1;
 end;
function CalC(k,i,j:longint):longint;
 var d:longint;
 begin
  If C[k,i,j]=0 then
   begin
    d:=S[i,j]-A[i,j];
    if k>=d-S[i-1,j] then inc(C[k,i,j], CalC(k+S[i-1,j]-d,i-1,j));
    if k>=d-S[i,j-1] then inc(C[k,i,j], CalC(k+S[i,j-1]-d,i,j-1));
   end;
  CalC:=C[k,i,j];
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(S[m,n]);
   writeln(CalC(k,m,n));
  close(output);
 end;
BEGIN
 nhap;
 init;
 QHD;
 xuat;
END.
