CONST
  fi = 'HC.INP';
  fo = 'HC.OUT';
  maxN = 200;
  maxQ = maxN*maxN;
  dx: ARRAY[1..4] Of -1..1 = (-1,0,1,0);
  dy: ARRAY[1..4] Of -1..1 = (0,1,0,-1);
TYPE
  Re = RECORD
    x, y: Longint;
    End;
VAR
  a, F: ARRAY[0..maxN+1, 0..maxN+1] OF Int64;
  Free: ARRAY[0..maxN+1, 0..maxN+1] OF Boolean;
  m, n: Longint;

PROCEDURE DataIn;
Var
  i, j: Longint;
Begin
  Assign(Input, fi);
  Reset(Input);
  Readln(m, n);
  For i := 1 to m do
    For j := 1 to n do
      Read(a[i,j]);
  Close(Input);
End;

PROCEDURE BFS;
Var
  First, Last, i, j, u, v, k, sl: Longint;
  q: ARRAY[0..maxN*maxN+1] Of Re;
Begin
  For i := 1 to m do
    For j := 1 to n do
      F[i,j] := maxLongint;

  FillChar(Free, SizeOf(Free), 1);

  First := 0;
  Last := 0;
  sl := 0;
  For i := 1 to m do
    Begin
      Inc(Last);
      q[Last].x := i;
      q[Last].y := 1;
      Free[i,1] := False;
      F[i,1] := a[i,1];
      Inc(sl);
    End;

  While sl > 0 do
    Begin
      Inc(First);
      If First = maxQ+1 Then First := 1;
      i := q[First].x;
      j := q[First].y;
      Dec(sl);
      Free[i, j] := True;
      For k := 1 to 4 do
        Begin
          u := i + dx[k];
          v := j + dy[k];
          If (u in [1..m]) AND (v in [1..n]) AND (F[u,v] > F[i, j] + A[u, v]) Then
            Begin
              If Free[u,v] then
                Begin
                  Inc(Last);
                  If Last = maxQ+1 Then Last := 1;
                  q[last].x := u;
                  q[last].y := v;
                  Inc(sl);
                  Free[u,v] := False;
                End;
              F[u,v] := F[i,j] + A[u,v];
            End;

        End;
    End;
End;

PROCEDURE DataOut;
Var
  i, min: Longint;
Begin
  Assign(Output, fo);
  Rewrite(Output);
  min := F[1,n];
  For i := 2 to m do
    If min > F[i,n] then min := F[i,n];
  Writeln(min);
  Close(Output);
End;

BEGIN
  DataIn;
  BFS;
  DataOut;
END.
