var    A,LT,RT:array[0..100001] of longint;
       N,K:longint;
procedure nhap;
 var i:longint;
 begin
  readln(N,K);
  for i:=1 to n do read(a[i]);
 end;
procedure sort(L,R:longint);
 var i,j:longint;
     Q,X:int64;
 begin
  i:=L;
  j:=R;
  X:=A[L+(R-L)];
  repeat
   while A[i]<X do i:=i+1;
   While X<A[j] do j:=j-1;
   if i<=j then
    begin
     Q:=A[i];
     A[i]:=A[j];
     A[j]:=Q;
     i:=i+1;
     j:=j-1;
    end;
  until i>j;
  if L<j then sort(L,j);
  if i<R then sort(i,R);
 end;
procedure process;
 var i,pick:longint;
     res,Res1:int64;
     Left,Right,First,Last,Now:longint;
 begin
  sort(1,n);
  Right:=0;
  Left:=0;

  for i:=1 to n do
   if A[i]>=0 then
    begin
     right:=right+1;
     RT[right]:=A[i];
    end;
  for i:=n downto 1 do
   if A[i]<0 then
    begin
     Left:=Left+1;
     LT[Left]:=A[i];
    end;
  First:=1;
  Last:=1;
  Now:=0;
  Res:=0;
  pick:=0;
  repeat
   If (abs(RT[Last]-Now)<abs(LT[first])) and (Last<Right) then
    begin
     Res:=Res+abs(RT[last]-Now);
     Now:=RT[last];
     pick:=pick+1;
     If Last<Right then
      Last:=Last+1;
    end
     else
      begin
       Res:=Res+abs(LT[First]-now);
       pick:=pick+1;
       Now:=LT[First];
       if First<Left then
        First:=First+1;

        end;
      if pick=k then break;
  until (First=Left) and (Last=Right);
  res1:=0;
  Now:=0;
  Last:=1;
  First:=1;
  repeat
   If (abs(LT[First]-Now)<=abs(RT[Last])) and (First<Left)  then
    begin
      Res:=Res+(LT[First]-now);
       Now:=LT[First];
       pick:=pick+1;
       if First<Left then
        First:=First+1;
    end
     else
      begin
     Res:=Res+(RT[last]-Now);
     Now:=RT[last];
     pick:=pick+1;
     If Last<Right then
      Last:=Last+1;
        end;
  until (First=Left) and (Last=Right);

 if res<res1 then writeln(res) else writeln(res1);

 end;
BEGIN
 nhap;
 process;
END.

