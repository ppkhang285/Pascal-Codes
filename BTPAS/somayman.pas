program ct;
uses crt;
const fi='MAYMAN.INP';fo='MAYMAN.OUT';
var a:array[1..100000] of string;
    i,k,j,n,l:integer;
    x,s:string;
    kt,kt1:boolean;
begin
 assign(input,fi);reset(input);
  read(n);
 close(input);
 s:='444';
 a[1]:='4';
 a[2]:='7';
 a[3]:='44';
 a[4]:='47';
 a[5]:='77';
 l:=6;
 while l<n do
  begin
   x:=s;
   kt1:=true;
   for i:=1 to length(s) do if x[i]='7' then kt1:= false;
   if kt1 then begin a[l]:=x;l:=l+1;end;
   for j:=length(s) downto 1 do
    begin
     x[j]:='7';
     a[l]:=x;
     l:=l+1;
     if j<length(s) then
       for k:=length(s) downto j+1 do
        begin
         x[k]:='7';
         if j<>length(s) then begin
         a[l]:=x;
         l:=l+1;
         end;
        end;
     x:=s;
     end;
     kt:=true;
     for i:=1 to length(x) do if x[i]='4' then kt:=false;
     if kt then s:=s+'4';
   end;
 assign(output,fo);rewrite(output);
  write(a[n]);
 close(output);
end.

