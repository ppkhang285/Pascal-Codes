program sodep;
uses crt;
const fi='BEAUTY.INP';fo='BEAUTY.OUT';
var a,b:array[1..100000] of integer;
    i,max,n,k,l:integer;
function tcs(x:integer):integer;
 var y:string;
    z:integer;
    c:integer;
 begin
   str(x,y);
   tcs:=0;
   for c:=1 to length(y) do
    begin
     val(y[c],z);
     tcs:=tcs+sqr(z);
    end;
 end;
function ktnt(x:integer):boolean;
 var d,v:integer;
 begin
  ktnt:=true;
  if x<=1 then begin ktnt:=false;exit;end;
  if (x>1) and (x<=3) then exit;
  d:=trunc(sqrt(x));
  for v:=2 to d do if (x mod v)=0 then ktnt:=false;
 end;
begin
 assign(input,fi);reset(input);
  while not eof do
   begin
    l:=l+1;
    readln(a[l]);
   end;
 close(input);
 max:=a[1];
 for i:=2 to l do if a[i]>max then max:=a[i];
 i:=10;
 k:=1;
 while k<=max do
  begin
   if ktnt(tcs(i)) then begin b[k]:=i;k:=k+1;end;
   i:=i+1;
  end;
 assign(output,fo);rewrite(output);
  for i:=1 to l do
   writeln(b[a[i]]);
 close(output);
end.
