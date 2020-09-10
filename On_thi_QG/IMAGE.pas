const fi='IMAGE.INP';fo='IMAGE.OUT';
      bits1:array['0'..'9'] of string=('0000','0001','0010','0011','0100','0101','0110','0111','1000','1001');
      bits2:array['A'..'F'] of string=('1010', '1011','1100','1101','1110','1111');

var S1,S2,A,B:string;
    LPS:array[0..100000] of longint;
    containanswer:boolean;
    res:longint;

procedure nhap;
 begin
  assign(input,fi);reset(input);
   readln(S1);
   readln(S2);
  close(input);
 end;
procedure Codess;
 var  i:longint;
 begin
  A:='';
  B:='';
  for i:=1 to length(S1) do
     if (S1[i]>='0') and (S1[i]<='9') then A:=A+bits1[S1[i]]
       else A:=A+bits2[S1[i]];
  for i:=1 to length(S2) do
     if (S2[i]>='0') and (S2[i]<='9') then B:=B+bits1[S2[i]]
      else B:=B+bits2[S2[i]];
 end;
procedure varinput;
 var lent,i:longint;
 begin
  for  i:=0 to length(A) do LPS[i]:=1;
  lent:=1;
  for i:=2 to length(B) do
   begin
    while (lent>0) and (B[lent]<>B[i]) do lent:=LPS[lent-1];
    if (B[lent]=B[i]) then
     begin
      lent:=lent+1;
      LPS[i]:=lent;
     end
      else LPS[i]:=0;
   end;
 end;
procedure Prosolve;
 var pointer,i:longint;
 begin
  for i:=1 to length(A) do
   begin
    while (pointer>0) and (B[pointer]<>A[i]) do pointer:=LPS[pointer-1];
    if A[i]=B[pointer] then
     begin
      pointer:=pointer+1;
      if pointer=length(B) then
       begin
        res:=res+1;
        pointer:=LPS[pointer-1];
       end;
      end;
   end;
 end;
procedure main;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   varinput;
   prosolve;
   writeln(res);
  close(input);close(output);
 end;
BEGIN
 nhap;
 codess;
 main;
END.