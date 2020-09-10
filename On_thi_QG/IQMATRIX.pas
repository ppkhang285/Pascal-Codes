const fi='IQMATRIX.INP';fo='IQMATRIX.OUT';
var   F:array[0..10000,0..256] of int64;
      res:int64;
      n:longint;
      A:array[0..10000,0..10000] of longint;
procedure nhap;
 var i,j:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(N);
   for i := 1 to 8 do
    for j  := 1 to  n do
     read(a[i,j]);
  end;
function getbit(x,i:integer):byte;
 begin
  i:=i-1;
  getbit:= (x shr i) AND 1;
 end;
function check1(x:integer):boolean;
 var i:byte;
 begin
   for i:=1 to 7 do
    if (getbit(x,i)=1) and (getbit(x,i+1)=1) then exit(false);
   exit(true);
 end;
function check2(x,y:integer):boolean;
 var     i:integer;
 begin
  for i:=1 to 7 do
   if (getbit(x,i)=1) and (getbit(y,i)=1) then exit(false);
  exit(true);
 end;
function getiq(k,x:integer):longint;
 var i:integer;
 begin
  getiq:=0;
  for i:=1 to 8 do
   if getbit(x,i)=1 then getiq:=getiq+A[i,k];
 end;
function max(x,y:longint):longint;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure process;
 var x,y:integer;
     i:longint;
     temp:int64;
 begin
  fillchar(F,sizeof(f),0);       //khoi tao

  For i:=1 to n do
    For x:=0 to 255 do   //trang thai x cua cot i
     if check1(x) then
      begin
       temp:=-1000000000;

       For y:=0 to 255 do     // trang thai y cua cot i-1
        if (check1(y) and check2(x,y)) then
          temp:=max(temp,F[i-1,y]);

       F[i,x]:=getiq(i,x)+temp;
      end;
  res:=F[n,0];
  for i:=1 to 255 do
   Res:=max(res,F[n,i]);
 end;
procedure xuat;
 begin
  write(res);
 end;
BEGIn
 nhap;
 process;
 xuat;
END.
