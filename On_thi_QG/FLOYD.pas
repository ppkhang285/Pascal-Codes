const fi='FLOYD.INP';fo='FLOYD.OUT';
      maxC=100000000;
var  C,T:array[0..101,0..101] of longint;
     res:array[0..100] of longint;
     n,m,k:longint;
procedure nhap;
 var i,j,u,v:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,m,k);
   for i:=1 to n do
    for j:=1 to n do
     if i=j then C[i,i]:=0
      else
       begin
        C[i,j]:=maxc;
        C[j,i]:=maxc;
       end;
 {  for i:=1 to m do
    begin
     readln(u,v,C[u,v]);
     C[v,u]:=C[u,v];
    end;}
 end;
procedure init;
 var i,j:longint;
 begin
  for i:=1 to n do
   for j:=1 to n do
    if C[i,j]<maxc then
      T[i,j]:=j;
 end;
procedure Floyd;
 var  i,j,k:longint;
 begin
  for k:=1 to n do
   for i:=1 to n do
    for j:=1 to n do
     if C[i,j]>(C[i,k]+C[k,j]) then
      begin
       C[i,j]:=C[i,k]+C[k,j];
       T[i,j]:=T[i,k];
      end;
 end;
procedure trace(u,v:longint);
 var i,long:longint;
 begin
   long:=0;
   while u<>v do
    begin
     long:=long+1;
     Res[long]:=u;
     u:=T[u,v];
    end;
   long:=long+1;
   write(long,' ');
   for i:=1 to long-1 do write(res[i],' ');
   writeln(v);
 end;
procedure xuat;
 var i,cmd,u,v:longint;
 begin
  assign(output,fo);rewrite(output);
   for i:=1 to k do
    begin
     readln(cmd,u,v);
     if cmd=0 then writeln(C[u,v])
      else
       begin
       if C[u,v]=maxc then writeln('0')
        else
         trace(u,v);
       end;
    end;
  close(input);close(output);
 end;
BEGIN
 nhap;
 init;
 FLOYD;
 xuat;
END.
