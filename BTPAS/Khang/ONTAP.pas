const fi ='ONTAP.INP';fo = 'ONTAP.OUT';
var  C:array[0..10000] of longint;
     L1,L2:longint;
     A,B:string;
procedure nhap;
 begin
     assign(input,fi);reset(input);
     assign(output,fo);rewrite(output);
        readln(a);
        readln(b);
        L1:= length(A);
        L2:= length(b);


 end;

procedure process;
 var  i,j:longint;
 begin
        For i:=1 to L1+L2 do C[i]:= 0;
        For i:=1 to L1 do
                For j:=1 to L2 do
                        C[i+j]:= C[i+j] + (ord(a[i])-48) *(ord(b[j])-48);
        For i:=L1+L2 downto 3 do
         begin
                C[i-1]:= C[i-1]+ C[i] div 10;
                C[i] := C[i] mod 10;

         end;

 end;

procedure xuat;
 var i:longint;
 begin
        For i:=2 to L1+L2 do write(C[i]);
 end;

BEGIN
        nhap;
        process;
        xuat;
END.