const fi='FIBODIVK.INP';fo='FIBODIVK.OUT';
      maxnum=100000;
var a,f:array[0..10000] of longint;
    l:array[0..1000,0..1000] of longint;
    n,s,k,h:longint;
procedure nhap;
 begin
  assign(input,fi);reset(input);
   readln(n,s,k);
  close(input);
 end;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure process;
 var i:longint;
 begin
  f[0]:=0;
  f[1]:=1;
  for i:=2 to n do
   f[i]:=f[i-1]+f[i-2];
  h:=0;
  for i:=s to n do
   begin
    h:=h+1;
    a[h]:=f[i];
   end;
 end;
function sodung(x:longint):longint;
 begin
  x:=x mod k;
  if x>=0 then exit(x) else exit(x+k);
 end;
 procedure QHD;
 var i,j:longint;
 begin
  for j:=0 to k-1 do
   if j=a[1] mod k then l[1,j]:=1
    else l[1,j]:=-maxnum;
  for i:=2 to h do
   for j:=0 to k-1 do
     l[i,j]:=max(l[i-1,j],l[i-1,sodung(j-a[i])]+1);
 end;
procedure truy(i,j:longint);
 begin
  if i=0 then exit;
  if l[i,j]=1+l[i-1,sodung(j-a[i])] then
   begin
    truy(i-1,sodung(j-a[i]));
    write(a[i],' ');
   end
    else
     truy(i-1,j);
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   truy(h,0);
  close(output);
 end;
BEGIN
 nhap;
 process;
 QHD;
 xuat;
END.