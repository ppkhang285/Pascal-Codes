const fi='BANGSO.INP';fo='BANGSO.OUT';
var
    n:longint;
    f:int64;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(Y);
 end;
procedure nhap;
 var  i,a:longint;
      f1,g1,g:int64;
 begin
  assign(input,fi);reset(input);
   readln(N);
    read(a);
   f:=a;
   g:=-1;
   for i:=2 to n do
    begin
     read(a);
     f1:=max(f,max(a+g,a));
     g1:=max(g,max(f-a,-a));
     f:=f1;
     g:=g1;
    end;
  close(input);
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(F);
  close(output);
 end;
BEGIN
 nhap;
 xuat;
END.
