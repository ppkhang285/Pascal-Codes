const fi='BL2.INP';fo='BL2.OUT';
var  free,check:array[0..1000] of boolean;
     a,f:array[0..1000] of longint;
     n:longint;
procedure nhap;
 var  i:longint;
 begin
  assign(input,fi);reset(input);
   fillchar(check,sizeof(check),true);
   readln(n);
   for i:=1 to n do
    begin
     read(a[i]);
     check[a[i]]:=false;
    end;
  close(input);
 end;
procedure write_res;
 var i:longint;
 begin
  for i:=1 to n do write(f[i],' ');
  writeln;
 end;
procedure init;
 begin
  fillchar(free,sizeof(free),true);
 end;
procedure Back_Track(i:longint);
 var j:longint;
 begin
  for j:=1 to n do
   if free[j] then
    if i>2 then
     begin
      if ((A[j]+f[i-2])<>(f[i-1]*2)) then
       begin
        F[i]:=A[j];
        free[j]:=false;
        if i=n then Write_res
         else Back_track(i+1);
        free[j]:=true;
       end;
     end
     else
      begin
        begin
         F[i]:=A[j];
         free[j]:=false;
         if i=n then Write_res
          else Back_track(i+1);
         free[j]:=true;
        end;
     end;
 end;
BEGIN
 nhap;
 assign(output,fo);rewrite(output);
  init;
  Back_track(1);
 close(output);
END.
 c