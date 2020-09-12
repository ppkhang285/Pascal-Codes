const fi='QUERY.INP';fo='QUERY.OUT';
var A,Max:array[0..100000] of longint;
    N,m,S:longint;
procedure init;
 begin
  fillchar(A,sizeof(A),0);
  s:=trunc(sqrt(n-1));
 end;
procedure update(i,u:longint);
 var first,last,k,j:longint;
 begin
  a[i-1]:=u;
  i:=i-1;
  k:=i div s;
  first:=k*s;
  last:=(k+1)*s-1;
  for j:=first to last do
   if Max[k]<A[j] then Max[k]:=A[j];
 end;
function Query(L,R:longint):longint;
 var Kl,Kr,res,i:longint;
 begin
  L:=L-1;
  R:=R-1;
  Kl:=L div s;
  Kr:=R div s;
  res:=-1000000;
  for i:=L to ((Kl+1)*s-1) do
   if res<A[i] then res:=a[i];
  for i:=(Kr*s) to R do
   if res<A[i] then res:=a[i];
  for i:=Kl+1 to Kr-1 do
   if res<Max[i] then res:=Max[i];
  exit(res);
 end;
procedure process;
 var i,j,z:longint;
     cmd:char;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m);
   init;
   for z:=1 to m do
    begin
     read(Cmd);
     readln(i,j);
     if cmd='S' then update(i,j)
      else writeln(Query(i,j));
    end;
  close(input);
  close(output);
 end;
BEGIN
 process;
END.
