const fi='ROBOT.INP';fo='ROBOT.OUT';
     dx:array[1..8] of integer=(0,0,-1,1,1,-1,-1,1);
     dy:array[1..8] of integer=(-1,1,0,0,-1,-1,1,1) ;
var a:array[0..52,0..52] of integer;
    m,n:integer;
procedure nhap;
 var i,j:integer;
 begin
  assign(input,fi);reset(input);
  readln(n,m);
  for i:=1 to n do
   for j:=1 to m do
    read(a[i,j]);
  close(input);
 end;
procedure DFS(i,j:integer);
 var k,u,v:integer;
     kt:boolean;
 begin
   a[i,j]:=1;
  kt:=false;
  for k:=1 to 8 do
   begin
    u:=i+dx[k];
    v:=j+dy[k];
    if (u>0) and (u<=n) and (v>0) and (v<=m) and (a[u,v]=0) then
     begin
      kt:=true;
      DFS(u,v);
     end;
    end;
   if kt=false then writeln(i,' ',j);
 end;
BEGIN
 nhap;
 assign(output,fo);rewrite(output);
 DFS(1,1);
 close(output);
END.
