const fi = 'PALIN.INP';fo = 'PALIN.OUT';
      MD = 1000000003;
      maxN = 1000000;
      base = 311;
var  s:array[1..10005] of char;
     pow,HashS,HashS1:array[0..10005] of int64;
     F,pre,res:array[0..10004] of longint;
     n:longint;
     text1,text2:longint;
procedure nhap;
 begin
     assign(input,fi);reset(input);
     assign(output,fo);rewrite(output);
        readln(N);
        readln(S);
 end;
procedure init;
 var i:longint;
 begin
        pow[0]:= 1;
        for i:=1 to n do pow[i] := (pow[i-1]*base) mod MD;
 end;
procedure HashCode;
 var i:longint;
 begin
        hashS[0]:=0;
        for i:=1 to n do
                HashS[i]:= (HashS[i-1]*base + ord(S[i]) + 1) mod MD;
        HashS1[n+1]:=0;
        for i:=n downto 1 do
                HashS1[i]:= (HashS1[i+1]*base + ord(S[i]) +1) mod MD;

 end;
function getHashS(i,j:longint):longint;
 begin
        exit( (HashS[j]- HashS[i-1]*pow[j-i+1] + MD*MD) mod MD);
 end;
function getHashS1(i,j:longint):longint;
 begin
        exit(( HashS1[i]- HashS1[j+1]*pow[j-i+1] + MD*MD) mod MD);
 end;
function max(x,y:longint):longint;
 begin
     if x>y then exit(x) else exit(y);
 end;
function min(x,y:longint):longint;
 begin
     if x<y then exit(x) else exit(y);
 end;
procedure solve;
 var i,j,mid,len,now:longint;
 begin
        F[0]:=0;
        //F[i] =  max(F[j]+1) with j = 0->i-1 and j+1->i is palindrom
        for i:=1 to n do
         begin
                now:=maxN;
                for j:=i-1 downto 0 do
                 begin
                        len:= i-(j+1) +1;
                        mid:= (i+j+1) div 2;
                        if (len mod 2 = 0) and (getHashS(j+1,mid) = GetHashS1(mid+1,i)) then
                          begin
                                now:=min(now, F[j]+1);
                                pre[i]:=j;
                          end;
                        if (len mod 2 <> 0) and (getHashS(j+1,mid) = GetHashS1(mid,i)) then
                         begin
                                now:=min(now, F[j]+1);
                                pre[i]:=j;
                         end;
                        if now = maxN then F[i]:=0 else F[i]:= now;
                 end;
         end;
 end;
procedure xuat;
 var  SL,i:longint;
 begin
        i:=N;
        SL:=0;
        while i>0 do
         begin
                SL:=SL+1;
                res[SL]:=i;
                i:=pre[i];
         end;
        writeln(F[N]);
        for i:=SL downto 1 do writeln(res[i]);
 end;
BEGIN
        nhap;
        init;
        hashCode;
        solve;
        xuat;
END.
