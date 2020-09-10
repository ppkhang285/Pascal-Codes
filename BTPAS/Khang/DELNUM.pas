const fi='DELNUM.INP';fo='DELNUM.OUT';
var   a:array[1..1000000] of longint;
      n,res:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do read(a[i]);
  close(input);
 end;
procedure process;
 var head,last,kq1,kq2,i:longint;
 begin
  head:=1;
  kq1:=0;
  kq2:=0;
  for i:=2 to n-1 do
   if (a[i]<a[head]) and (a[i]<a[i+1]) then
    inc(kq1)
     else
      head:=i;
 last:=n;
 for i:=n-1 downto 2 do
  if (a[i]<a[last]) and (a[i]<a[i-1]) then
   inc(kq2)
    else
     last:=i;
 if kq1>kq2 then res:=kq1 else res:=kq2;
end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   write(res);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.

