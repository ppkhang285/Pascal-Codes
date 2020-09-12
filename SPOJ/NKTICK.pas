Const fi='NKTICK.INP';fo='NKTICK.OUT';
var a,F,b:array[0..60001] of longint;
    N:longint;
procedure nhap;
 var  i:longint;
 begin
  assign(input,fi);reset(input);
   readln(N);
   for i:=1 to n do read(a[i]);
   for i:=1 to n-1 do read(b[i]);
  close(input);
 end;
function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;
procedure process;
 var           i:longint;
 begin
  F[0]:=0;
  F[1]:=a[1];
  for i:=2 to n do
   F[i]:=min(F[i-1]+A[i],F[i-2]+b[i-1]);
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(f[n]);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.