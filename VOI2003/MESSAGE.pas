const fi='MESSAGE.INP';fo='MESSAGE.OUT';
var a,b:array[0..100,0..100] of char;
    f:array[0..100,0..100] of longint;
    n,m:longint;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure nhap;
 var i,j:longint;
     s:char;
 begin
  assign(input,fi);reset(input);
   readln(n,m);
   for i:=1 to n do
    for j:=1 to m do
     begin
      read(S);
      a[i,j]:=s;
     end;
   readln;
   for i:=1 to n do
    for j:=1 to m do read(b[i,j]);
  closE(input);

  end;
procedure process;
 var i,j,k,z:longint;
 begin
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
   for j:=1 to m do
    for k:=1 to n do
     for z:=1 to m do
      if A[i,j]=B[k,z] then
       F[i,j]:=1+max(F[i-1,j],F[i,j-1]);
  end;
BEGIN
 nhap;

 process
 ;
END.
