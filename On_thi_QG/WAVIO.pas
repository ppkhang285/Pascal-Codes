const fi='WAVIO.INP';fo='WAVIO.OUT';
var gr,gl,truocl,truocr,a,res:array[0..1000] of longint;
    n,h:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do
    read(a[i]);
  close(input);
 end;
procedure QHD;
 var i,j:longint;
 begin
  fillchar(gl,sizeof(gl),0);
  fillchar(gr,sizeof(gr),0);
  for i:=1 to n do
   begin
    gl[i]:=1;
    for j:=1 to i-1 do
     if (a[j]<a[i]) and (gl[i]<gl[j]+1) then
      begin
       gl[i]:=gl[j]+1;
       truocL[i]:=j;
      end;
   end;
  for i:=n downto 1 do
   begin
    gr[i]:=1;
    for j:=n downto i+1 do
     if (a[j]<a[i]) and (gr[i]<gr[j]+1) then
      begin
       gr[i]:=gr[j]+1;
       truocR[i]:=j;
      end;
   end;
 end;
procedure traceL(i:longint);
 begin
  if i>0 then
   begin
    traceL(truocL[i]);
    inc(h);
    res[h]:=a[i];
   end;
 end;
procedure traceR(i:longint);
 begin
  if (i<=n) and (i>0) then
   begin
    inc(h);
    res[h]:=a[i];
    traceR(truocR[i]);
   end;
 end;
procedure process;
 var  max,i,id,k:longint;
 begin
  max:=-100000000;
  for i:=1 to n do
   begin
    k:=gl[i]+gr[i]-1;
    if k>max then
     begin
      id:=i;
      max:=k;
     end;
   end;
   h:=0;
   traceL(id);
   dec(h);
   traceR(id);
 end;

procedure xuat;
 var i:longint;
 begin
  assign(output,fo);rewrite(output);
   for i:=1 to h do write(res[i],' ');
  closE(output);
 end;
BEGIN
 nhap;
 QHD;
 process;
 xuat;
END.
