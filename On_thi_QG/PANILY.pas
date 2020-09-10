const fi ='PALINY.INP';fo = 'PALINY.OUT';
        MD = 1000000003;
        base= 311;
var  S1,S:array[1..100005] of char;
     pow,HashS,HashS1:array[0..100005] of int64;
     ans,n:longint;
procedure nhap;
 var i:longint;
     Sn:ansistring;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
        readln(N);
        readln(S);
        //for i:=1 to n do S[i] := Sn[i];

 end;
function max(x,y:longint):longint;
 begin
     if x>y then exit(x) else exit(y);
 end;
procedure init;
 var  i:longint;
 begin
        //For i:=1 to n do S1[i]:= S[n-i+1];
        pow[0]:=1;
        for i:=1 to n do
                pow[i]:= (pow[i-1]*base) mod MD;
 end;
procedure hashcode;
 var   i:longint;
 begin
        hashS[0]:=0;
        hashS1[n+1]:=0;
        for i:=1 to n do
         begin
                hashS[i]:= (hashS[i-1]*base + ord(S[i]) +1 ) mod MD;
                //hashS1[i]:= (hashS1[i-1]*base + ord(S1[i]) - 48 +1 ) mod MD;
         end;
        for i:=n downto 1 do
                HashS1[i] := (HashS1[i+1]*base + ord(S[i]) +1) mod MD;
 end;
function getHashS(i,j:longint):longint;
 begin
        exit((hashS[j]-hashS[i-1]*pow[j-i+1] + MD*MD) mod MD);
 end;
function getHashS1(i,j:longint):longint;
 begin
        exit((hashS1[i]-hashS1[j+1]*pow[j-i+1] + MD*MD) mod MD);
 end;
function check(L:longint):boolean;
 var i,k:longint;
 begin
        for i:=1 to n-L+1 do
         begin
         //check tu i->i+L-1
                k := i + L div 2;
                if (L mod 2 = 0) and (getHashS(i,k-1)=getHashS1(k,i+L-1)) then exit(true);
                if (L mod 2 <> 0) and (getHashS(i,k)=getHashS1(k,i+L-1)) then exit(true);

         end;
        exit(false);
 end;
procedure BS(L,R,K:longint);
 var i,j,mid,len:longint;
 begin
        i:=L;
        j:=R;
        while (L<=R) do
         begin
             mid := (L+R) div 2;
             len := mid*2+k;
             if check(len)=true then
              begin
                ans:= max(ans, len);
                L:=mid +1;
              end
              else R:= mid-1;
         end;
 end;
procedure solve;
 begin
        ans := 0;
        BS(1, (n-1) div 2,1);
        BS(2,  n div 2, 0);
 end;

procedure xuat;
 begin
        writeln(ans);
 end;
BEGIN
        nhap;
        init;
        hashCode;
        solve;
        xuat;
END.
