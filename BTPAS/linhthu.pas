program linhthu;
uses crt;
const fi='AUCTION.INP';fo='AUCTION.OUT';
var a,b,dem,i:longint;
function ktnt(x:longint):boolean;
 var y,v:longint;
 begin
  ktnt:=true;
  if x<=1 then begin ktnt:=false;exit;end;
  if (x>1) and (x<=3) then exit;
  y:=trunc(sqrt(x));
  for v:=2 to y do if (x mod v)=0 then ktnt:=false;
 end;
function ktdao(x:longint):boolean;
 var s,m:string;
     n,l:integer;
 begin
  m:='';
  ktdao:=false;
  str(x,s);
  l:=1;
  for n:=length(s) downto 1 do
   begin
    m:=m+s[n];
   end;
  if s=m then ktdao:=true;
 end;
begin
 assign(input,fi);reset(input);
  readln(a,b);
 close(input);
 dem:=0;
 for i:=a to b do
 if ktnt(i) and ktdao(i) then dem:=dem+1;
 assign(output,fo);rewrite(output);
  write(dem);
 close(output);
end.
