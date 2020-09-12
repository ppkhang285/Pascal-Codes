const fi='QMAX.INP';fo='QMAX.OUT';
var A,Maxt,L,H:array[0..200000] of int64;
    Q,N,M:longint;
procedure nhap;
 var i,u,v,k:longint;
 begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
   readln(n,m);
   for i:=1 to m do
    begin
     readln(u,v,k);
     A[u]:=A[u]+k;
     A[v+1]:=A[v+1]-k;
    end;
    for i:=1 to n do
     A[i]:=A[i]+A[i-1];
  end;
function max(x,y:int64):int64;
 begin
  if x>y then exit(x) else exit(y);
 end;
procedure build(x,low,high:longint);
 var mid:longint;
 begin
  L[x]:=low;
  H[x]:=high;
  if low=high then
    MAxt[x]:=A[low]
    else
     begin
      mid:=(low+high) div 2;
      Build(x*2,low,mid);
      Build(x*2+1,mid+1,high);
      MaxT[x]:=max(Maxt[x*2],Maxt[x*2+1]);
     end;
 end;
function query(i,j:longint):longint;
 var res:int64;
 procedure Find(X:longint);
  begin
  if (H[x]<i) or (j<L[x]) then exit;
  if (i<=L[x]) and (H[x]<=j) then
    res:=max(res,Maxt[x]);
    Find(x*2);
   Find(X*2+1);
  end;
 begin
  res:=0;
  Find(1);
  exit(res);
 end;
procedure process;
 var z,u,k:longint;
 begin
  readln(Q);
  for z:=1 to Q do
   begin
    readln(u,k);
    writeln(query(u,k));
   end;
 end;
BEGIN
 nhap;
 build(1,1,n);
 process;
END.


