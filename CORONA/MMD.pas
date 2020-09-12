const fi= 'MMD.iNP';
type mang2 = array[0..10,0..10] of longint;
     mang1 = array[0..10] of longint;
var  n,m,i:longint;
        edges:mang2;
function max(x,y:longint):longint;
 begin
        if (X>y) then exit(x) else exit(y);
 end;
function min(x,y:longint):longint;
 begin
        if (X>y) then exit(y) else exit(x);
 end;
procedure minMAx(edges:mang2 ; len,n:longint);
 var  i,maxi,mini:longint;
      m:mang1;
 begin
        fillchar(m,sizeof(m),0);
        for i:=1 to len do
                begin
                        m[edges[i,0]]:=m[edges[i,0]]+1;
                        m[edges[i,1]]:=m[edges[i,1]]+1;
                end;
       maxi := 0;
       mini := n;
       for i:=1 to n do
               begin
                        maxi := max(maxi,m[i]);
                        mini := min(mini,m[i]);
               end;
       write('Nodes with maximum degree : ');
       for i:=1 to n do
                 if (m[i] = maxi) then
                         write(i,' ');

       writeln;
       write('Nodes with minimum degree : ');
       for i:=1 to n do
                 if (m[i] = mini) then
                         write(i,' ');
       writeln;

 end;
BEGIN
        n:=4;
        m:=6;
        assign(input,fi);reset(input);
        for i:=1 to m do
                readln(edges[i][0],edges[i][1]);
        minMax(edges , m,4);
END.
