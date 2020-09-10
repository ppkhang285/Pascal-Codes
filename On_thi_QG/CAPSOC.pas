const fi='CAPSOC.INP';fo='CAPSOC.OUT';
var a,F,truoc:array[0..1000] of longint;
    N,T,d:longint;
procedure openf;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
 end;
procedure trace(i:longint);
 begin
  if i<=0 then exit;
  TRace(truoc[i]);
  write(A[i],' ');
 end;
procedure process;
 var max,i,j,vt:longint;
 begin
  max:=-10000000;
  vt:=0;
  fillchar(F,sizeof(f),0);
  fillchar(truoc,sizeof(truoc),0);
  F[1]:=1;
  truoc[1]:=0;
  for i:=2 to n do
   begin
    F[i]:=1;
    for j:=1 to i-1 do
     if (A[j]=A[i]-d) and (F[i]<F[j]+1) then
      begin
         F[i]:=F[j]+1;
         Truoc[i]:=j;
      end;
    if F[i]>max then
     begin
      max:=F[i];
      vt:=i;
     end;
      end;
  trace(vt);

end;
procedure nah;
 var z:longint;
 begin
  readln(T);
  for z:=1 to t do
    begin
     n:=0;
     readln(d);
     while not eoln(input) do
      begin
       inc(n);
       read(a[n]);
      end;
     process;
     readln;
     writeln;
    end;
 end;
BEGIN
 openf;
 nah;
END.