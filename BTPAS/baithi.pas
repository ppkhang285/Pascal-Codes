program dithi;
uses crt;
const fi='THI.INP';fo='THI.OUT';
var dem,tong,i,a,b,c,d:longint;
function ktnt(x:longint):boolean;
 var y,v:longint;
 begin
  ktnt:=true;
  if x<=1 then begin ktnt:=false;exit;end;
  if (x>1) and (x<=3) then exit;
  y:=trunc(sqrt(x));
  for v:=2 to y do if (x mod v)=0 then ktnt:=false;
 end;
function UCLN(x,y:longint):longint;
 begin
  while x<>y do
   if x>y then x:=x-y else y:=y-x;
 end;
begin
 assign(input,fi);reset(input);
 assign(output,fo);rewrite(output);
  read(input,a,b);
  dem:=0;
  tong:=0;
  for i:=a+1 to b-1 do if ktnt(i) then
   begin
    dem:=dem+1;
    tong:=tong+sqr(i);
   end;
  writeln(output,dem,' ',tong);
  tong:=tong mod 100;
  writeln(output,tong*30102014);
  c:=a div UCLN(a,b);
  d:=b div UCLN(a,b);
  writeln(output,a,'/',b,'=',c,'/',d);
 close(input);close(output);
end.