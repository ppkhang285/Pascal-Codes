const fi='QBGAME.INP';fo='GBGAME.OUT';
      oo=123456789987654321;
var   F:array[0..10001,0..256] of int64;
      res:int64;
      n,m:longint;
      D:array[0..60] of longint;
      A:array[0..10,0..10001] of longint;
      MaxL:longint;
procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(N);
   res:=-1000000000;
   for i := 1 to 8 do
    for j  := 1 to  n do
    begin
     read(a[i,j]);
     if a[i,j]>res then res:=a[i,j];
    end;
  end;
function getbit(x,i:integer):byte;
 begin
  i:=i-1;
  getbit:= (x shr i) AND 1;
 end;
function getiq(k,x:integer):longint;
 var i:integer;
 begin
  getiq:=0;
  for i:=1 to 8 do
   if getbit(x,i)=1 then getiq:=getiq+A[i,k];
 end;
function max(x,y:int64):int64;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure process;
 var x,y:integer;
     i:longint;
     temp:int64;
 begin
  fillchar(F,sizeof(f),0);       //khoi tao
  m:=0;
  for i:=0 to 255 do
   if (i and (i shr 1))=0 then
    begin
     m:=m+1;
     D[m]:=i;
    end;
  For i:=1 to n do
    For x:=1 to m do   //trang thai x cua cot i
      begin
       temp:=-oo;
       For y:=1 to m do     // trang thai y cua cot i-1
        if ( ((D[x] and D[y])=0)  and (temp<F[i-1,D[y]])) then
          temp:=F[i-1,D[y]];
       F[i,D[x]]:=getiq(i,D[x])+temp;
      end;
  res:=-oo;
  for i:=1 to m do
   Res:=max(res,F[n,D[i]]);
 end;
procedure xuat;
 begin
  write(res);
 end;
BEGIn
 nhap;
 if res>=0 then process;
 xuat;
END.
