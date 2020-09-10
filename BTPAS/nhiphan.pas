program ct;
uses crt;
const fi='NP.INP';fo='NP.OUT';
var a:array[1..1000] of integer;
    x,n:integer;
procedure nhap;
 var i:integer;
 begin
  assign(input,fi);reset(input);
  readln(n,x);
  for i:=1 to n do read(a[i]);
  close(input);
 end;
procedure kttt;
 var i:integer;
 begin
 assign(output,fo);rewrite(output);
  for i:=1 to n do if x=a[i] then begin write(output,'Co');exit;end;
 write(output,'Khong');
 close(output);
 end;
procedure ktnp;
 var dau,giua,cuoi:integer;
 begin
  dau:=1;
  cuoi:=n;
  assign(output,fo);rewrite(output);
  while dau<=cuoi do
   begin
    giua:=(dau+cuoi) div 2;
    if x=a[giua] then begin write(output,'Co');exit;end;
    if x<a[giua] then cuoi:=giua-1;
    if x>a[giua] then dau:=giua+1;
   end;
  write(output,'Khong');
  close(output);
 end;
begin
 nhap;
 ktnp;
end.