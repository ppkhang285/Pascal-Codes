const fi='ANIMAL.INP';fo='ANIMAL.OUT';
        maxC=1000000000;
var T,trace,d:array[0..200] of longint;
    C:array[0..200,0..200] of longint;
    free:array[0..200] of boolean;
   n,A,B:longint;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure nhap;
 var i,j,u,v:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,A,B);
   for i:=1 to n do
    for j:=1 to n do
     if i=j then C[i,j]:=0 else C[i,j]:=maxC;
   for i:=1 to n do read(t[i]);
   readln;
   while not eof(input) do
    begin
     readln(u,v);
     C[u,v]:=abs(t[v]-t[u]);
     C[v,u]:=C[u,v];
    end;
 end;
procedure init;
 var      i:longint;
 begin
  for i:=1 to n do
   begin
    d[i]:=C[A,i];
    trace[i]:=A;
   end;
 end;
procedure DIJ;
 var u,min,i,v:longint;
 begin
  fillchar(free,sizeof(free),true);
  trace[A]:=0;
  free[A]:=false;
  repeat
   u:=0;min:=maxC;
   for i:=1 to n do
    if (free[i]) and (d[i]<min) then
     begin
      u:=i;
      min:=d[i];
     end;
   free[U]:=false;
   if (u=0) or (u=B) then exit;
   for v:=1 to n do
    if (free[v]) and (D[v]>max(D[u],C[u,v])) then
     begin
      D[v]:=max(D[u],C[u,v]);
      trace[v]:=u;
     end;
    until false;
 end;
procedure traceR(u:longint);
 begin
  if u<=0 then exit
   else
    begin
     traceR(trace[u]);
     write(u,' ');
    end;
 end;
procedure xuat;
 begin
  if free[B]=true then write('-1')
   else
    begin
     writeln(D[B]);
     traceR(B);
    end;
  end;
BEGIN
 nhap;
 init;
 DIJ;
 xuat;
END.
