const fi='COMNET.INP';fo='COMNET.OUT';
type road=record
      x,y:longint;
      ts:longint;
   end;
var g,e:array[0..1000001] of road;
    n,m,q,t,k:longint;
    par:array[0..100001]of longint;
procedure swap(var q,w:longint);
 var h:longint;
 begin
  h:=q;
  q:=w;
  w:=h;
 end;
procedure openfile;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
 end;
procedure closefile;
 begin
  close(input);
  close(output);
 end;
procedure init;
 var i:longint;
 begin
   for i:=1 to n do par[i]:=-1;
 end;
function find(u:longint):longint;
 begin
  if par[u]<0 then exit(u)
   else
    begin
     par[u]:=find(par[u]);
     exit(par[u]);
    end;
  end;
procedure merge(u,v:longint);
 var x,y:longint;
 begin
  x:=find(u);
  y:=find(v);
  if x=y then exit;
  if par[y]<par[x] then
    swap(x,y);
  par[x]:=par[x]+par[y];
  par[y]:=x;
 end;
procedure check;
 var i,j:longint;
 begin
  i:=find(e[k].x);
  j:=find(e[k].y);
  if i=j then writeln('YES')
   else writeln('NO');
 end;
procedure process;
 var  L,i,j,a,s:longint;
 begin
  readln(t);
  L:=0;
  while L<=t do
   begin
    L:=L+1;
    readln(N,M,Q);
    for i:=1 to m do
      readln(e[i].x,e[i].y,e[i].ts);
    for i:=1 to Q do
      begin
        read(k,S);
        g:=e;
        for j:=1 to s do
          begin
            read(A);
            read(g[a].ts);
          end;
        readln;
        init;
        for j:=1 to m do
          if g[j].ts<g[k].ts then
            merge(g[j].x,g[j].y);
        check;
     end;
    end;
 end;
BEGIN
 openfile;
 process;
 closefile;
END.
