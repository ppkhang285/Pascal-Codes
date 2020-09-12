var  a,b:array[0..10000] of longint;
     n:longint;
procedure nhap;
 var i:longint;
 begin
  readln(n);
  for i:=1 to n do read(a[i],b[i]);
 end;
procedure sort(L,R:longint);
 var  i,j,X,W:longint;
 begin
  i:=L;
  j:=R;
  X:=A[L+(R-L)];
  repeat
   while A[i]<x do i:=i+1;
   while x<A[j] do j:=j-1;
   if i<=j then
    begin
     W:=A[i];
     A[i]:=A[j];
     A[j]:=w;
     W:=B[i];
     B[i]:=B[j];
     B[j]:=w;
     i:=i+1;
     j:=j-1;
    end;
  until i>j;
  if L<j then sort(L,j);
  if i<R then sort(i,R);
 end;
procedure bsort(L,R:longint);
 var  i,j,X,W:longint;
 begin
  i:=L;
  j:=R;
  X:=B[L+(R-L)];
  repeat
   while B[i]<x do i:=i+1;
   while x<B[j] do j:=j-1;
   if i<=j then
    begin
     W:=A[i];
     A[i]:=A[j];
     A[j]:=w;
     W:=B[i];
     B[i]:=B[j];
     B[j]:=w;
     i:=i+1;
     j:=j-1;
    end;
  until i>j;
  if L<j then Bsort(L,j);
  if i<R then Bsort(i,R);
 end;
procedure Allsort;
 var  i,now:longint;
 begin
  sORT(1,n);
  now:=1;
  for i:=2 to n do
    if A[i]<>A[i-1] then
     begin
      Bsort(now,i-1);
      now:=i;
     end;
 end;
procedure process;
 var Done,i,res,time:longint;
 begin
  Done:=B[1];
  i:=2;
  res:=0;
  writeln(res);
  while i<=n do
   begin
   Time:=Done+B[i];
   Res:=Time-A[i];
   writeln(res);
   i:=i+1;
   done:=done+B[i-1];
  end;
 end;
BEGIN
 nhap;
 Allsort;
 process;
END.



