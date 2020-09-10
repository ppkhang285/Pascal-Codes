const fi ='PERM.INP';fo='PERM.OUT';
var  A,B: ansistring;
     S,S1,T:array[0..100001] of integer;
     SL:array[0..9] of integer;
     n1,n,m,i,Zero:longint;
procedure nhap;
 var i:longint;
 begin
     assign(input,fi);reset(input);
     assign(output,fo);rewrite(output);
        readln(A);
        readln(B);
        n:=length(A);
        m:=length(B);
        For i:=1 to n do
         begin
                S[i]:=ord(A[i])-48;
                SL[S[i]]:=SL[S[i]]+1;
         end;
        For i:=1 to m do
                T[i]:=ord(B[i])-48;
 end;
function Find(X:integer):integer;
 var L,R,mid:longint;
     res,resm:integer;
 begin
        res:=-1;
        For i:=9 downto 0 do
         if (i<=x) and (SL[i]>0) then
          begin
              SL[i]:=SL[i]-1;
              res:=i;
              break;
          end;
        exit(res);
 end;
procedure process;
 var  results:ansistring;
      Cur:integer;
      now,adds,i:longint;
 begin
        results:='';
        For i:=1 to m do
         begin
             if (i=1) or (Results[i-1]=chr(T[i-2]+48)) then
              begin
                  Cur:= Find(T[i]);
                  if Cur=-1 then
                   begin
                       writeln('-1');
                       exit;
                   end;
                  Results:= Results+ chr(Cur+48);
              end
              else
               begin
                        now:=9;
                        while (now>=0) and (length(Results)<m) do
                         begin
                             if (SL[now] =0) then now:=now-1
                              else
                               begin
                                   REsults:=Results+ chr(now+48);
                                   SL[now]:=SL[now]-1;
                               end;
                         end;
               end;
         end;
         if (length(Results)<m) then writeln('-1') else
          begin
           while  (results[1]='0')  and (length(results)>1)do delete(results,1,1);
           writeln(results);
          end;
 end;
BEGIN
        nhap;

        process;
END.
