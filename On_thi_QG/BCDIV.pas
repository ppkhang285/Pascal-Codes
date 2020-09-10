const fi='BCDIV.INP';fo='BCDIV.OUT';
var F:array[0..100,0..100] of longint;
    n,k,t,i:longint;
function Pro(n,k:longint):longint;
 var i,j:longint;
 begin
  fillchar(f,sizeof(f),0)
  F[1,1]:=1;
  for i:=1 to n do
   F[i,i]:=1;
  for i:=2 to n do
   for j:=1 to k do
    if j<=i then
    F[i,j]:=F[i-1,j-1]+j*F[i-1,j];
   exit(F[n,k]);
 end;
BEGIN
 assign(input,fi);reset(input);
 assign(output,fo);rewrite(output);
  readln(T);
  for i:=1 to T do
   begin
    readln(n,k);
    writeln(pro(n,k));
   end;
 close(input);close(output);
END.


