program ruou;
uses crt;
const fi='RUOU.INP';fo='RUOU.OUT';
var a,f,r:array[0..10000] of integer;
    n,i,d:integer;
function maxq(x,y,z:integer):integer;
 begin
  maxq:=x;
  if y>maxq then maxq:=y;
  if z>maxq then maxq:=z;
 end;
begin
 assign(input,fi);reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
 close(input);
 f[0]:=0;
 f[1]:=a[1];
 f[2]:=a[1]+a[2];
 for i:=3 to n do
  f[i]:=maxq(f[i-1],f[i-2]+a[i],f[i-3]+a[i]+a[i-1]);
 i:=n;
 while i>0 do
  if f[i]-a[i]=f[i-2] then
   begin
    r[i]:=1;d:=d+1;
    i:=i-2;
   end
   else
   if f[i]-(a[i]+a[i-1])=f[i-3] then
    begin
     r[i-1]:=1;d:=d+2;
     r[i]:=1;
     i:=i-3;
    end
    else i:=i-1;
 assign(output,fo);rewrite(output);
  writeln(f[n]);
  for i:=1 to n do
   if r[i]=1 then write(i,' ');
 close(output);
end.
