uses math;
const fi='XAUCONC.INP';fo='XAUCONC.OUT';
var a,b:string;
    F:array[0..100,0..100] of longint;
procedure nhap;
 begin
  assign(input,fi);reset(input);
   readln(a);
   readln(b);
  close(input);
 end;
procedure process;
 var i,j:longint;
 begin
  for i:=1 to length(a) do
   for j:=1 to length(b) do
    if A[i]=B[j] then F[i,j]:=F[i-1,j-1]+1
     else F[i,j]:=max(F[i-1,j],F[i,j-1]);
 end;
procedure trace(i,j:longint);
 begin
  if F[i,j]=0 then exit;
  if A[i]=B[j] then
   begin
    trace(i-1,j-1);
    write(A[i]);
   end
    else
     begin
     if F[i,j-1]>F[i-1,j] then trace(i,j-1)
      else trace(i-1,j);
     end;
 end;
BEGIN
 nhap;
 process;
 assign(output,fo);rewrite(output);
  trace(length(A),length(b));
 close(output);
END.
