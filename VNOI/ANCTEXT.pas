const fi='ANCTEXT.INP';fo='ANCTEXT.OUT';
var  S:array[0..10000] of ansistring;
        id:array[0..10000] of longint;
        n:longint;
        T:ansistring;
function min(x,y:longint):longint;
 begin
        if x<y then exit(x) else exit(y);
 end;
procedure  nhap;
 var  SUB,i,x:longint;
        K:ansistring;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
        for i:=1 to n do S[i]:='';
        readln(SUB);

        Readln(T);
        readln(n);
         For i:=1 to n do id[i]:=i;
        For i:=1 to n do
                begin
                        readln(X,K);
                        delete(k,1,1);
                        if X=0 then S[i]:=K
                         else
                                S[i]:=S[X]+K;
                 end;
 end;
function SOSANH(x,y:ansistring):boolean;
 var   L,r,Mid,REs:longint;
 begin
  L:=1;
  If length(x)<length(y) then R:=length(x) else R:=Length(y);
  If x[1]<>Y[1] then exit(X[1]<Y[1]);
  Repeat
        Mid:=(L+R) div 2;
        If X[mid]=Y[mid] then
                begin
                        Res:=Mid;
                        L:=Mid+1;
                end
        else
                R:=mid-1;
  until L>R;
  If Res=Min(length(x),length(y)) then exit(Length(x)<length(y))
   else
        EXit(X[res+1]<Y[res+1]);
  end;
function EUA(X,Y:ansistring):boolean;
 begin
  if (length(x)=length(y)) and (SOSANH(X,Y)=false ) and (SOSANH(Y,X)=false) then exit(true);
  exit(false);
 end;
procedure SORT(L,R:longint);
 var i,j,now:longint;
     X,tmp:ansistring;
 begin
  i:=L;
  j:=R;
  X:=S[(L+R) shr 1];
  repeat
        while SOSANH(S[i],X)  do i:=i+1;
        while SOSANH(X,S[j])  do j:=j-1;
        if i<=j then
                begin
                        Tmp:=S[i];
                        s[i]:=s[j];
                        s[j]:=Tmp;
                        now:=id[i];
                        id[i]:=id[j];
                        id[j]:=now;
                        i:=i+1;
                        j:=j-1;
                end;
  until i>j;
  if L<j then SORT(L,j);
  if i<R then SORT(i,R);
 end;
function SOSANH2(S:ansistring; x,y:longint):boolean;
 var  lent,L,R,mid,Chech,res:longint;
 begin
        lent:=y-x+1;
        L:=1;
        chech:=x-1;
        R:=min(length(s),lent);
        repeat
                Mid:=(L+R) shr 1;
                if S[mid]=T[mid+chech-1] then
                        begin
                                res:=mid;
                                L:=mid+1;
                        end
                else R:=mid-1;
        until L>R;
        if Res=min(length(S),lent) then exit(Length(S)<=lent)
                else Exit(S[res+1]<=T[res+chech]);
 end;
Function BINARYSEARCH(x,y:longint):longint;
 var  L,R,mid,Res:longint;
 begin
        L:=1;
        R:=N;
        res:=0;
        Repeat
                Mid:=(L+r) shr 1;
                if SOSANH2(S[mid], x,y) then
                        begin
                                 res:=mid;
                                 L:=mid+1;
                        end
                else  R:=mid-1;
        until L>r;
        if REs=0 then exit(-1) else exit(id[res]);
 end;

procedure process;
        var Q,Z,x,y,ans:longint;
  begin
          readln(Q);
          SORT(1,N);
          For Z:=1 to Q do
                begin
                        readln(x,y);
                       ans:= BINARYSEARCH(x,y);
                       writeln(ans);
                end;

  end;
BEGIN
 nhap;
 process;
END.



