const f='ROADS.INP';fo='ROAD.OUT';
      maxlong=1000000;
var
procedure nhap;
 var
 begin
  assign(input,fi);reset(input);
   readln(n,m,L);
   for i:=1 to n do
    for j:=1 to n do
     if i=j then
      begin
       C[i,j]:=0;
      end
       else
        begin
         C[i,j]:=maxlong;
         C[j,i]:=maxlong;
        end;
   for i:=1 to m do
    begin
     readln(x,y,C[x,y]);
     C[y,x]:=C[x,y];
      A[x,y]:=true;
      A[y,x]:=true;
      F[x,y]:=C[x,y];
      F[y,x]:=C[x,y];
    end;
  close(input);
 end;
procedure Floyd;
 var
 begin
  for k:=1 to n do
   for i:=1 to n do
    for j:=1 to n do
     if C[i,j]<(C[i,k]+C[k,j]) then
      begin
       C[i,j]:=C[i,k]+C[k,j];
       T[i,j]:=T[i,k];
      end;
 end;
procedure init;
 var
 begin
  for i:=1 to n do
   for j:=1 to n do
    if C[i,j]<>maxlong then
    T[i,j]:=j;
 end;
procedure updatemin;
 var
 begin
  min:=-10000000;
  for u:=1 to n do
   for j:=1 to n do
    if (i<>j) and (A[i,j]) then
     begin
      Z:=d1[u]+dn[v]+F[u,v]
      if (z>=minup) and (z<=minnow) then
       begin
        minnow:=z;
        x:=u;
        y:=v;
       end;
     end;

procedure process;
 var
 begin
  for i:=1 to n do
   begin
    d1[i]:=C[1,i];
    dn[i]:=C[i,n];
   end;




