const fi='MISSINGNUMBERS.INP';fo='MISSINGNUMBERS.OUT';
var A:array[0..200] of boolean;
    X,n:integer;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n);
   fillchar(A,sizeof(a),false);
   for i:=1 to n do
    begin
     readln(x);
     A[x]:=TRue;
    end;
  closE(input);
 end;
procedure process;
 var good:boolean;
     i:longint;
 begin
  assign(output,fo);rewrite(output);
  good:=true;
  For i:=1 to x do
   if A[i]=false then
    begin
     good:=false;
     writeln(i);
    end;
  if good then writeln('good job');
 end;
BEGIN
 nhap;
 process;
END.