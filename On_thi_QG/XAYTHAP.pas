const fi='XAYTHAP.INP';fo1='XAYTHAP1.INP';fo2='XAYTHAP2.OUT';
var D,L,R,C,id,truoc,Sl:array[0..1000] of longint;
    n:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
  readln(N);
  for i:=1 to n do
   readln(D[i],R[i],C[i]);
  close(input);
 end;
procedure swap(var x,y:longint);
 var q:longint;
 begin
  q:=x;
  x:=y;
  y:=q;
 end;
procedure Sorts(var x,y,z:longint);
begin
 if x<y then swap(x,y);
 if x<z then swap(x,z);
 if y<z then swap(y,z);
end;
procedure init;
 var i:longint;
 begin
  for i:=1 to n do
   id[i]:=i;
 end;
procedure sortsize;
 var  i:longint;
 begin
  for i:=1 to n do
   Sorts(D[i],R[i],C[i]);
 end;
procedure sort;
 var i,j,z,u,now:longint;
 begin
  for i:=1 to n-1 do
   for j:=i+1 to n do
    if D[i]<D[j] then
     begin
      swap(D[i],D[j]);
      swap(R[i],r[j]);
      swap(C[i],C[j]);
      swap(id[i],id[j]);
     end;
   now:=D[1];
   u:=1;
   D[n+1]:=-1;
   for z:=2 to n+1 do
    if now<>D[z] then
     begin
      for i:=u to z-2 do
       for j:=i+1 to z-1 do
         if R[i]<R[j] then
           begin
            swap(D[i],D[j]);
            swap(R[i],r[j]);
            swap(C[i],C[j]);
            swap(id[i],id[j]);
           end;
     now:=D[z];
     u:=z;
 end;
 end;
procedure trace1(i:longint);
 begin
  if i>0 then
   begin
    trace1(truoc[i]);
    writeln(id[i],' ',D[i],' ',R[i],' ',C[i],' ');
   end;
  end;
procedure proc1;
 var maxnow,i,j,nut:longint;
 begin
  assign(output,fo1);rewrite(output);
  fillchar(L,sizeof(L),0);
  fillchar(truoc,sizeof(truoc),0);
  for i:=1 to n do
   begin
    L[i]:=1;
    for j:=1 to i-1 do
     if (D[i]<=D[j]) and (R[i]<=R[j]) and (L[i]<L[j]+1) then
      begin
       L[i]:=L[j]+1;
       Truoc[i]:=j;
      end;
   end;
   Maxnow:=-100000000;
  for i:=1 to n do
   if L[i]>maxnow then
    begin
     maxnow:=L[i];
     nut:=i;
    end;
  writeln(maxnow);
  Trace1(nut);
  close(output);
 end;
procedure Trace2(i:longint);
 begin
  if i>0 then
   begin
    trace2(truoc[i]);
    writeln(id[i],' ',D[i],' ',R[i],' ',C[i]);
   end;
 end;
procedure proc2;
 var maxnow,i,j,nut:longint;
 begin
  assign(output,fo2);rewrite(output);
  fillchar(L,sizeof(L),0);
  fillchar(truoc,sizeof(truoc),0);
  for i:=1 to n do
   begin
    L[i]:=C[i];
    Sl[i]:=1;
    for j:=1 to i-1 do
     if (D[i]<=D[j]) and (R[i]<=R[j]) and (L[i]<L[j]+C[i]) then
      begin
         L[i]:=L[j]+C[i];
         Truoc[i]:=j;
         SL[i]:=SL[j]+1;
      end;
   end;
 maxnow:=-100000000;
 for i:=1 to n do
  if L[i]>maxnow then
   begin
    Maxnow:=L[i];
    nut:=i;
   end;
 writeln(Sl[nut]);
 Trace2(nut);
 close(output);
end;
BEGIN
 nhap;
 init;
 sortsize;
 sort;
 proc1;
 proc2;
END.