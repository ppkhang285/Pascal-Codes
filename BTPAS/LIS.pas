const fi ='LIS.INP';fo ='LIS.OUT';
var A,B:array[0..30005] of longint;
    n:longint;
procedure nhap;
 var   i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                for i:=1 to n do  read(A[i]);
 end;
function Find(L, R, X:longint):longint;
 var     res,mid:longint;
 begin
        res:=0;
        repeat
                mid:= (L+R) div 2;
                if (B[mid] < X) then
                 begin
                        res:=mid;
                        L:= mid + 1;
                 end
                 else R:= mid - 1;
        until L>R;
        //if (res = 0) then exit(1) else
        exit(res);
 end;
function max(x,y:longint):longint;
 begin
        if x>y then exit(x) else exit(y);
 end;
procedure solve;
 var  m,i,k:longint;
 begin
        m:=0;
        for i:=1 to n do
         begin
                k:= Find(1, m, A[i]) + 1;
                m:= max(m,k);
                B[k]:=A[i];
         end;
        writeln(m);
 end;
BEGIN
        nhap;
        solve;
END.