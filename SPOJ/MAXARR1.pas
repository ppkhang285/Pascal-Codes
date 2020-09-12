const fi='MAXARR1.INP';fo='MAXARR1.OUT';
var   D,L,a:array[0..100001] of longint;
      maxn,n,t:longint;
procedure nhap;
 var i:longint;
 begin
  maxn:=-10000000;
  assign(input,fi);reset(input);
   readln(t);
   for i:=1 to t do
    begin
     readln(D[i]);
     if D[i]>maxn then maxn:=d[i];
    end;
  close(input);
 end;
procedure process;
 var i:longint;
 begin
  A[0]:=0;
  A[1]:=1;
  for i:=1 to (maxn-1) div 2 do
   begin
    A[2*i]:=A[i];
    A[2*i+1]:=A[i]+A[i+1];
   end;
  L[0]:=0;
  L[1]:=1;
  for i:=2 to maxn do
   if A[i]>L[i-1] then L[i]:=A[i] else L[i]:=L[i-1];
 end;
procedure xuat;
 var i:longint;
 begin
  assign(output,fo);rewrite(output);
   for i:=1 to t do
    writeln(L[D[i]]);
   close(output);
  end;
BEGIN
 nhap;
 process;
 xuat;
END.

