program DEOLYMPIC;
const fi='PASWAP.INP';fo='PASWAP.OUT';
type mang=array[1..100000] of integer;
var a,w:array[1..100000] of integer;
    count,ik,n:integer;
procedure nhap;
 var i:integer;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do read(a[i]);
  close(input);
 end;
procedure short(var dx,dy:integer);
 var f:integer;
 begin
  f:=dx;
  dx:=dy;
  dy:=f;
 end;

procedure kt(i,j:integer);
 var q:mang;
     h,k,x,y:integer;
     check:boolean;
 begin
  fillchar(q,sizeof(q),0);
  k:=j-i+1;
  h:=0;
  for x:=i to j do
   begin
    h:=h+1;
    q[h]:=a[x];
   end;
  for x:=1 to h-1 do
   for y:=x+1 to h do
    if q[x]>q[y] then short(q[x],q[y]);

  check:=true;
  for x:=1 to k do
   if q[x]<>w[x] then
     check:=false;
  if (check) and (k>count) then
   begin
    ik:=i;
    count:=k;
   end;
 end;
procedure process;
 var i,j:integer;
 begin

    for i:=1 to n do w[i]:=i;
  count:=0;
  for i:=1 to n-1 do
   begin
    j:=i;
   while j<>n do
    begin
     j:=j+1;
     kt(i,j);
    end;
   end;
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(ik);
   writeln(count);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.
