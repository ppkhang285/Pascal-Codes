const fi='BL1.INP';fo='BL1.OUT';
var  isprime:array[0..1000000] of boolean;
     a:array[0..1000000] of longint;
     n,k,res,h:longint;
procedure nhap;
 begin
  assign(input,fi);reset(input);
   readln(n,k);
  close(input);
 end;
procedure eratos;
 var  i,j:longint;

 begin
  for i:=1 to n do isprime[i]:=true;
  isprime[0]:=false;
  isprime[1]:=false;
  for i:=2 to trunc(sqrt(n)) do
   begin
    j:=i*i;
    while j<=n do
     begin
       isprime[j]:=false;
       j:=j+i;
     end;
   end;
 end;
function Binary(i:longint):boolean;
 var l,r,mid:longint;
 begin
  l:=1;
  r:=h;
  repeat
   mid:=(l+r) div 2;
   if (i<>mid) and (a[mid]=(a[i]+k)) then exit(true);
   if (a[mid]>(a[i]+k)) then r:=mid-1;
   if (a[mid]<(a[i]+k)) then l:=mid+1;
  until l>r;
  exit(false);
 end;
procedure process;
 var i:longint;
 begin
  h:=0;
  for i:=2 to n do
   if isprime[i] then
    begin
     inc(h);

     a[h]:=i;
    end;
  res:=0;
  for i:=1 to h do
   if binary(i) then res:=res+1;
end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(res);
  close(output);
 end;
BEGIN
 nhap;
 eratos;
 process;
 xuat;
END.
