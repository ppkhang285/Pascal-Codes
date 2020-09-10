const fi='FordBellman.inp';
      fo='FordBellman.out';
var  c:array[1..1000,1..1000] of longint;
     d,trace:array[1..1000] of longint;
     n,m,s,t,i,j,u,v,k,f:longint;
procedure nhap;
 var  u,i,v,k:longint;
 begin
    assign(input,fi);reset(input);
    assign(output,fo);rewrite(output);
    readln(n,m,s,f);
    for u:=1 to n do
        for v:=1 to n do
                if u=v then c[u,v]:=0 else c[u,v]:=maxint;
     for i:=1 to m do
        begin
            readln(u,v,k);
            c[u,v]:=k;
        end;
 end;
procedure init;
var i:longint;
begin
    for i:=1 to n do
        begin
            d[i]:=c[s,i];
            trace[i]:=s;
        end;
end;
procedure  Ford_BellMan;
var  count,v,u:longint;
     stop:boolean;
begin
    count:=0;
    repeat
        stop:=true;
        for u:=1 to n do
                for v:= 1 to n do
                        if d[v] > d[u]+c[u,v] then
                        begin
                            d[v]:=d[u]+c[u,v];
                            trace[v]:=u;
                            stop:=false;
                        end;
        inc(count);
    until stop or (count>=n-2);
end;
procedure truy;
var i,j:longint;
begin
    if d[f]=maxint then
        begin
            writeln('No way');
            exit;
        end;
    i:=s;
    j:=f;
    writeln(D[F]);
    while i<>j do
    begin
        write(j,'<--');
        j:=trace[j];
    end;
    write(s);
end;
begin
    nhap;
    init;
    ford_bellman;
    truy;
    close(input);
    close(output);
end.


