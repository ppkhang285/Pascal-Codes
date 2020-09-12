function UCLN(x,y:longint):longint;
 begin
  if (x=0) or (y=0) then exit(0);
  if x mod y=0 then UCLN:=y
   else
    UCLN:=UCLN(y,x mod y);
 end;
procedure nhap;
 var T,x1,y1,x2,y2,i:longint;
 begin
  readln(T);
  for i:=1 to t do
   begin
    readln(x1,y1,x2,y2);
    if UCLN(x1,y1)=UCLN(x2,y2) then writeln('YES')
     else writeln('NO');
   end;
 end;
BEGIN
 nhap;
END.