const fi ='DEOCA.INP';fo = 'DEOCA.OUT';
var A,B,ID,F:array[0..100005] of longint;
    n,res1,res2:longint;
procedure nhap;
 var i,X:longint;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n);
                for i:=1 to n do
                 begin
                        read(x);
                        A[i]:=i;
                        ID[x]:=i;
                 end;
                readln;
                for i:=1 to n do
                 begin
                        read(x);
                        B[i]:= ID[x];
                 end;
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
function Get(i:longint):longint;
 var tp:longint;
 begin
        tp:=0;
        while (i>=1) do
         begin
              tp:= tp + F[i];
              i:=i - ( i and (-i) );
         end;
        exit(tp);
 end;
procedure Update(i:longint);
 begin
        while (i<=n) do
         begin
                F[i]:= F[i] + 1;
                i:= i + (i and (-i) );
         end;
 end;
procedure solve2;
 var  m,i,k:longint;
 begin
        res2:=0;
        for i:=n downto 1 do
         begin
                update(B[i]);
                if (B[i] = 1 ) then continue;
                if (Get(B[i]-1) >0 ) then res2:=res2 +1;
         end;
 end;
procedure xuat;
 begin
        writeln(res1);
        writeln(res2);
 end;
BEGIN
        nhap;
        solve1;
        solve2;
        xuat;
END.
