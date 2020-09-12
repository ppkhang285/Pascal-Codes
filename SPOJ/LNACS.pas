const fi='LNACS.INP';fo='LANACS.OUT';
var    a,b:array[0..1000] of longint;
       F:array[-1..1000,-1..1000] of longint;
       n,m:longint;
procedure nhap;
 var    i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,m);
   for i:=1 to n do readln(a[i]);
   for i:=1 to m do readln(b[i]);
  close(input);
 end;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure process;
 var i,j:longint;
 begin
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
   if a[i]=b[1] then F[i,1]:=1 else F[i,1]:=F[i-1,1];
  for i:=1 to m do
   if a[1]=b[i] then F[1,i]:=1 else F[1,i]:=F[1,i-1];
  for i:=1 to n do
   for j:=1 to m do
    begin
     F[i,j]:=max(F[i-1,j],max(F[i,j-1],F[i-1,j-1]));
     if a[i]=b[j] then F[i,j]:=max(F[i-2,j-2]+1,f[i,j]);
    end;
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(F[n,m]);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.