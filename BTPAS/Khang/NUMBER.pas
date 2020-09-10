const fi='NUMBER.INP';fo='NUMBER.OUT';
var f:array[0..1001,0..1001] of ansistring;
    a,b:ansistring;
procedure nhap;
 begin
  assign(input,fi);reset(input);
   readln(a);
   readln(b);
  close(input);
 end;
function maxstr(x,y:ansistring):ansistring;
 var basex,basey:ansistring;
 begin
  basex:=x;
  basey:=y;
  while length(x)<length(y) do x:='0'+x;
  while length(y)<length(x) do y:='0'+y;
  if x>y then exit(basex) else exit(basey);
 end;
procedure process;
 var i,j:longint;
 begin
  for i:=1 to length(a) do
   for j:=1 to length(b) do
    begin
     if a[i]=b[j] then f[i,j]:=f[i-1,j-1]+a[i]
      else
       f[i,j]:=maxstr(f[i,j-1],f[i-1,j]);
    end;
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   write(f[length(a),length(b)]);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.