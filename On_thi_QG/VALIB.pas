const fi ='VALIB.INP'; fo ='VALIB.OUT';
var  L:array[0..100,0..100] of longint;
     A,W:array[0..100] of longint;
     n,m:longint;
procedure nhap;
 var i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                For i:=1 to n do read(W[i]);
                readln;
                For i:=1 to n do read(A[i]);
                readln;
                readln(M);
 end;
function max(x,y:longint):longint;
 begin
     if x>y then exit(x) else exit(y);
 end;
procedure QHD;
 var i,j:longint;
 begin
     For i :=1 to n do
        For j:= 0 to M do
                If (W[i]<=j) then L[i,j]:= max(L[i-1,j-W[i]] +A[i] , L[i-1,j])
                 else L[i,j]:= L[i-1,j];
     writeln(L[n,m]);
 end;
procedure trace(i,t:longint);
 begin
  if i>0 then
   begin
    if (L[i,t] = L[i-1,t-W[i]] +A[i]) then
     begin
        trace(i-1,t-W[i]);
        writeln('chon goi ', i,',w= ',w[i],',V=',A[i]);
     end
     else trace(i-1,t);
   end;
 end;

BEGIN
 nhap;
 QHD;
 trace(n,m);
END.