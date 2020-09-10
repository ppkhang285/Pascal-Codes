const fi='CAMERA.INP';fo='CAMERA.OUT';
type point=record
          x,y:real;
end;
var  CanT,CMR,CanP:array[0..100] of point;
     m,n,h,k:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(m,n,h,k);
   for i:=1 to h do
    readln(CanT[i].x,CanT[i].y,CanP[i].x,CanP[i].y);
   for i:=1 to k do
    readln(CMR[i].x,CMR[i].y);
 end;
function max(x,y:real):real;
 begin
  if x>y then exit(x) else exit(y);
 end;
function min(x,y:real):real;
 begin
  if x<y then exit(x) else exit(y);
 end;
function ktra(xo,yo,xa,ya,xb,yb:real):boolean;
 begin
  if (min(xa,xb)<=xo) and (xo<=max(xa,xb))
	     and (min(ya,yb)<=yo) and (yo<=max(ya,yb))
  then Ktra:=true else Ktra:=false;
 end;
function checkmate(cm1,cm2,can1,can2:point):boolean;
 var M:point;
     A1,A2,B1,B2,C1,C2,D,Dx,Dy,thuoc,F,maxx,maxy,minx,miny:real;
     kt1,kt2:boolean;
 begin
  A1:=cm1.y-cm2.y;
  B1:=cm2.x-cm1.x;
  C1:=cm1.x*cm2.y-cm2.x*cm1.y;
  A2:=can1.y-can2.y;
  B2:=can2.x-can1.x;
  C2:=can1.x*can2.y-can2.x*can1.y;
  D:=A1*B2-A2*B1;
  Dx:=C2*B1-C1*B2;
  Dy:=A2*C1-A1*C2;
  if (D=Dx) and (Dx=Dy) and (D=0) then exit(true)
   else if D=0 then exit(true)
    else
     begin
      M.x:=Dx / D;
      M.y:=Dy / D;
      if ((M.x =Can1.x) and (M.y = Can1.y)) or ((M.x=can2.x) and (M.y=Can2.y )) then exit(true); //giao diem la dinh cua vat can
   //
      kt1:=ktra(Dx/D,Dy/D,cm1.x,cm1.y,cm2.x,cm2.y);
      kt2:=ktra(Dx/D,Dy/D,can1.x,can1.y,can2.x,can2.y);
       if kt1 and kt2 then exit(false) else
        exit(true);
     end;
 end;
function checker(diem:point):boolean;
 var  i,j,mate:longint;
      pi,pj:point;
 begin
  checker:=false;
  for i:=1 to k do
   begin
    mate:=0;
    for j:=1 to h do
     begin
      pi:=CanT[j];
      pj:=CanP[j];
      if checkmate(diem,CMR[i],pi,pj)=false then mate:=mate+1;
      pi.y:=CanP[j].y;
      pj.y:=CanT[j].y;
      if checkmate(diem,CMR[i],pi,pj)=false then mate:=mate+1;
     end;
    if mate=0 then exit(true);
    end;
   end;
procedure process;
 var diem:point;
     i,j,L:longint;
     checkcan:boolean;
 begin
  for i:=m downto 1 do
   begin
    for j:=1 to n do
     begin
      checkcan:=false;
      //check xem co la vat can
      for L:=1 to h do
        if (i>=CanT[L].y) and (i<=CanP[L].y) and (j>=CanT[L].x) and (j<=CanP[L].x) and
           (i-1>=CanT[L].y) and (i-1<=CanP[L].y) and (j-1>=CanT[L].x) and (j-1<=CanP[L].x)
             then
          begin
            checkcan:=true;
            break;
          end;
      if checkcan then
          begin
            write('*');
            continue;
          end;
     //  dinh 1
     diem.x:=j;
     diem.y:=i;
     if not checker(diem) then
       begin
         write('1');
        continue;
       end;
     // dinh 2
     diem.x:=j-1;
      if not checker(diem) then
        begin
          write('1');
          continue;
        end;
     //dinh 3
     diem.x:=j;
     diem.y:=i-1;
     if not checker(diem) then
        begin
          write('1');
          continue;
        end;
     // dinh 4
     diem.x:=j-1;
     if not checker(diem) then
        begin
          write('1');
          continue;
        end;
    write('0');
   end;
  writeln;
  end;
end;
BEGIN
 nhap;
 process;
END.
