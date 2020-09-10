const fi='EXP.INP';fo='EXP.OUT';
var
procedure nhap;
 var
 begin
  assign(input,fi);reset(input);
   readln(m);
   for i:=1 to m do
    readln(b[i]);
    readln(n);
    for i:=1 to n do read(p[i]);
  close(input);
 end;
procedure process;
 var
 begin
  for i:=1 to n do
   for j:=1 to m do
    if length(b[j])<=i then
      begin
       for k:=i downto 1 do

