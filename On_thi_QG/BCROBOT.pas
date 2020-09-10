const fi='BCROBOT.INP';fo='BCROBOT.OUT';
       dx:array[1..4] of integer=(0,1,0,-1);
       dy:array[1..4] of integer=(1,0,-1,0);
       base=maxlongint;
var A:array[0..1000] of ansistring;
    free:array[0..1000,0..1000] of boolean;
    F:array[0..1000,0..1000] of longint;
    Quene1,Quene2:array[0..1000000] of longint;
    n,Last,First:longint;
procedure nhap;
 var i,j:longint;
     S:char;
 begin
  assign(input,fi);reset(input);
   readln(N);
   for i:=1 to n do
      readln(a[i]);
  close(input);
 end;
procedure QHD;
 var i,j:longint;
 begin
  F[1,1]:=1;
  For i:=2 to n do
   begin
    If A[i][1]='.' then F[i,1]:=F[i-1,1];
    If A[1][i]='.' then F[1,i]:=F[1,i-1];
   end;
  for i:=2 to n do
   for j:=2 to n do
    if a[i][j]='.' then
     F[i,j]:=(F[i-1,j]+F[i,j-1]) mod base
      else F[i,j]:=0;
 end;
procedure push(i,j:longint);
 begin
  inc(last);
  Quene1[last]:=i;
  Quene2[last]:=j;
 end;
function pop1:longint;
 begin
  pop1:=Quene1[first];
 end;
function pop2:longint;
 begin
  pop2:=Quene2[First];
  inc(First);
 end;
procedure BFS;
  var k,j,i,u,v:longint;
  begin
   First:=1;
   Last:=0;
   push(1,1);
   fillchar(free,sizeof(free),true);
   Free[1,1]:=false;
   repeat
    u:=pop1;
    v:=pop2;
    if (u=n) and (v=n) then exit;
    for k:=1 to 4 do
     begin
      i:=u+dx[k];
      j:=v+dy[k];
      if (i>0) and (j>0) and (i<=n) and (j<=n) and (A[i][j]='.') and (free[i,j]) then
       begin
        push(i,j);
        free[i,j]:=false;
       end;
     end;
   until first>last;
  end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   QHD;
   if F[n,n]<>0 then writeln(F[n,n])
    else
    begin
     BFS;
     If free[n,n] then writeln('INCONCEIVABLE')
      else writeln('THE GAME IS A LIE');
    end;
  close(output);
 end;
BEGIN
 nhap;
 xuat;
END.

