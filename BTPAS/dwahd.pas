var a,b,c,i,n:longint;
    f:array[1..100] of longint;
begin
 readln(a,b,c,n);
 f[1]:=1;
 f[2]:=2;
 f[3]:=3;
 for i:=4 to n do
  begin
  if i mod 3=1 then f[i]:=a*f[i-1]+b*f[i-2]+c*f[i-3];
  if i mod 3=2 then f[i]:=b*f[i-1]+c*f[i-2]+a*f[i-3];
  if i mod 3=0 then f[i]:=c*f[i-1]+a*f[i-2]+b*f[i-3];
  end;
  writeln(f[n]);
end.