const fi='G2W.INP';fo='G2W.OUT';
        oo=10000000;
var  A,B,D:array[0..10000] of longint;
     C:array[0..10000,0..10000] of longint;
     Free:array[0..10000] of boolean;
     DD:array[0..10000,0..10000] of boolean;
     n,m,p,q:longint;
procedure nhap;
 var  i,j,v,u:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m,p,q);
   for i:=1 to p do read(a[i]);
   readln;
   for i:=1 to q do read(b[i]);
   readln;
   For i:=1 to n do
    for j:=1 to n do
     if i=j then C[i,j]:=0
      else C[i,j]:=oo;
   fillchar(DD,sizeof(DD),false);
   for i:=1 to m do
    begin
     readln(u,v,C[u,v]);
     DD[u,v]:=true;
    end;
 end;
procedure init(go:longint);
 var  i:longint;
 begin
  for i:=1 to n do
                 D[i]:=C[go,i];

 end;
procedure DIJSTRA(go:longint);
 var   u,min,v,i:longint;
 begin
  repeat
        u:=0;min:=oo;
        for i:=1 to n do
                if (free[i]) and (d[i]<min) then
                        begin
                                min:=d[i];
                                u:=i;
                        end;
        Free[u]:=false;
        if (u=0) or (u=go) then exit;
        for v:=1 to n do
                if (Free[v]) and (DD[u,v]) and (D[v]>D[u]+C[u,v]) then
                                D[v]:=D[u]+C[u,v];
  until false;
 end;
procedure process;
 var i:longint;
 begin
        fillchar(free,sizeof(free),true);
        for i:=1 to p do Free[a[i]]:=false;
        Init(1);
        DIJSTRA(n);
        write(D[n],' ');
        fillchar(free,sizeof(free),true);
        for i:=1 to q do Free[B[i]]:=false;
        Init(n);
        DIJSTRA(1);
        writeln(D[1]);
 end;
BEGIN
 nhap;
 process;
END.
