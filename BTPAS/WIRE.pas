program WRIRE;
uses crt;
const fi='WIRE.INP';fo='WIRE.OUT';
var tb,n,i,k:longint;
    a:array[1..10000000] of longint;
function kt(x,y:longint):boolean;
 var v,m,l:longint;
 begin
  m:=0;
  l:=0;
  for v:=1 to n do begin l:=a[v] div x;m:=m+l;end;
  if m=y then kt:=true else kt:=false;
 end;

begin
 assign(input,fi);reset(input);
  readln(n,k);
  for i:=1 to n do readln(a[i]);
 close(input);
 tb:=0;
 for i:=1 to n do tb:=tb+a[i];
 tb:=tb div k;
 while tb<>0 do
   if kt(tb,k) then break
    else tb:=tb-1;
 assign(output,fo);rewrite(output);
  write(tb);
 close(output);
end.

