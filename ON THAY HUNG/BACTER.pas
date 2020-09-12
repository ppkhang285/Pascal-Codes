const fi='BACTER.INP';fo='BACTER.OUT';
var a,sum:array[0..1000,0..1000] of int64;
    s,n,m:longint;
procedure init;
 begin
  s:=trunc(sqrt(n));
  fillchar(sum,sizeof(sum),0);
  fillchar(a,sizeof(a),0);
 end;
procedure update(i,j,v:longint);
 var k1,k2:longint;
 begin
  i:=i-1;
  j:=j-1;
  a[i,j]:=A[i,j]+v;
  k1:=i div s;
  k2:=j div s;
  Sum[k1,k2]:=Sum[k1,k2]+v;
 end;
function do1(x1,y1,x2,y2:longint):longint;
 var now,i,j:longint;
 begin
  now:=0;
  for i:=x1 to x2 do
   for j:=y1 to y2 do
    now:=now+a[i,j];
   exit(now);
 end;
function do2(x1,y1,x2,y2:longint):longint;
 var i,j,now,kl,kl2,kr2:longint;
 begin
  now:=0;
  kl:=x1 div s;
  kl2:=y1 div s;
  kr2:=y2 div s;
  for i:=x1 to x2 do
   for j:= y1 to  (kl2+1)*s-1 do
    now:=now+a[i,j];
  for i:=x1 to x2 do
   for j:= kr2*S to y2 do
    now:=now+a[i,j];
  for j:= kl2+1 to kr2-1 do
   now:=now+sum[kl,j];
  exit(now);
 end;
function do3(x1,y1,x2,y2:longint):longint;
 var  i,j,now,kl,kl1,kr1:longint;
 begin
  now:=0;
  kl:=y1 div s;
  kl1:=x1 div s;
  kr1:=x2 div s;
  for i:=x1 to (kl1+1)*s-1 do
   for j:= y1 to  y2 do
    now:=now+a[i,j];
  for i:= kr1*S to x2 do
   for j:= y1 to y2 do
    now:=now+a[i,j];
  for j:= kl1+1 to kr1-1 do
   now:=now+sum[j,kl];
  exit(now);
 end;
function do4(x1,y1,x2,y2:longint):longint;
 var now,kl1,kl2,kr1,kr2,i,j:longint;
 begin
  now:=0;
  kl1:=x1 div s;
  kr1:=x2 div s;
  kl2:=y1 div s;
  kr2:=y2 div s;
  for i:=x1 to (kl1+1)*s-1 do
   for j:= y1 to  (kl2+1)*s-1 do
    now:=now+a[i,j];
  for i:=kr1*s to x2 do
   for j:= kr2*S to y2 do
    now:=now+a[i,j];
  for i:=kl1+1 to kr1-1 do
   for j:=kl2+1 to kr2-1 do
    now:=now+sum[i,j];
  exit(now);
 end;
function Query(x1,y1,x2,y2:longint):int64;
 var kl1,kl2,kr1,kr2,i,j:longint;
     res:int64;
 begin
  x1:=x1-1;
  x2:=x2-1;
  y1:=y1-1;
  y2:=y2-1;
  kl1:=x1 div s;
  kl2:=y1 div s;
  kr1:=x2 div s;
  kr2:=y2 div s;
  res:=0;
  if (kl1=kr1) and (kl2=kr2) then res:=do1(x1,y1,x2,y2)
   else
    if kl1=kr1 then res:=do2(x1,y1,x2,y2)
     else
       if kl2=kr2 then res:=do3(x1,y1,x2,y2)
       else res:=do4(x1,y1,x2,y2);
   exit(res);
 end;
procedure process;
 var i,j,x1,x2,y1,y2,x,y,z:longint;
     cmd:char;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m);
   init;
   for i:=1 to m do
    begin
     read(cmd);
     if cmd='S'then
      begin
       readln(x,y,z);
       update(x,y,z);
      end
       else
        begin
         readln(x1,y1,x2,y2);
         writeln(query(x1,y1,x2,y2));
        end;
    end;
  close(input);close(output);
 end;
BEGIN
 process;
END.
