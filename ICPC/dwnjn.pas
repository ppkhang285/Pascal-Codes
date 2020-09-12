var
procedure sort(L,R:longint);
 var i,j,x,w:longint;
 begin
  i:=l;
  j:=r;
  X:A[L+(R-L)];
  repeat
   while A[i]<X do i:=i+1;
   while X<A[j] do j:=j-1;
   if i<=j then
    begin
     W:=A[i];
     a[i]:=A[j];
     A[j]:=w;
     w:=id[i];
     id[i]:=id[j];
     id[j]:w;
     i:=i+1;
     j:=j-1;
    end;
  until i>j;
  if L<j then sort(L,j);
  if i<r then sort(i,R);
 end;
procedure init;
 var
 begin
  sort(1,n);

function doit(L,R,X,,Y:longint);
 var
 begin