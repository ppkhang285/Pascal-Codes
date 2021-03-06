program TOUR;
const
 max=100;
 maxC=10000;
 fi='TOUR.INP';fo='TOUR.OUT';
var
 c:array[1..max,1..max] of Integer;
 d,a:array[1..max] of integer;
 Trace:array[1..max] of Integer;
 Free:array[1..max] of boolean;
 n,S,F,m,k,q,sum:integer;
procedure LoadGraph;
var
 i,m:integer;
 u,v:integer;
begin
 Readln(n,k,m);
 read(a[1]);
 sum:=0;
 for i:=1 to k do read(a[i+1]);
 readln;
 for u:=1 to n do
  for v:=1 to n do
   if u=v then
    begin
   c[u,v]:=0;
   c[v,u]:=0;
    end
   else
    begin
   c[v,u]:=maxC;
   c[u,v]:=maxC;
     end;
 for i:=1 to m do
  begin
 readln(u,v);
  c[v,u]:=1;
  c[u,v]:=1;
  end;
end;
procedure Init;
var
 i:integer;
begin
 for i:=1 to n do
  begin
   d[i]:=c[S,i];
   Trace[i]:=S;
  end;
 Fillchar(Free,Sizeof(free),true);
end;
procedure Dijkstra;
var
 i,u,v:integer;
 min:integer;
begin
 repeat
  u:=0;min:=maxC;
  for i:=1 to n do
   if Free[i] and (d[i]<min) then
    begin
     min:=d[i];
     u:=i;
    end;
  if (u=0) or (u=F) then break;
  Free[u]:=false;
  for v:=1 to n do
   if Free[v] and (d[v]>d[u]+c[u,v]) then
    begin
     d[v]:=d[u]+c[u,v];
     Trace[v]:=u;
    end;
 until False;
end;
procedure PrintResult;
begin
   sum:=sum+d[F];
 end;
BEGIN
 assign(input,fi);reset(input);
 assign(output,fo);rewrite(output);
 LoadGraph;
 for q:=1 to k do
  begin
  S:=a[q];
  F:=a[q+1];
 Init;
 Dijkstra;
 PrintResult;
  end;
  S:=a[k+1];
  F:=a[1];
  Init;
  Dijkstra;
  Printresult;
  writeln(output,sum);
 Close(input);
 Close(output);
END.


