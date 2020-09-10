USES Math;
CONST
  fi = 'FULKERSON.INP';
  fo = 'FULKERSON.OUT';
VAR
  c, f: ARRAY[1..1000, 1..1000] OF Longint;
  Trace: ARRAY[1..1000] OF Longint;
  n, s, t: Longint;

PROCEDURE DataIn;
Var
  m, u, i, v: Longint;
Begin
  Assign(Input, fi);
  Reset(Input);
  Readln(n, m, s, t);
  For i := 1 to m do
    Readln(u, v, C[u,v]);
  Close(Input);
End;

FUNCTION FindPath: Boolean;
Var
  u, v: Longint;
  Queue: array[1..1000] of Longint;
  Front, Rear: Longint;
Begin
  FillChar(Trace, SizeOf(Trace), 0);
  Front := 1; Rear := 1;
  Queue[1] := s;
  Trace[s] := n+1;
  Repeat
    u := Queue[Front]; Inc(Front);
    For v := 1 to n do
      If (Trace[v] = 0) And (C[u,v] > F[u,v]) Then
        Begin
          Trace[v] := u;
          If v=t then Exit(True);
          Inc(Rear); Queue[Rear] := v;
        End;
  Until Front>Rear;
  Exit(False);
End;

PROCEDURE IncFlow;
Var
  Delta, u, v: Longint;
Begin
  Delta := MaxInt;
  v := t;
  Repeat
    u := Trace[v];
    Delta := Min(Delta, C[u,v]-F[u,v]);
    v := u;
  Until v=s;

  v := t;
  Repeat
    u := Trace[v];
    F[u,v] := F[u,v] + Delta;
    F[v,u] := F[v,u] - Delta;
    v := u;
  Until v=s;
End;

PROCEDURE DataOut;
Var
  m, v: Longint;
Begin
  Assign(Output, fo);
  Rewrite(Output);
  For v := 1 to n do
     If F[s,v] > 0 Then
       m := m + F[s,v];
  Writeln(m);
  Close(Output);
End;

BEGIN
  DataIn;
  Repeat
    If not FindPath then Break;
    IncFlow;
  Until False;
  DataOut;
END.
