const fi ='NUMSET.INP';fo ='NUMSET.OUT';
var F:array[0..21] of integer;
    Appear:array[0..410] of string;
    S:string;
    res:integer;
procedure nhap;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(S);
 end;
function Fixed(X:string):string;
 begin
     while X[1] ='0' do delete(X,1,1);
     Exit(X);
 end;
procedure process;
 var  i,j,n,AppInx,Sum,Z:integer;
      Num:string;
      Appeared:boolean;
 begin
        N:=length(S);
        res:=0;
        AppInx:=0;
        For i:=1 to n do
                For j:= i to n do
                 if (j-i+1)=n then continue
                  else
                        begin
                            Num:='';
                            Sum:=0;
                            For Z:=1 to n do
                                if (Z<i) or (Z>j) then
                                 begin
                                        Num:=Num+S[z];
                                        Sum:=Sum+(ord(S[z])-48);
                                 end;
                            Num:=Fixed(Num);
                            Appeared:=False;
                            For Z:=1 to AppInx do
                                if Appear[Z]=Num then
                                        begin
                                                Appeared:=True;
                                                Break;
                                        end;
                            if (Appeared =False) then
                                begin
                                        AppInx:=AppInx+1;
                                        Appear[AppInx]:=Num;
                                        if (Sum mod 3) = 0 then res:=res+1;
                                end;
                        end;
        Sum:=0;
        For i:=1 to n do
               Sum:=Sum+ (ord(S[i])-48);
        if (Sum mod 3) = 0 then res:=res+1;
        writeln(res);
 end;
BEGIN
        nhap;
        process;
END.