const fi='TOURS.INP';fo='TOURS.OUT';
    maxC=1000000000;
var  C:array[0..1000,0..1000] of longint;
     m,n,T,i:longint;
procedure nhap;
 var  i,j,u,v:longint;
 begin
     readln(n,m);
   for i:=1 to n do
    for j:=1 to n do C[i,j]:=maxC;
   for i:=1 to m do
     readln(u,v,C[u,v]);
 end;
procedure FLOYD;
 var i,j,k:longint;
 begin
  for k:=1 to n do
   for i:=1 to n do
    for j:=1 to n do
     If C[i,j]>C[i,k]+C[k,j] then
       C[i,j]:=C[i,k]+C[k,j];
 end;
procedure xuat;
 var i:longint;
 begin
   for i:=1 to n do
    if C[i,i]>=maxC then writeln('-1')
    else
    writeln(C[i,i]);
 end;
BEGIN
 assign(input,fi);reset(input);
 assign(output,fo);rewrite(output);
 readln(T);
 for i:=1 to T do
  begin
 nhap;
 Floyd;
 xuat;
 ENd;
END.