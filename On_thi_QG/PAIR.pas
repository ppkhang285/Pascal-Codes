const fi='PAIR.INP';fo='PAIR.OUT';
var
procedure nhap;
 var
 begin
  assign(input,fi);reset(input);
   readln(n,m);
   for i:=1 to n do
    for j:=1 to m do
     read(a[i]);
  close(input);
 end;
procedure BFS(q1,q2,w1,w2:longint);
 var
 begin
  fillchar(F,sizeof(f),0);
  first:=1;
  Last:=0;
  push(q1,q2);
  free[q1,q2]:=false;
  repeat
   u:=pop1;
   v:=pop2;
   for k:=1 to 4 do
    begin
     i:=u+dx[k];
     j:=v+dy[k];
     if (i=w1) and (j=w2) then
      begin
       F[i,j]:=min(F[i-1,i],F[i,j-1],F[i+1],F[F[i,j+1])+1;
       exit;
      end;
     if (i>=0) and (j>=0) and (i<=n+1) and (j<=m+1) and (A[i][j]='.') and (free[i,j]) then
      begin
       Push(i,j);
       F[i,j]:=min(F[i-1,i],F[i,j-1],F[i+1,j],[F[i,j+1])+1;
       free[i,j]:=false;
      end;
     end;
   until First>Last;