const fi='APPLE.INP';fo='APPLE.OUT';
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
   read(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y);
   readln;
   readln(n);
   for i:=1 to n do
    readln(p[i].x,p[i].y);
 end;
function DT(r1,r2,r3:point):real;
 begin
  DT:=r1.x*(r3.y-r2.y)+r2.x*(R1.y-R3.y)+r3.x*(R2.y-R1.y);
  DT:=Abs(Dt)/2;
 end;
procedure process;
 var res,D1,D2,D3:real;
     count,i:longint;
 begin
  Res:=DT(p1,p2,p3);
  count:=0;
  for i:=1 to n do
   begin
    D1:=DT(p1,p2,p[i]);
    D2:=DT(p2,p3,p[i]);
    D3:=DT(p3,p1,p[i]);
    if (D1+D2+D3)=res then inc(count);
   end;
   writeln(res:0:1);
   writeln(count);
 end;
BEGIN
 nhap;
 process;
END.
