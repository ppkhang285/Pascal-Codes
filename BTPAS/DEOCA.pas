const fi ='DEOCA.INP';fo = 'DEOCA.OUT';
var A,B,F:array[0..100005] of longint;
    n,res1:longint;
procedure nhap;
 var i:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                for i:=1 to n do read(A[i]);
                readln;
                for i:=1 to n do read(B[i]);
 end;
function search(L,R,X:longint):longint;
 var  mid,res:longint;
 begin
        res:=0;
        while (L<=R) do
         begin
                mid:= (L+R) div 2;
                if (F[mid] >= X) then
                 begin
                        res:= mid;
                        R:= mid-1;
                 end
                else L:=mid+1;
         end;
       if (res = 0) then exit(1) else
                exit(res);
 end;
procedure solve1;
 var  i:longint;
 begin
        res1:=0;
        for i:=1 to n do
                if (A[i] <> B[i]) then res1:=res1+1;
 end;
function max(x,y:longint):longint;
 begin
        if (x>y) then exit(x) else exit(y);
 end;
procedure solve2;
 var  m,i,k:longint;
 begin
        m:=0;
        for i:=1 to n do
         begin
                k:= search(1,m , A[i]) ;
                m:= max(m , k);
                F[k]:= A[i];
         end;
 end;
BEGIN
        nhap;
        solve1;
        solve2;
END.