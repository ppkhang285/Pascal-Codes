const fi='HVTACMGT.INP';fo='HVTACMG.OUT';
var F:array[0..1000000] of longint;
    K:longint;
    S:ansistring;
procedure nhap;
 begin
        assign(input,fi);reset(input);
        assign(output,fo);rewrite(output);
                readln(k);
                readln(S);
 end;
function truyxa(i:longint):longint;
 var L,R,Mid:longint;
 begin
        L:=1;
        R:=i;
        while (L < R) do
         begin
                Mid:=(L+R) div 2;
                if (F[i]-F[mid-1]>k) then
                        L:=mid+1
                else
                 if (F[i]-F[mid-1]<=k) then
                        r:=mid;
         end;
        if F[i]-F[r-1]=k then exit(r) else exit(0);
end;
function truygan(i,j:longint):longint;
 var L,R,Mid,res:longint;
 begin
        L:=i;
        R:=j;

        while (L <= R) do
         begin
                Mid:=(L+R) div 2;
                if (F[j]-F[mid-1]<k) then
                        R:=mid-1;
                if (F[j]-F[mid-1]=k) then
                 begin
                        L:=mid+1;
                        res:=mid;
                 end;
         end;
        exit(res);
end;
procedure process;
 var N,xa,gan,i,res:longint;
 begin
        res:=0;
        N:=length(S);
        F[0]:=0;
        For i:=1 to N do
         if (S[i]='1') then F[i]:=F[i-1]+1
          else F[i]:=F[i-1];

        For i:=1 to n do
         begin
                xa:=truyxa(i);
                if (xa>0) then
                 begin
                  gan:=truygan(xa,i);
                  res:=res+(gan-xa+1);
                 end;
         end;
        write(res);
 end;
BEGIN
 nhap;
 process;
END.
