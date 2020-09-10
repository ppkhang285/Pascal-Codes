const fi='POLAREA.INP';fo='POLAREA.OUT';
type point=record
      x,y:longint;
      end;
var  p1,p2,p3:point;
     P:array[0..10000] of point;
     N:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n);
   for i:=1 to n do
    readln(p[i].x,p[i].y);
 end;
procedure process;
 var res,D1,D2,D3:real;
     count,i:longint;
 begin
   res:=0;
   P[n+1]:=P[1];
   for i:=1 to n do
    res:=res+(p[i+1].x-p[i].x)*(P[i+1].y+P[i].y);
   res:=res/2;
   if res<0 then write('CCW ')
    else write('CW ');
   write(abs(res):0:1);
 end;
BEGIN
 nhap;
 process;
END.

