const fi ='CONGDON.INP';fo= 'CONGDON.OUT';
      BASE = 166666668;
      M = 1000000007;
var  x,y:real;
     a,b:int64;
procedure nhap;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                read(x);read(y);
                if (x=trunc(x)) then a:=trunc(x)
                        else a:=trunc(x)+1;
                b:=trunc(y);
 end;
procedure solve;
 var resb,resa:int64;
 begin
        resb:= ( ( ( ( ( b*(b+1) ) mod M ) * ( ( 2*b+1 ) mod M ) ) mod M ) * BASE ) mod M;
        a:=a-1;
        resa:= ( ( ( ( ( a*(a+1) ) mod M ) * ( ( 2*a+1 ) mod M ) ) mod M ) * BASE ) mod M;
        writeln( (resb-resa + M*M) mod M );
 end;
BEGIN
        nhap;
         solve;
END.
