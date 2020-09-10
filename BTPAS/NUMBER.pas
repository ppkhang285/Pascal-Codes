const fi = 'NUMBER.INP';fo = 'NUMBER.OUT';
var  n,k:int64;
procedure nhap;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(n,k);
 end;
procedure process;
 var temp:int64;
        i:longint;
 begin
        temp:=1;
        while (temp<=2000000000) do
         begin
                i:=i+1;
                temp:=temp*2;
         end;
 end;
BEGIN
        nhap;
        process;
END.