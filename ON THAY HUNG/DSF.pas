const fi='DSF.INP';fo='DSF.OUT';
var Par:array[0..100000] of  longint;
    Lt,n,m:longint;
procedure init;
 var i:longint;
 begin
  for  i:=1 to n do par[i]:=-1;
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
procedure Merge(u,v:longint);
 var x,y,w:longint;
 begin
  x:=find(u);
  y:=find(v);
  if x=y then exit;
  if par[y]<par[x] then
   begin
    w:=y;
    y:=x;
    x:=w;
   end;
  par[x]:=par[x]+par[y];
  par[y]:=x;
  LT:=Lt-1;
 end;
procedure process;
 var i,u,v:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m);
   init;
   LT:=n;
   for i:=1 to m do
    begin
     readln(u,v);
     Merge(u,v);
     writeln(Lt);
   end;
 close(input);close(output);
 end;
BEGIN

 process;
END.
