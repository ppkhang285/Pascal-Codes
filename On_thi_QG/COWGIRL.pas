const fi='COWGILR.INP';fo='COWGIRL.OUT';
var F:array[0..100,0..100] of longint;
    n,m,sbit:longint;
procedure open_file;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
 end;
procedure init;
 var i:longint;
 begin
  sbit:=1;
  for i:=1 to m do
   sbit:=sbit*2;
 end;
function Getbit(x,i:longint):longint;
 var k:byte;
 begin
  i:=i-1;
  getbit:= (x shr i) and 1;
 end;
function check(x,y:longint):boolean;
 var i:longint;
 begin
   for i:=1 to m-1 do
    if (getbit(x,i)=getbit(x,i+1)) and (getbit(y,i)=getbit(y,i+1)) and (getbit(x,i)=getbit(y,i)) then exit(false);
   exit(true);
 end;
procedure process;
 var i,x,y:longint;
     max:longint;
 begin
  fillchar(F,sizeof(F),0);
  for x:=0 to sbit do F[1,x]:=1;
  for i:=2 to n do
   for x:=0 to sbit-1 do
    begin
     for y:=0 to sbit-1 do
         if check(x,y) then F[i,x]:=F[i-1,y]+F[i,x];
    end;
  max:=0000000;
  for x:=0 to sbit-1 do
   max:=max+F[n,x];
 //  If F[m,x]>max then max:=F[m,x];
   writeln(max);
 end;
procedure doc;
 var T,z,w:longint;
 begin
  readln(T);
  for z:=1 to T do
   begin
    readln(m,n);
    if m>5 then
     begin
      w:=m;
      m:=n;
      n:=w;
     end;
    init;
    process;
   end;
 end;
BEGIN
 open_file;
 doc;
END.
