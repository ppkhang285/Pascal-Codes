program CONNECT;
uses crt;
const fi='CONNECT.INP';fo='CONNECT.OUT';
var a,x:array[1..100] of string;
    d:array[1..100] of boolean;
    n:integer;
    max:string;
procedure nhap;
 var i:integer;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do readln(a[i]);
  close(input);
 end;
procedure swap(var x,y:string);
 var k:string;
 begin
  k:=x;
  x:=y;
  y:=k;
 end;
procedure sucess;
 var i,j:integer;
 begin
  for i:=1 to n-1 do
   for j:=i+1 to n do if a[i]<a[j] then swap(a[i],a[j]);
  for i:=1 to n-1 do
   for j:=i+1 to n do
    if (a[i][1]=a[j][1]) and (length(a[i])>length(a[j]))  then swap(a[i],a[j]);
  for i:=1 to n-1 do
   for j:=i+1 to n do
    if (a[i][1]=a[j][1]) and (a[i][length(a[i])]<a[j][length(a[j])]) then swap(a[i],a[j]);
  for i:=1 to n-1 do
   for j:=i+1 to n do
    if (a[i][1]=a[j][1])  and (a[i][2]<a[j][length(a[j])]) then swap(a[i],a[j]);
  end;
procedure xuat;
 var i:integer;
 begin
  assign(output,fo);rewrite(output);
   for i:=1 to n do write(a[i]);
  close(output);
end;
BEGIN
 nhap;
 sucess;
 xuat;
END.
