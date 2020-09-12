const fi='QBSEQ.INP';fo='QBSEQ.OUT';
        maxn=1000000000;
var  a:array[0..1001] of longint;
     L:array[0..1001,0..100] of longint;
     N,K,S:longint;
procedure nhap;
 var   i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,k);
   for i:=1 to n do
    begin
     read(a[i]);
     a[i]:=a[i] mod k;
     s:=(S+a[i]) mod k;
    end;
  close(input);
 end;
function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;
function sodung(x:longint):longint;
 begin
  x:=x mod k;
  if x<0 then exit(x+k) else exit(x);
 end;
procedure process;
 var i,j:longint;
 begin
  for i:=1 to k-1 do
    L[0,i]:=maxn;
  for i:=1 to n do
   for j:=0 to k-1 do
    L[i,j]:=min(L[i-1,j],L[i-1,sodung(j-a[i])]+1);
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(n-L[n,s mod k]);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.