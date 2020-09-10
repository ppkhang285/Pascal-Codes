const fi='VODIVIDE.INP';fo='VODIVIDE.OUT';
var a,b,choose,res,id:array[0..10000] of longint;
    f:array[0..1000,0..1000] of longint;
    n:longint;
    check:array[0..1000] of boolean;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do read(a[i]);
   readln;
   for i:=1 to n do read(b[i]);
  close(input);
  for i:=1 to n do id[i]:=i;
 end;
procedure sort(l,r:longint);
 var w,i,j,x:longint;
 begin
  i:=l;
  j:=r;
  X:=A[l+random(r-l)];
  repeat
   while A[i]>x do inc(i);
   while x>A[j] do dec(j);
   if i<=j then
    begin
     w:=a[i];
     a[i]:=a[j];
     a[j]:=w;
     w:=B[i];
     b[i]:=b[j];
     b[j]:=w;
     w:=id[i];
     id[i]:=id[j];
     id[j]:=w;
     inc(i);
     dec(j);
    end;
  until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
end;
procedure QHD;
 var i,s:longint;
 begin
  F[1,0]:=0;
  for i:=2 to n do
   for s:=1 to i div 2 do
    if F[i-1,s]>(F[i-1,s-1]+b[i]) then
     F[i,s]:=F[i-1,s]
      else
       begin
        F[i,s]:=F[i-1,s-1]+b[i];
       end;
 end;
procedure trace;
 var i,s,h,t:longint;
 begin
  i:=n;
  s:=n div 2;
  h:=0;
  repeat
   if F[i,s]=F[i-1,s] then
     i:=i-1
      else
       begin
        h:=h+1;
        res[h]:=i;
        check[i]:=true;
        i:=i-1;
        s:=s-1;
       end;
  until (i<=0) or (S<=0);
  for i:=1 to h do
   begin
    write(id[res[i]],' ');
    t:=res[i];
    repeat
    if t=0 then break;
     t:=t-1;
     if check[t]=false then
      begin
       check[t]:=true;
       break;
      end;
    until false;
    writeln(id[t]);
   end;
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(f[n,n div 2]);

 end;
BEGIN
 nhap;
 sort(1,n);
 QHD;
 xuat;
 trace;
END.