const fi='RUNGKHUNG.INP';fo='RUNGKHUNG.OUT';
var
procedure nhap;
 var
 begin
  assign(input,fi);reset(input);
   readln(n,m);
   for i:=1 to n do
    readln(E[i].x.E[i].y,E[i].ts);
  close(input);
 end;
procedure Sort1(L,R:longint);
 var t:canh;
     i,j,x:longint;
 begin
  i:=L;
  j:=R;
  X:=E[L-random(R-L)].ts;
  repeat
   while E[i].ts<x do inc(i);
   while x<E[j].ts then dec(j);
   if i<=j then
    begin
     T:=E[i];
     E[i]:=E[j];
     E[j]:=T;
     inc(i);
     dec(j);
    end;
  until i>j;
  if L<j then sort1(L,j);
  if i<R then sort1(i,R);
 end;
procedure init;
 var
 begin
  for  i:=1 to n do par[i]:=-1;
  fillchar(re,sizeof(re),true);
 end;
function Find(u:longint):longint;
 begin
  if par[u]<0 then exit(u)
   else
    begin
     par[u]:=Find(par[u]);
     exit(par[u]);
    end;
 end;
function Merge(u,v:longint);
 var x,y,w:longint;
 begin
  x:=Find(u);
  y:=Find(v);
  if x=y then exit(false);
  if par[y]<par[x] then
   begin
    w:=y;
    y:=x;
    x:=y;
   end;
  par[x]:=par[x]+par[y];
  par[y]:=x;
  exit(true);
 end;
procedure sort2(L,R:longint);
 var t:canh;
     i,j,x:longint;
 begin
  i:=L;
  j:=R;
  X:=Par[E[L+random(R-L)].x];
  repeat
   while Par[E[i].x]<x do inc(i);
   while x<Par[E[j].x] do dec(j);
   if i<=j then
    begin
     T:=E[i];
     E[i]:=E[j];
     E[j]:=T;
     inc(i);
     dec(j);
    end;
  until i>j;
  if L<j then sort2(L,j);
  if i<R then sort2(i,R);
 end;
procedure process;
 var
 begin
  for i:=1 to m do
   begin
    check:=merge(e[i].x,e[i].y);
    if check=fasle then re[e[i].x,e[i].y]:=false;
   end;
procedure process1;
 var  i:longint;
 begin
  for i:=1 to n do
   if par[i]<0 then par[i]:=i;
 end;
function findmin:longint;
 var
 begin
  res:=0;
  for i:=1 to m do
   if re[e[i].x,e[i].y] then res:=res+e[i].ts;
  exit(res);
 end;
procedure xuat;
 var
 begin
  assign(output,fo);rewrite(output);
   writeln(findmin);
   k:=0;
   repeat
    k:=k+1;
    write(par[e[k].x]);
    repeat
     k:=k+1;
     if re[e[k].x,e[k].y] then
       write(e[k].x,' ',e[k].y)





