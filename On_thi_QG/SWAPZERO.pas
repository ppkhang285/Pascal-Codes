const fi='SWAPZERO.INP';fo='SWAPZERO.OUT';
var VT,a,road:array[0..100005] of longint;
    Ok:array[0..1000005] of boolean;
    N,res:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);

   readln(N);
   for i:=1 to n+1 do
    begin
     read(a[i]);
     if eoln(input) then readln;
    end;
 end;
procedure change(u:longint);
 var x,y,g,w:longint;
 begin
  x:=VT[0];
  y:=VT[u];
  VT[0]:=y;
  VT[u]:=x;
  g:=a[x];
  w:=a[y];
  a[x]:=w;
  a[y]:=g;
 end;
procedure process;
 var  lie,i,nc:longint;

 begin
  lie:=0;
  res:=0;
  fillchar(ok,sizeof(ok),false);
  for i:=1 to n+1 do
   begin
    VT[a[i]]:=i;
    if VT[a[i]]=a[i]+1 then
     begin
      ok[a[i]]:=true;
      lie:=lie+1;
     end;
   end;
  repeat
   begin
    nc:=VT[0]-1;
    if nc=0 then
      for i:=2 to n do
           if not ok[a[i]] then
            begin
              nc:=a[i];
              break;
            end;
    change(nc);
    if VT[nc]=nc+1 then
      begin
        ok[nc]:=true;
        lie:=lie+1;
      end;
    res:=res+1;
    road[res]:=nc;
   end;
  until (lie>=n-1) and (vt[0]=1);
 end;
procedure xuat;
 var i:longint;
 begin
  assign(output,fo);rewrite(output);
  writeln(res);
  for i:=1 to res do write(road[i],' ');
 end;
BEGIN
 nhap;
 process;
 xuat;
END.
