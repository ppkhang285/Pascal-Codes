const fi ='FILEINP.INP';fo='FILEOUT.OUT';
        INF = 999999;
var n:longint;
        a:array[0..100,0..100] of longint;
procedure nhap;
 var   i,j:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
        readln(n);
        for i:=1 to n do
         for j:=1 to n do
          if (i=j) then A[i,j]:=0
          else
                a[i,j]:=INF;
        for i:=1 to n do
         begin
                for j:=1 to n do
                 begin
                        read(a[i,j]);
                        if A[i,j] =-1 then A[i,j]:= INF;
                  end;
                readln;
         end;
 end;
procedure process;
 var k,i,j:longint;
 begin
        for k:=1 to n do
         begin
                for i:=1 to n do
                 for j:=1 to n do
                  if (a[i,j]>A[i,k]+A[k,j]) then A[i,j]:=A[i,k]+A[k,j];
                for i:=1 to n do
                 begin
                  for j:=1 to n do
                   begin
                        if (A[i,j] <100) then write(a[i,j])
                         else write('oo');
                        if (j<>n) then write(', ');
                   end;
                  writeln;
                 end;
                 writeln;
         end;
 end;
BEGIN
 nhap;
 process;
END.
