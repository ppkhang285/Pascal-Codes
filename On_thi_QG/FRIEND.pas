const fi='FRIEND.INP';fo='FRIEND.OUT';
      maxC=1000000000;
var  C,T:array[0..101,0..101] of longint;
     HT,HM,ST,SM,lenT,lenM,toM,toT,meet,tmeet:longint;
     n,m,nowT,nowM:longint;
     check:boolean;
procedure nhap;
 var i,j,u,v:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m);
   readln(HT,ST,HM,SM);
   for i:=1 to n do
    for j:=1 to n do
     if i=j then C[i,j]:=0
      else C[i,j]:=maxC;
   for i:=1 to m do
    begin
     readln(u,v,C[u,v]);
     C[v,u]:=C[u,v];
    end;
 end;
procedure init;
 var   i,j:longint;
 begin
  for i:=1 to n do
   for j:=1 to n do
     T[i,j]:=j;
 end;
procedure FLoyd;
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
procedure process;
 var    i,minn:longint;
 begin
  minn:=maxC;
  lenT:=C[ht,st];
  lenM:=C[hm,Sm];
  check:=false;
  tmeet:=0;
  meet:=0;
  for i:=1 to n do
   if (i<>ht) and (i<>hm)  then
    begin
     tot:=C[ht,i];
     tom:=C[hm,i];
     nowT:=C[ht,i]+C[i,st];
     nowM:=C[hm,i]+C[i,sm];
     if (nowT=lenT) and (nowM=lenM) and (toT=Tom) and (toT<minn) then
      begin
       check:=true;
       meet:=i;
       tmeet:=toT;
       minn:=toT;
      end;
    end;
  end;
procedure traceT;
  var u,k,v:longint;
  begin
   u:=ht;
   k:=meet;
   v:=st;
   write(u,' ');
  repeat
     u:=T[u,k];
     write(u,' ');
  until u=k;
  if k=v then exit;
   repeat
     k:=T[k,v];
     write(k,' ');
   until k=v;

  writeln;
  end;
procedure traceM;
 var u,k,v:longint;
  begin
   u:=hm;
   k:=meet;
   v:=sm;
   write(u,' ');
   repeat
     u:=T[u,k];
     write(u,' ');
   until u=k;
   if k=v then exit;
   repeat
      k:=T[k,v];
    write(k,' ');
      until k=v;
  writeln;
  end;
procedure xuat;
 begin
  if check=false then writeln('NO')
   else
    begin
     writeln('YES');
     writeln(lenT);
     TraceT;
     writeln(lenM);
     traceM;
     writeln(meet);
     writeln(tmeet);
    end;
  end;
BEGIN
 nhap;
 init;
 FLOYD;
 process;
 xuat;
END.
