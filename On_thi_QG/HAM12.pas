const fi='HAM12.INP';fo='HAM12.OUT';
       maxn=100000;
var   n,m,k:longint;
      a:array[0..1000] of ansistring;
      T:string;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m,k);
   readln(T);
   T:=T+T;
   n:=n+n;
   for i:=1 to k do
    begin
     readln(A[i]);
     A[i]:=a[i];
    end;
 end;
procedure process;
 var res,z,i,j,x,mi,d:longint;
     check:ansistring;
 begin
  res:=maxn;
  for z:=1 to k do
   begin
    for j:=1 to n-m+1 do
     begin
      Check:=copy(T,j,m);
      check:=check;
      mi:=0;
      for D:=1 to m do
          if check[d]<>A[z][d] then mi:=mi+1;
      if mi<res then res:=mi;
     end;
   end;
  writeln(res);
  end;
BEGIN
 nhap;
 process;
END.
