const fi='MIXUP2V2.INP';fo='MIXUP2V2.OUT';
var F:array[0..20,0..20] of longint;
    A:array[0..20] of longint;
    N,K:longint;
procedure nhap;
 var  i:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(N,K);
   for i:=1 to n do readln(a[i]);
 end;
procedure process;
 var res,i,x,y:longint;
 begin
   fillchar(f,sizeof(F),0);
   for i:=1 to n do
    F[i,1]:=1;
   for i:=2 to n do
     for x:=1 to n do
      for y:=1 to n do
       if (x<>y) and (abs(a[x]-a[y])>k) then
         F[x,i]:=F[x,i]+F[y,i-1];
   res:=0;
   for i:=1 to n do
    res:=res+F[i,n];
  writeln(res);
 end;
BEGIN
 nhap;
 process;
END.