const fi='VALIA.INP';fo='VALIA.OUT';
var  a,b:array[0..1000] of longint;
     L,chon:array[0..100,0..100] of longint;
     n,w:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n,w);
   for i:=1 to n do
    readln(A[i],B[i]);
  close(input);
 end;
procedure process;
 var i,t,k:longint;
 begin
  for i:=1 to n do
   for t:=0 to W do
    begin
     L[i,t]:=L[i-1,t];
     if t>=a[i] then
      for k:=1 to (t div A[i]) do
       if L[i,t]<(L[i-1,t-a[i]*k]+k*B[i]) then
        begin
         L[i,t]:=L[i-1,t-A[i]*k]+k*B[i];
         Chon[i,t]:=k;
        end;
    end;
 end;
procedure trace(i,t:longint);
 begin
  if i>0 then
   begin
    trace(i-1,t-A[i]*chon[i,t]);
    if chon[i,t]>0 then writeln(i,' ',chon[i,t]);
   end;
 end;
BEGIN
 nhap;
 process;
 assign(output,fo);rewrite(output);
 trace(n,w);
END.