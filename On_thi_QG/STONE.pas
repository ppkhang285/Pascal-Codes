const fi='STONE.INP';fo='STONE.OUT';
var  s:array[0..2100,0..2100] of longint;
     a,f:array[0..2100] of longint;
     n,res:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do read(a[i]);
  close(input);
 end;
function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;
function cost(i,j:longint):longint;
 begin
  exit(f[j]-f[i-1]);
 end;
procedure process;
 var i,j,c,k:longint;
 begin
 fillchar(s,sizeof(s),0);
 fillchar(f,sizeof(f),0);
 F[0]:=0;
 F[1]:=A[i];
 for i:=2 to n do F[i]:=F[i-1]+A[i];
 for i:=1 to n-1 do
  for j:=i+1 to n do
   begin
    S[i,j]:=10000000;
   for k:=i to j do
     S[i,j]:=min(S[i,j],S[i,k]+S[k+1,j]+cost(i,j));
   end;
 end;
{procedure truy(i,j:longint);
 begin
  if i=j then exit;
  res:=res+S[i,j];
  if S[i,j-1]<S[i+1,j] then
    truy(i,j-1) else truy(i+1,j);
end; }
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
  // res:=0;
  // truy(1,n);
   //writeln(res);
   writeln(S[1,n]);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.


