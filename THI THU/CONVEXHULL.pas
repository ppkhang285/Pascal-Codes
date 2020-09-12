const fi='CONVEXHULL.INP';fo='CONVEXHULL.OUT';
type point=record
       x,y:longint;
       end;
       polygon=array[0..100000] of point;
var     P,EG:polygon;
        Sup,Sdw:array[0..100000] of longint;
        n1,n2,n:longint;
        res:real;
procedure nhap;
 var    i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n);
   for i:=1 to n do
    readln(p[i].x,p[i].y);
 end;
procedure sort(L,R:longint);
 var i,j:longint;
     F:longint;
     Q:point;
 begin
  i:=L;
  j:=R;
  F:=P[(L+r) div 2].y;
  repeat
   while P[i].y<F do inc(i);
   while F<P[j].y do dec(j);
   if i<=j then
    begin
     Q:=P[i];
     P[i]:=P[j];
     P[j]:=Q;
     inc(i);dec(j);
    end;
  until i>j;
  if L<j then sort(L,j);
  if i<R then sort(i,R);
 end;
procedure sort2(L,R:longint);
 var i,j,F:longint;
     Q:point;
 begin
  i:=L;
  j:=R;
  F:=P[(L+R) div 2].x;
  repeat
   while P[i].x<F do inc(i);
   while F<P[j].x do dec(j);
   if i<=j then
    begin
     Q:=P[i];
     P[i]:=P[j];
     P[j]:=Q;
     inc(i);dec(j);
    end;
   until i>j;
   if L<j then sort2(L,j);
   if i<R then sort2(i,R);
 end;
function DT(a,b,c :point):real;
 var F:real;
 begin
  F:=a.x*(c.y-b.y)+ b.x*(a.y-c.y) + c.x*(b.y-a.y);
  exit(F/2);
 end;
procedure Search_Up_ConVex;
 var i:longint;
 begin
      for i:=3 to n do
   begin
    if DT(P[Sup[n1-1]],P[Sup[n1]],P[i])>0 then
     begin
      n1:=n1+1;
      Sup[n1]:=i;
     end
      else
       begin
        while (DT(P[Sup[n1-1]],P[sup[n1]],P[i])<=0) and (n1>1) do
         dec(n1);
        inc(n1);
        Sup[n1]:=i;
       end;
   end;
 end;
procedure SEARCH_DOWN_CONVEX;
 var i:longint;
 begin
   for i:=3 to n do
   begin
    if DT(P[Sdw[n2-1]],P[Sdw[n2]],P[i])<0 then
     begin
      n2:=n2+1;
      Sdw[n2]:=i;
     end
      else
       begin
        while (DT(P[Sdw[n2-1]],P[sdw[n2]],P[i])>=0) and (n2>1) do
         dec(n2);
        inc(n2);
        Sdw[n2]:=i;
       end;
   end;
 end;
procedure process;
 var note,i:longint;
 begin
  sort(1,n);
  note:=1;
  for i:=2 to n do
   if (P[i].y<>P[note].y) and (i-note>1) then
    begin
     sort2(note,i-1);
     note:=i;
    end
    else
      if (P[i].y<>P[note].y) and (i-note=1) then note:=i;
  sup[1]:=1;
  Sup[2]:=2;
  Sdw[1]:=1;
  Sdw[2]:=2;
  n1:=2;
  n2:=2;
 end;
function DTpoly(P: polygon;n:longint):real;
 var S:real;
     i:longint;
 begin
  s:=0;
  P[n+1]:=P[1];
  for i:=1 to n do
   S:=S+(p[i+1].x-P[i].x)*(P[i+1].y+P[i].y);
  exit(S/2);
 end;
procedure FIND_SQR;
 var F,H,i:longint;
 begin
  for i:=1 to n1 do EG[i]:=P[Sdw[i]];
  F:=n1;
  h:=n2-1;
  while h>1 do
   begin
     F:=F+1;
     EG[F]:=P[sup[h]];
     h:=h-1;
   end;
  res:=abs(DTPoly(EG,n1+n2-2));
 end;
procedure xuat;
 var i:longint;
 begin
  writeln(n1+n2-2);
  writeln(res:0:1);
  for i:=1 to n1+n2-2 do writeln(EG[i].x,' ',EG[i].y);

 end;
BEGIN
 nhap;
 process;
 SEARCH_UP_CONVEX;
 SEARCH_DOWN_CONVEX;
 FIND_SQR;
 xuat;
END.


