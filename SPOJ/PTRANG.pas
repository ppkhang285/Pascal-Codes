const fi='PTRANG.INP';fo='PTRANG.OUT';
         maxn=10000000;
var A,F,s:array[0..10000] of longint;
    N,L:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(N,L);
   for i:=1 to n do
    begin
     readln(a[i]);
     s[i]:=S[i-1]+A[i];
    end;
  close(input);
 end;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
function min(x,y:longint):longint;
 begin
  if x<y then exit(x) else exit(y);
 end;
procedure process;
 var i,j:longint;
 begin
  F[1]:=L-S[1];
  F[0]:=0;
  for i:=2 to n do F[i]:=maxn;
  for i:=2 to n do
   for j:=0 to i-1 do
    if (S[i]-S[j]<=L) then
      F[i]:=min(F[i],max(F[j],L-S[i]+S[j]));
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(F[n]);
  close(output);
 end;
BEgin
 nhap;
 process;
 xuat;
END.