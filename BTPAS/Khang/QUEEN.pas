const fi='QUEEN.INP';fo='QUEEN.OUT';
var hang,cot:array[1..1000] of longint;
   trai,phai,a:array[0..1000,0..1000] of longint;
   max,m,n:longint;
procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
   readln(m,n);
   for i:=1 to m do
    for j:=1 to n do
     read(a[i,j]);
  close(input);
end;
procedure process;
 var  i,j,spac:longint;
 begin
  fillchar(cot,sizeof(cot),0);
  fillchar(hang,sizeof(hang),0);
  fillchar(trai,sizeof(trai),0);
  fillchar(phai,sizeof(phai),0);

  for i:=1 to m do
   begin
    spac:=0;
    for j:=1 to n do
     spac:=spac+a[i,j];
    hang[i]:=spac;
   end;
 for i:=1 to n do
  begin
   spac:=0;
   for j:=1 to m do
    spac:=spac+a[j,i];
   cot[i]:=spac;
  end;
 for i:=1 to m do
  for j:=1 to n do
   trai[i,j]:=trai[i-1,j-1]+a[i,j];
 for i:=m-1 downto 1 do
  for j:=n-1 downto 1 do
   trai[i,j]:=trai[i+1,j+1];
 for i:=1 to m do
  for j:=1 to n do
   phai[i,j]:=phai[i-1,j+1]+a[i,j];
 for i:=m-1 downto 1 do
  for j:=2 to n do
   phai[i,j]:=phai[i+1,j-1];
end;
procedure tim;
 var i,j,x:longint;
 begin
  max:=-10000000;
  for i:=1 to m do
   for j:=1 to n do
    begin
     x:=hang[i]+cot[j]+phai[i,j]+trai[i,j]-3*a[i,j];
     if x>max then max:=x;
    end;
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(max);
  close(output);
 end;
BEGIN
 nhap;
 process;
 tim;
 xuat;
END.

