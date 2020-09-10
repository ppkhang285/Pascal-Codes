const fi='MSCHOOL.INP';fo='MSCHOOL.OUT';
    oo=100000000;
var DD,check:array[0..10000,0..10000] of boolean;
    C:array[0..10000,0..10000,1..2] of longint;
    Free:array[0..10000] of boolean;
    S:array[0..10000,1..3] of longint;
    N,M,K,res:longint;
procedure nhap;
 var  i,j,u,v:longint;
 begin
  fillchar(dd,sizeof(dd),false);
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(N,M,K);
    for i:=1 to n do
   for j:=1 to n do
     if i=j then
      begin
       C[i,j,1]:=0;
       C[i,j,2]:=0;
      end
     else
    begin
     C[i,j,1]:=oo;
     C[i,j,2]:=oo;
    end;
   for i:=1 to m do
    begin
     readln(u,v,C[u,v,1],C[u,v,2]);
     DD[u,v]:=true;
    end;
 end;
procedure init(u,x,mo:longint);
 var i:longint;
 begin
  fillchar(free,sizeof(free),true);
  Free[u]:=false;
  for i:=1 to n do
    S[i,x]:=C[u,i,mo];
 end;
procedure DIJSTRA(mo,x:longint);
 var  u,min,v,i:longint;
 begin
  repeat
   u:=0;min:=oo;
   for i:=1 to n do
    if (Free[i]) and (S[i,x]<min) then
     begin
      min:=S[i,x];
      u:=i;
     end;
   if u=0 then exit;
   Free[u]:=false;
   for v:=1 to n do
    if (Free[v]) and (DD[u,v]) and (S[v,x]>S[u,x]+C[u,v,mo])then
        S[v,x]:=S[u,x]+C[u,v,mo];
   until false;
 end;
procedure fromhome;
 begin
  init(1,1,2);
  DIJSTRA(2,1);
 end;
procedure toschool;
 begin
  init(k,2,1);
  DIJSTRA(1,2);
 end;
procedure tooffice;
 begin
  init(n,3,2);
  DIJSTRA(2,3);
 end;
procedure process;
 var i:longint;
 begin
  res:=oo;
  for i:=2 to n-1 do
   begin
    if (S[i,1]+S[i,2]<60) and (res>S[i,1]+S[i,3]) then
     res:=S[i,1]+S[i,3];
   end;
  end;
procedure xuat;
 begin
  write(res);
 end;
procedure changedirec;
 var i,j:longint;
 begin
  fillchar(check,sizeof(check),true);
  for i:=1 to n do
   for j:=1 to n do
    if (i<>j) and (DD[i,j]) and (not DD[j,i]) and (check[i,j]) then
     begin
      DD[i,j]:=false;
      DD[j,i]:=true;
      check[j,i]:=false;
      C[j,i,2]:=C[i,j,2];
      C[j,i,1]:=C[i,j,1];
      C[i,j,1]:=oo;
      C[i,j,2]:=oo;
     end;
 end;
BEGIN
 nhap;
 fromhome;
 changedirec;
 toschool;
 tooffice;
 process;
 xuat;
END.


