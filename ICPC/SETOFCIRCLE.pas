var    a,b:array[0..200001] of int64;
       n:longint;
       res:int64;
procedure nhap;
 var i:longint;
     w:int64;
 begin
   readln(n);
   for i:=1 to n do
    begin
     readln(a[i],w);
     B[i]:=w+a[i];
     A[i]:=A[i]-w;
    end;
 end;
procedure sort(l,r:longint);
 var i,j:longint;
     x,q:int64;
 begin
  i:=l;
  j:=r;
  x:=b[(l+r) div 2];
  repeat
   while b[i]<x do inc(i);
   while x<b[j] do dec(j);
   if i<=j then
    begin
     q:=b[i];
     b[i]:=b[j];
     b[j]:=q;
     q:=a[i];
     a[i]:=a[j];
     a[j]:=q;
     inc(i);dec(j);
    end;
  until i>j;
 if l<j then sort(l,j);
 if i<r then sort(i,r);
end;

procedure process;
 var i,j,y:longint;
 begin
  res:=0;y:=b[1];
   for i:=2 to n do
      if a[i]<y then
       begin
       inc(res);
       y:=b[i+1];
       end;
 end;
procedure xuat;
 begin
   write(n-res);
 end;
BEGIN
 nhap;
 sort(1,n);
 process;
 xuat;
END.

