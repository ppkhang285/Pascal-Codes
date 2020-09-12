const fi='AMSSEQ.INP';fo='AMSSEQ.OUT';
var   A,F:array[-10..10000] of longint;
      n,k:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,k);
   for i:=1 to n do read(a[i]);
 end;
procedure process;
 var i,j,max,res:longint;
 begin
  res:=-10000000;
  for i:=1 to n do
   begin
    F[i]:=a[i];
    max:=-10000000;
    for j:=i-k to i-1 do
      if F[j]>max then max:=F[j];
    F[i]:=F[i]+max;
    if F[i]>res then res:=F[i];
   end;
  writeln(res);
 end;
BEGIN
 nhap;
 process;
END.
