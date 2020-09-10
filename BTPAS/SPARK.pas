const fi = 'SPARK.INP';fo = 'SPARK.OUT';
      MaxN = 100000;
type Point = record
        x,y:longint;
        S:longint;
        Shoot:array[1..105] of integer;
     end;
var A:array[1..105] of Point;
    Q:array[0..105] of integer;
    D:array[0..105] of real;
    Free:array[0..105] of boolean;
    N,First,Last:longint;
procedure nhap;
 var i,j:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                for i:=1 to n do
                 begin
                        with A[i] do
                         begin
                                read(X,Y,S);
                                for j:=1 to N-1 do read(Shoot[j]);
                                readln;
                         end;
                 end;
 end;

function distance(i,j:integer):real;
 begin
        exit( sqrt( sqr(A[i].X - A[j].X) + sqr(A[i].y - A[j].Y ) ));
 end;
procedure init;
 var i:longint;
 begin
        for i:=1 to n do D[i]:=MaxN;
        for i:=1 to A[1].S do D[ A[1].Shoot[i] ]:= distance(1, A[1].Shoot[i]);
        D[1]:=0;
        Fillchar(Free,sizeof(free),True);
        Free[1]:=false;
 end;
procedure solve;
 var Arrow, i,U,v,target:integer;
     min:real;
 begin
        repeat
                u:=0;min:=maxN;
                for i:=1 to n do
                        if (Free[i]) and (D[i]<min) then
                         begin
                                min:= D[i];
                                u:=i;
                         end;
                Free[u]:=false;
                if (u = 0) then exit;
                Arrow:=0;
                For v:=1 to n-1 do
                 begin
                        Target:= A[u].Shoot[v];
                        if (Free[Target] = false) then continue;
                        Arrow:=Arrow+1;
                        if (D[target] > D[u] + distance(u,target)) then
                         begin
                                D[target]:= D[u] + distance(u,target);
                                Q[target]:= u;
                         end;
                        if (Arrow >= A[u].S) then break;
                 end;
        until false;
 end;
procedure xuat;
 var i:integer;
 begin
        For i:=1 to N do writeln(D[i]:0:10);
 end;
BEGIN
        nhap;
        init;
        Solve;
        Xuat;
END.
