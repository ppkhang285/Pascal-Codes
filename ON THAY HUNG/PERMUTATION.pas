const fi='PERMUTATION.INP';fo='PERMUTATION.OUT';
var gt,f,a,L:array[0..10000] of int64;
    dis:array[0..100] of boolean;
    n,id:int64;
procedure nhap;
 begin
  assign(input,fi);reset(input);
   n:=0;
   while not eoln do
    begin
     inc(n);
     read(a[n]);
    end;
   readln;
   readln(id);
  close(input);
 end;
procedure init;
 var   i:longint;
 begin
  fillchar(f,sizeof(f),0);
   For i:=2 to n do F[i]:=i-1;
  gt[1]:=1;
  gt[0]:=1;
  for  i:=2 to n do gt[i]:=gt[i-1]*i;
 end;
procedure update(i,j:int64);
 var k:longint;
 begin
  for k:=i to j do
   begin
    F[k]:=F[k]-1;
    if F[k]<0 then F[k]:=0;
   end;
 end;
procedure find_p;
 var i:longint;
     x:int64;
 begin
  x:=0;
   for i:=1 to n-1 do
    begin
     x:=x+((F[a[i]])*gt[n-i]);
     update(a[i]+1,n);
    end;
    x:=x+1;
    writeln(X);
 end;
procedure update2(i,j:longint);
 var k:longint;
 begin
  for k:=i to j do L[k]:=L[k]+1;
 end;
procedure uparray(i:longint);
 var z:longint;
 begin
  for z:=i to n do
   F[z]:=F[z+1];
  end;

procedure find_n;
 var x,i,c:int64;
     k:longint;
 begin
    c:=0;
    for k:=1 to n do f[k]:=k;
    while c<n do
     begin
      i:=0;
      c:=c+1;
      while (i*gt[n-c])<id do inc(i);
      write(F[i],' ');
      uparray(i);
      id:=id-GT[n-c]*(i-1);
    end;
 end;
BEGIN
 nhap;
 init;
 assign(output,fo);rewrite(output);
  find_p;
  find_n;
 close(output);
END.
