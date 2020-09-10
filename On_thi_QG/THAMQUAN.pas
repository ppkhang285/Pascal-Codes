const fi='THAMQUAN.INP';fo='THAMQUAN.OUT';
      vc=1000000000;
var C:array[0..200,0..200] of longint;
    re:array[0..200] of longint;
    n,m,k:longint;
procedure nhap;
 var i,j,u,v:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,k,m);
   for i:=1 to n do
    for j:=1 to n do
     if i=j then C[i,j]:=0
      else C[i,j]:=vc;
   for i:=1 to k+1 do
    read(re[i]);
    readln;
    for i:=1 to m do
     begin
      readln(u,v);
      c[u,v]:=1;
      C[v,u]:=1;
     end;
    {  for i:=1 to k do
    C[re[i],re[i+1]]:=vc;
   close(input);}
 end;
procedure FLOYD;
 var k,i,j:longint;
 begin
  for k:=1 to n do
   for i:=1 to n do
    for j:=1 to n do
     if C[i,j]>(C[i,k]+C[k,j]) then
      C[i,j]:=C[i,k]+C[k,j];
 end;
procedure xuat;
 var res,i:longint;
 begin
  assign(output,fo);rewrite(output);
   res:=0;
   for i:=1 to k do
    res:=res+C[re[i],re[i+1]];
   res:=res+C[re[k+1],re[1]];
   writeln(res);
  close(output);
 end;
BEgin
 nhap;
 FLOYD;
 xuat;
END.
