uses math;
const fi='CSTICKS.INP';fo='CSTICKS.OUT';
var  F:array[0..5000,0..1008] of longint;
     C:array[0..5000] of longint;
     n,k,T:longint;
function process:longint;
 var  h,L,ans1,ans2:longint;
 begin
  fillchar(F,sizeof(f),0);
  F[n-2,1]:=sqr(C[n-1]-C[n-2]);
  k:=k+8;
  for h:=n-3 downto 1 do
   F[h,1]:=min(sqr(C[h]-C[h+1]),F[h+1,1]);
   for h:=n-3 downto 1 do
   for L:=2 to k do
   // for h:=n-3 downto 1 do
    begin
     ans1:=sqr(c[h]-c[h+1])+F[h+2,L-1];
   if (n-h+1)>3*L then  ans2:=F[h+1,L-1]
    else ans2:=1000000;

     F[h,L]:=min(ans1,ans2);
    end;
   exit(F[1,k]);
  end;
procedure data;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(T);
   for i:=1 to T do
    begin
     readln(k,n);
     for j:=1 to n do read(C[j]);
     readln;
     writeln(process);
    end;
  close(input);
  close(output);
 end;
BEGIN
 data;
END.