const fi='QUERYMIN.INP';fo='QUERYMIN.OUT';
var  a,min:array[0..100000] of longint;
     n,m,s:longint;
procedure init;
 var i:longint;
 begin
  s:=trunc(sqrt(n));
  for i:=0 to s+1 do min[i]:=1000000000;
 end;
procedure Update(i,v:longint);
 var k,j,first,last:longint;
 begin
  i:=i-1;
  a[i]:=v;
  k:= i div s;
  if v<min[k] then min[k]:=v
   else
    begin
     first:=k*s;
     last:=(k+1)*s-1;
     for j:=first to last do
      if (a[j]>0) and (a[j]<min[k]) then min[k]:=v;
    end;
 end;
function Query:longint;
 var minx,i:longint;
 begin
  minx:=1000000000;
  for i:=0 to s+1 do
   if (min[i]>0) and (min[i]<minx) then minx:=min[i];
  if minx=1000000000 then minx:=0;
  exit(minx);
 end;
procedure process;
 var i,x,y:longint;
     g:char;
     cmd:string;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m);
   init;
   for i:=1 to m do
    begin
     cmd:='';
     repeat
      read(g);
      cmd:=cmd+g;
      if cmd='QRM' then
       begin
        readln;
        break;
       end;
     until g=' ';
     if cmd='AGN ' then
      begin
       readln(x,y);
       update(x,y);
      end
       else writeln(query);
     end;
  close(input);
  close(output);
 end;
BEGIN
 process;
END.