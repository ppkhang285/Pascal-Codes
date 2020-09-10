program DENMAU;
uses crt;
const fi='DENMAU.INP';fo='DENMAU.OUT';
var n,k,i:longint;
    a:array[1..10000000] of boolean;
procedure change(var s:boolean);
 begin
  if s=true then s:=false else s:=true;
 end;
procedure sort(x:longint);
 var v,h:longint;
 begin
  for v:=1 to n do
     if v mod (x+1)=0 then change(a[v]);
  if x=k then exit
   else sort(x+1);
 end;
BEGIN
 assign(input,fi);reset(input);
  readln(n,k);
 close(input);
 fillchar(a,sizeof(a),true);
 sort(1);
 assign(output,fo);rewrite(output);
  for i:=1 to n do if a[i]=false then write(i,' ');
 close(output);
end.
