const fi='COLOREC2.INP';fo='COLOREC2.OUT';
var   F:array[0..100] of longint;
      a:array[-200..200,-200..200] of byte;
      res,n:longint;
procedure nhap;
 var     i,j,c,x,y:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n);
   fillchar(a,sizeof(a),0);
   for i:=1 to n do
    begin
     readln(x,y,C);
     A[x,y]:= 1 shl (c-1);
    end;
 end;
procedure process;
 var i,j,c,k:longint;
 begin
  For i:=-200 to 200 do
   for j:=-200 to i-1 do
    begin
     fillchar(F,sizeof(f),0);
     For k:=-200 to 200 do
      if (A[i,k] And A[j,k] and A[i,k])<>A[j,k] then
       begin
        c:=A[i,k] or A[j,k];
        res:=res+F[15-c];
        F[c]:=F[c]+1;
       end;
    end;
 end;
procedure xuat;
 begin
  writeln(res);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.
 process;
