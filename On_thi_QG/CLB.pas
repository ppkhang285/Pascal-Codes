const fi='CLB.INP';fo='CLB.OUT';
var A,B:array[0..10000] of longint;
    N,res:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(N);
   for i:=1 to n do
         readln(a[i],b[i]);
  close(input);
 end;
procedure sort(L,R:longint);
 var X,w,i,j:longint;
 begin
  i:=L;
  j:=R;
  X:=B[L+random(R-l)];
  repeat
   while B[i]<x do inc(i);
   while X<B[j] do dec(j);
   if i<=j then
    begin
     w:=a[i];
     a[i]:=a[j];
     a[j]:=w;
     w:=b[i];
     b[i]:=b[j];
     b[j]:=w;
     inc(i);
     dec(j);
    end;
  until i>j;
  if L<j then sort(L,j);
  if i<R then sort(i,R);
 end;
procedure process;
 var i,X,Y:longint;
 begin
  res:=2;
  X:=B[1]-1;
  Y:=B[1];
  for i:=2 to n do
   begin
    if Y<A[i] then
     begin
      X:=B[i]-1;
      Y:=B[i];
      res:=res+2;
     end
      else
       begin
        if X<A[i] then
         begin
          res:=res+1;
          X:=Y;
          Y:=B[i];
         end
    end;
 end;
end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(res);
  close(output);
 end;
BEGIN
 nhap;
 sort(1,n);
 process;
 xuat;
END.