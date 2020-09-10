const fi='FIBO1.INP';fo='FIBO1.OUT';
var f:array[0..46] of ansistring;
    n,k:array[0..46] of longint;
    max,t:longint;
procedure nhap;
 var i:longint;
 begin
  assign(input,fi);reset(input);
   readln(t);
   max:=-100;
   for i:=1 to t do
    begin
     readln(n[i],k[i]);
     if n[i]>max then max:=n[i];
    end;
  close(input);
 end;
procedure process;
 var i:longint;
 begin
  if max>43 then max:=43;
  for i:=1 to max do F[i]:='';
  F[0]:='a';
  F[1]:='b';
  for i:=2 to max do
   F[i]:=F[i-2]+F[i-1];
 end;
procedure xuat;
 var i:longint;
 begin
  assign(output,fo);rewrite(output);
   for  i:=1 to t do
     begin
        if n[i]=45 then
          begin
                if (k[i]>length(f[43])) then
                       begin
                              k[i]:=k[i]-length(F[43]);
                              If k[i]>length(f[42]) then
                                   begin
                                       k[i]:=k[i]-length(f[42]);
                                      writeln(F[43][k[i]]);
                                   end
                              else
                                   begin
                                      writeln(F[42][k[i]]);
                                   end;
                       end

                     else
                       writeln(f[43][k[i]]);
             end;
     if n[i]=44 then
      begin
       if k[i]>length(f[42]) then
        begin
         k[i]:=k[i]-length(f[42]);
         writeln(f[43][k[i]]);
        end
      else
       begin
        writeln(f[42][k[i]]);
       end;
      end;
     if n[i]<=43 then
      writeln(F[n[i]][k[i]]);
    end;
  close(output);
 end;
BEGIN
 nhap;
 process;
 xuat;
END.

// 45=41+42+42+43
