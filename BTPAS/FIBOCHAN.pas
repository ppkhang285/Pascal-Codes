const fi ='FIBOCHAN.INP';fo='FIBOCHAN.OUT';
var N:longint;
procedure nhap;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(N);
 end;
procedure solve;
 var   a,b,temp:longint;
       res:int64;
 begin
        res:=0;
        a:= 1;
        b:= 1;
        if (n<2) then
         begin
                res:=0;
                exit;
         end;
        while (b<=n) do
         begin
                temp:=a+b;
                a:=b;
                b:=temp;
                if (b mod 2 =0) and (B<=n)  then res:=res+b;
         end;
        writeln(res);
 end;
BEGIN
        nhap;
        solve;
END.