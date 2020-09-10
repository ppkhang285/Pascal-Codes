const fi='COLOREC.INP';fo='COLOREC.OUT';
type mau=record
       p:boolean;
       co:longint;
end;
var a:array[0..400,0..400] of longint;
 //   color:array[0..4,0..4] of longint;
    F:array[0..100] of longint;
    n:longint;
procedure nhap;
 var i,u,v,c:longint;
 begin
  fillchar(a,sizeof(a),0);
  fillchar(f,sizeof(f),0);
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n);
   for i:=1 to n do
    begin
     readln(u,v,c);
     A[u+200,v+200]:=1 shl (c-1);
     end;
 end;
procedure process;
 var res,z,i,j,k,x,y,c:longint;
 begin
  res:=0;
  for i:=0 to 400 do
   for j:=0 to i do
    begin
     //fillchar(color,sizeof(color),0);
     for k:=0 to 400 do
      if (A[i,k] and A[j,k] and A[i,k] <>A[j,k]) then
       begin
         c:=a[i,k] or A[j,k];
         res:=res+F[15-c];
         F[c]:=f[c]+1;
       end;
    end;
   writeln(res);
 end;
BEGIN
 nhap;
 process;
END.
