const fi='DIFF.INP';fo='DIFF.OUT';
var A,D:array[0..1000] of longint;
    imax,dmax,n:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(n);
   for i:=1 to n do read(a[i]);
  close(input);
 end;
procedure process;
 var L,I,K:longint;
 begin
  imax:=1;
  L:=1;
  D[a[1]]:=1;
  for i:=2 to n do
   begin
      if (i=n) and (D[A[i]]=0) then
       begin
        if (i-L+1)>dmax then
         begin
          imax:=L;
          dmax:=i-L+1;
         end;
         break;
       end;
    if D[a[i]]=0 then D[a[i]]:=i
     else
      begin
       if D[a[i]]>= L then
        begin
         k:=i-L;
          D[a[i]]:=i;
          if k>dmax then
           begin
            dmax:=k;
            imax:=L;
           end;
           L:=L+1;
          end;
       end;

   end;
 end;
procedure xuat;
 begin
  assign(output,fo);rewrite(output);
   writeln(imax);
   writeln(dmax);
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.
