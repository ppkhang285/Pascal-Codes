const fi='HINHHOC.INP';fo='HINHHOC.OUT';
var
procedure nhap;
 var
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(a.x,a.y);
   readln(b.x,b.y);
   readln(c.x,c.y);
   readln(d.x,d.y);
 end;
function dis(a,b :point):real;
 begin
  dis:=sprt( (a.x-b.x)*(a.x-b.x)+ (a.y-b.y)*(a.y-b.y));
 end;
function DT(a,b,c :point):int64;
 var F:real;
 begin
  F:=a.x*(c.y-b.y)+ b.x*(a.y-c.y) + c.x*(b.y-a.y);
  exit(F);
 end;
function DisLine(a:point; b,c:point):real;
 begin
  DisLine:=Abs(2*DT(a,b,c) / Dis(b,c));
 end;
function IsStr(a,b,c:point):boolean;
 begin
  if DT(a,b,c)=0 then exit(true)
   else exit(false);
 end;
function IsCW(a,b,c:point):boolean;
 begin
  if DT(a,b,c)>0 then exit(true) else exit(false);
 end;
function IsCUT(a,b,c,d:point):boolean;
 begin
  if (DT(a,c,b)*DT(a,d,b))<0 then exit(true);
  if (DT(a,c,b)=0) and (DT(a,d,b)<>0) then exit(true);
  if (DT(a,c,b)<>0) and (DT(a,d,b)=0) then exit(true);
  exit(false);
 end;
function DTpoly(P: polygon):int64;
 var S:int64;
     i:longint;
 begin
  s:=0;
  P[n+1]:=P[1];
  for i:=1 to n do
   S:=S+(p[i+1].x-P[i].x)*(P[i+1].y+P[i].y);
  exit(S);
 end;
function IsConVex(P:polygon): boolean;
 begin
  P[n+1]:=P[1];
  P[n+2]:=P[2];
  for i:=1 to n-1 do
   begin
    F:=DT(P[i],P[i+1],P[i+2])*DT(P[i+1],P[i+2],P[i+3]);
    if F<0 then exit(false);
   end;
  exit(true);
 end;