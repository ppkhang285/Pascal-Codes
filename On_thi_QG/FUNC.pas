const fi='FUNC.INP';fo='FUNC.OUT';
var   x,y,maxin:longint;
      q,w,B:int64;
      F:array[0..501] of int64;
      G:array[0..500,0..500] of longint;
      Fio:array[0..500,0..500] of int64;
procedure open_file;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
 end;
function UCLN(a, b: int64):longint;
 var x,y,r: int64;
 Begin
  x:= b;
  y:= a;
  while y <> 0 do
    begin
      r:= x mod y;
      x:= y;
      y:= r;
    end;
    exit(x);
End;
procedure FFIBO;
 var  i,j:longint;
 begin
  fillchar(g,sizeof(g),0);
  fillchar(f,sizeof(f),0);
  F[1]:=1;
  F[2]:=1;
  for i:=3 to maxin do
   F[i]:=(F[i-1] mod B+F[i-2] mod B) mod B ;
  for i:=1 to maxin do
   for j:=1 to maxin do
    G[i,j]:=UCLN(F[i],F[j]) mod B;
 end;
Function Find(x,y:longint):int64;
 var i,j:longint;
 begin
  fillchar(Fio,sizeof(fio),0);
  Fio[1,0]:=1;
  Fio[0,1]:=1;
  for i:=1 to x do
   Fio[i,0]:=i;
  for i:=1 to y do
   Fio[0,i]:=i;
  for i:=1 to x do
   for j:=1 to y do
    Fio[i,j]:=(((q*Fio[i-1,j] mod b)+(w*Fio[i,j-1] mod B)) mod B+(G[i,j] mod B)) mod B;
  exit(Fio[x,y] mod B);
 end;
Procedure process;
 var   Z,K:longint;
 begin
  readln(k);
  for Z:=1 to K do
   begin
    readln(x,y,q,w,B);
    if x>y then maxin:=x else maxin:=y;
    FFIBO;
    writeln(Find(x,y));
   end;
 end;
BEGIN
 open_file;
 process;
END.
