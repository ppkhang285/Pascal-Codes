const fi='GRAPH.INP';fo='GRAPH.OUT';
type canh=record
 x,y,ts:integer;
 end;

var e:array[0..100] of canh;
    n,m,nl:integer;
    d,khung:array[0..100] of integer;
procedure nhap;
 var i:integer;
 begin
  assign(input,fi);reset(input);
   readln(n,m);
   for i:=1 to m do
    with e[i] do readln(x,y,ts);
  close(input);
 end;
procedure init;
 var i:integer;
 begin
  for i:=1 to n do d[i]:=i;
 end;
function find(x:integer):integer;
begin
 while (x<>d[x]) do x:=d[x];
 find:=x;
end;
function union(x,y:integer):integer;
begin
 union:=0;
 x:=find(x);y:=find(y);
 if (x=y) then exit;
 if (x<y) then d[y]:=x
  else d[x]:=y;
 union:=1;
end;
procedure sort(dau,cuoi:integer);
 var i,j,g:integer;
     tap:canh;
 begin
  i:=dau;j:=cuoi;
  g:=e[(i+j) div 2].ts;
  while i<=j do
   begin
    while e[i].ts<g do inc(i);
    while g<e[j].ts do dec(j);
    if (i<=j) then
     begin
      tap:=e[i];e[i]:=e[j];e[j]:=tap;
      inc(i);dec(j);
     end;
    end;
 if (dau<j) then sort(dau,j);
 if (i<cuoi) then sort(i,cuoi);
end;
procedure caykhungmin;
 var i,j,nl,t:integer;
 begin
 assign(output,fo);rewrite(output);

  init;
  nl:=n-1;
  j:=0;
  for i:=1 to m do
   begin
    if union(e[i].x,e[i].y)=1 then
     begin
      inc(j);
      khung[j]:=i;
      if (j=nl) then break;
     end;
  end;
 writeln('Edges of MST are');

 t:=0;
 for i:=1 to j do
  begin
   writeln(e[khung[i]].x, ' - ',e[khung[i]].y);
   t:=t+e[khung[i]].ts;
  end;
 writeln('Weight of MST is ',t);
end;
BEGIN
 nhap;
 sort(1,m);
 Caykhungmin;

END.

