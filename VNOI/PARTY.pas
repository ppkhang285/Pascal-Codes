const fi='PARTY.INP';fo='PARTY.OUT';
type friend=record
        x,y,ts:longint;
        end;
var    E:array[0..1000] of friend;
       a,Tmp:array[0..1000] of longint;
       n,m,q,co:longint;
procedure nhap;
 var    i,u,v:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
        readln(n,m);
        for i:=1 to n do read(a[i]);
        readln;
        for i:=1 to m do
                begin
                        readln(u,v);
                        E[i].x:=u;
                        E[i].y:=v;
                        E[i].ts:=A[u]+A[v];
                end;
 end;
procedure sort(L,R:longint);
 var  i,j,x:longint;
      H:friend;
 begin
  i:=L;
  j:=R;
  x:=E[L+random(R-L)].ts;
  repeat
        while E[i].ts<x do i:=i+1;
        while x<E[j].ts do j:=j-1;
        if i<=j then
                begin
                        H:=E[i];
                        E[i]:=E[j];
                        E[j]:=H;
                        i:=i+1;
                        j:=j-1;
                end;
  until i>j;
  if L<j then sort(L,j);
  if i<R then sort(i,R);
 end;
procedure process;
 var   res,z,i,u,v:longint;
 begin
        Readln(Q);
        for Z:=1 to q do
                begin
                        res:=0;
                        tmp:=A;
                        Readln(Co);
                        i:=0;
                        while (i<=m) and (Co>0) do
                                begin
                                        i:=i+1;
                                        u:=E[i].x;
                                        v:=e[i].y;
                                        if (tmp[u]+tmp[v])<=Co then
                                                begin
                                                        Co:=Co-(tmp[u]+tmp[v]);
                                                        if tmp[u]=0 then res:=res-1;
                                                        if tmp[v]=0 then res:=res-1;
                                                        tmp[u]:=0;
                                                        tmp[v]:=0;
                                                        res:=res+2;
                                                end;
                                end;
                        writeln(res);
                end;
 end;
BEGIN
        nhap;
        sort(1,m);
        process;
END.
