const fi='MANG.INP';fo='MANG.OUT';
var  cha:array[0..1000] of longint;
     choo:array[0..1000] of boolean;
     n,m,gr:longint;
function Find(u:longint):longint;
 begin
  while cha[u]<>u do u:=cha[u];

 end;
procedure Merge(u,v:longint);
 var x,y,w:longint;
 begin
  x:=Find(u);
  y:=Find(v);
  if x=y then exit
   else
    begin
     if x>y then
      begin
       w:=x;
       x:=y;
       y:=w;
      end;
     cha[y]:=x;
      gr:=gr-1;
    end;
 end;
procedure process;
 var i,u,v,x:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);

   readln(n,m);
    gr:=n;
   for i:=1 to n do cha[i]:=i;
   for i:=1 to m do
    begin
     readln(u,v);
     merge(u,v);
    end;
   writeln(gr-1);
   fillchar(choo,sizeof(choo),true);
   for i:=2 to n do

    if (find(i)<>1) and (choo[find(i)]) then
     begin
      writeln('1 ',i);
      choo[cha[i]]:=false;
     end;
  closE(input);close(output);
 end;
BEGIN
 process;
END.