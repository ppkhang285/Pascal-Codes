{$mode objfpc}
{$m+}
program mlem;
type
        Queue = class

        public
                A:array[0..1000] of longint;
                N:longint;
                procedure Cre();
                function size():longint;
                procedure push(x:longint);
                function front():longint;
                procedure pop();
        end;
var Q:Queue;
    x,y:longint;
procedure Queue.Cre();
 begin
  N:=0;
 end;
function Queue.size():longint;
 begin
        exit(N);
 end;
procedure Queue.push(x:longint);
 begin
        N:=N+1;
        A[N]:=x;
 end;
function Queue.front():longint;
 begin
        exit(A[N]);
 end;
procedure Queue.pop();
 begin
        A[N]:=0;
        N:=N-1;
 end;

begin
        Q.Cre();
        Q.push(2);
        x:=Q.size();
        y:=Q.front();
        writeln(x,' ',y);
end.

