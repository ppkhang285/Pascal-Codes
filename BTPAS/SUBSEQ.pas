const fi = 'SUBSEQ.INP';fo = 'SUBSEQ.OUT';
var  A,F:array[0..100000] of int64;
     n:longint;
procedure nhap;
 var i:longint;
 begin
     assign(input,fi);reset(input);
     assign(output,fo);rewrite(output);
        readln(n);
        for i:=1 to n do readln(a[i]);
 end;
function min(x,y:int64):int64;
 begin
     if x<y then exit(X) else exit(y);
 end;
function max(x,y:int64):int64;
 begin
     if x<y then exit(y) else exit(x);
 end;
procedure process;
 var res,minN:int64;
        i:longint;
 begin
        F[0]:=0;
        //Mang cong don
        for i:=1 to n do F[i]:= F[i-1] +A[i];
        //Sum = F[i] - F[j-1] (j<=i) =>Sum max => Tim F[j] min
        MinN:= min(0,A[1]); //MinN la F[j] nho nhat trong qua trinh duyet
        res:=A[1];
        For i:= 2 to n do
         begin
                res:=max(res,F[i] -minN); //Cap nhat ket qua
                minN:=min(minN,F[i]); //Cap nhat MinN(F[j]) nho nhat
         end;
         writeln(res);
 end;
BEGIN
        nhap;
        process;
END.
