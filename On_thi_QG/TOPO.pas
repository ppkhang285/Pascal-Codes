CONST
 fi='TOPO.INP';
 fo='TOPO.OUT';
 maxC=10000;
VAR a:array[1..1000,1..1000]of boolean;
        n,m,i,u,v:longint;
    deg:array[1..10000]of longint;
    c:array[1..1000]of longint;
    free:array[1..1000]of boolean;
Procedure Init;
Begin
 fillchar(deg,sizeof(deg),0);
 fillchar(a,sizeof(a),false);
 for i:=1 to n do
    a[i,i]:=false;
 fillchar(free,sizeof(free),true);
End;
Procedure TOPO;
var dem,min:longint;
Begin
 dem:=0;
 Repeat
 inc(dem);
 min:=maxC; u:=0;
 for i:=n downto 1 do
        If free[i] and (deg[i]<=min) then
                begin
                   min:=deg[i];
                   u:=i;
                end;
 If u=0 then break;
 free[u]:=false;
 c[u]:=dem;
 for i:=1 to n do
  If a[u,i] then dec(deg[i]);
 Until false;
End;
BEGIN
 assign(input,fi);reset(input);
 assign(output,fo);rewrite(output);
 readln(n,m);
 Init;
 for i:=1 to m do
        begin
        readln(u,v);
        inc(deg[v]);
        a[u,v]:=true;
        end;
 TOPO;
 for i:=1 to n do writeln(c[i]);
 close(input);close(output);
END.
