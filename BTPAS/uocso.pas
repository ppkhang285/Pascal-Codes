program uocso;
uses crt;
const fi='UOCSO.INP';fo='UOCSO.OUT';nmax=100000;
type
mang=array[1..nmax] of longint;
var l,h,m,max,i,j:longint;
    n,k:qword;
    a,c,count:mang;
    b:array[1..100000] of byte;
procedure nhap;
 begin
   assign(input,fi);reset(input);
    readln(n);
    for i:=1 to n do read(a[i]);
   close(input)
 end;
procedure process;
 begin
    fillchar(b,sizeof(b),0);
    for i:=1 to n do b[a[i]]:=1;
    for i:=1 to n do
    for j:=1 to a[i] do
    if ((a[i] mod j)=0) and (b[j]=1) then count[a[i]]:=count[a[i]]+1;
    max:=count[1];
    for i:=1 to n do if count[a[i]]>max then max:=count[a[i]];
 end;
procedure xuat;
 begin
   assign(output,fo);rewrite(output);
    for i:=1 to n do if count[a[i]]=max then k:=k+1;
    if max=1 then begin write('KHONG');exit;end;
    if k=1 then for i:=1 to n do if count[a[i]]=max then write(a[i]);
    if k>1 then
     begin
      for i:=1 to n do if count[a[i]]=max then
       begin
        h:=h+1;
        c[h]:=a[i];
       end;
      for i:=1 to h-1 do
       for j:=i+1 to h do
        if c[i]>c[j] then
         begin
          l:=c[i];
          c[i]:=c[j];
          c[j]:=l;
         end;
      for i:=1 to h do write(c[i],' ');
     end;
  close(output);
 end;
begin
 nhap;
 process;
 xuat;
end.

