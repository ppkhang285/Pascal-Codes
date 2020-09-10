const fi ='ROBOT.INP';fo = 'ROBOT.OUT';
var F:array[0..30,0..30] of int64;
    A:array[0..30,0..30] of byte;
    n,m:longint;
procedure nhap;
 var i,j:longint;
 begin
     assign(input,fi);reset(input);
     assign(output,fo);rewrite(output);
        readln(n,m);
        for i:=1 to n do
         begin
                for j:=1 to m do
                 read(a[i,j]);
                readln;
         end;
 end;
function max(x,y:int64):int64;
 begin
     if x>y then exit(x) else exit(y);
 end;
procedure QHD;
 var  i,j:longint;
      nownum:int64;
 begin
        F[1,1]:=A[1,1];
        For i:=2 to m  do F[1,i]:=(F[1,i-1] shl 1) +A[1,i];
        For i:=2 to n  do F[i,1]:=(F[i-1,1] shl 1) +A[i,1];
        For i:=2 to n do
         For j:=2 to m do
                begin
                        nownum := Max(F[i-1,j], F[i,j-1]);
                        F[i,j] := (nownum shl 1) + A[i,j];
                end;
        writeln(F[n,m]);
 end;
procedure Truy(i,j:longint);
 begin
        if (i =1) and (j=1) then exit
         else
          begin
                if (F[i,j-1] > F[i-1,j]) then truy(i,j-1)
                 else truy(i-1,j);
          end;
        writeln(i,' ',j);
 end;
BEGIN
 nhap;
 QHD;
 truy(n,m);
END.