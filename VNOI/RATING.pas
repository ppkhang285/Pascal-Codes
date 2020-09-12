const fi='RATING.INP';fo='RATING.OUT';
var   S,CHANCONG,LECONG,A:array[0..3000005] of int64;
      N,Q,L,R,SUB,i:longint;
      x:int64;
procedure SUB1;
 var i,j:longint;
 begin
  for j:=1 to Q do
    begin
      readln(X,L,r);
      for i:=L to R do
           x:=abs(X-A[i]);
      writeln(X);
    end;
 end;
procedure SUB2;
 var          i:longint;
 begin
         For i:=1 to N do S[i]:=S[i-1]+A[i];
         For i:=1 to Q do
          begin
                 readln(X,L,R);
                 writeln(X-(S[R]-S[L-1]));
          end;
 end;
procedure SUB3;
 var    i,t:longint;
 begin
        For i:=1 to Q do
                begin
                        readln(x,L,R);
                        if X<0 then
                                begin
                                        X:=abs(X-A[L]);
                                        L:=L+1;
                                end;
                        t:=R-L+1;
                        if (x>=t*A[1]) then x:=x-T*A[1]
                         else
                                begin
                                        T:=T-(X div A[1]);
                                        X:=X-(X div A[1])*A[1];
                                        if T mod 2<>0 then X:=abs(X-A[1]);
                                end;
                         writeln(X);
                end;
 end;
function BINARY_SEARCH(i,j,x:longint):longint;
 var  Res,L,R,Mid:longint;
 begin
        res:=i;
        L:=i;
        R:=j;
        Repeat
                Mid:=(L+R) div 2;
                if (S[mid]-S[i-1])>X then R:=Mid-1
                 else
                        begin
                                Res:=mid;
                                L:=Mid+1;
                        end;
        Until L>R;
        Exit(Res);
 end;
procedure SUB4;
 var    i,CMD,T,G,Z,J:longint;
 begin
    For i:=1 to N do S[i]:=S[i-1]+A[i];
    CMD:=0;
    For i:=1 to N do
        if CMD=0 then
                begin
                        CMD:=1;
                        LECONG[i]:=LECONG[i-1]+A[i];
                end
        else
                begin
                        CMD:=0;
                        LECONG[i]:=LECONG[i-1]-A[i];
                end;
    CMD:=0;
    For i:=1 to N do
        if CMD=0 then
                begin
                        CMD:=1;
                        CHANCONG[i]:=CHANCONG[i-1]-A[i];
                end
        else
                begin
                        CMD:=0;
                        CHANCONG[i]:=CHANCONG[i-1]+A[i];
                end;

    For Z:=1 to Q do
        begin
                REadln(X,L,R);
                If X<0 then
                        begin
                                X:=abs(X-A[L]);
                                L:=L+1;
                        end;
                J:=BINARY_SEARCH(L,R,X);
                X:=X-(S[j]-S[L-1]);
                if j=R then
                        begin
                                writeln(X);
                                exit;
                        end;
                L:=J+1;
                T:=R-L+1;
                If R mod 2<>0 then
                        Begin
                                G:=LECONG[R]-LECONG[L-1];

                                if T mod 2=0 then X:=abs(G+X) else X:=abs(G-X);
                        end
                else
                        begin
                                G:=CHANCONG[R]-CHANCONG[L-1];

                                if T mod 2=0 then X:=abs(G+X) else X:=abs(G-X);
                        end;
                writeln(X);
        end;
 end;
BEGIN
 assign(input,fi);reset(input);
 assign(output,fo);rewrite(output);
        Readln(SUB);
        Readln(n,Q);
        For i:=1 to n do read(a[i]);
        readln;
        case SUB of
         1:SUB1;
         2:SUB2;
         3:SUB3;
         4:SUB4;
        end;
 close(input);close(output);
END.
