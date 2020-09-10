const fi ='CTCG.INP';fo ='CTCG.OUT';
var A:array[0..100000,0..7] of longint;
    n,TG_Dieu,TG_VuongCan,TG_Can,TG_Vuong,TG_Thuong:longint;
procedure nhap;
 var i,j:longint;
 begin
     assign(input,fi);reset(input);
     assign(output,fo);rewrite(output);
        readln(n);
        for i:=1 to n do
         begin
                For j:=1 to 6 do read(A[i,j]);
                readln;
         end;
 end;
function check_vuong(d1,d2,d3:real):boolean;
 begin
        if d1 = d2+d3 then exit(true);
        if d2 = d3+d1 then exit(true);
        if d3 = d2+d1 then exit(true);
        exit(false);
 end;
function check_can(d1,d2,d3:real):boolean;
 begin
        if (d1=d2) and (d2<>d3) then exit(true);
        if (d2=d3) and (d3<>d1) then exit(true);
        if (d1=d3) and (d1<>d2) then exit(true);
        exit(false);
 end;
function check_dieu(d1,d2,d3:real):boolean;
 begin
        if (d1=d2) and (d2=d3) then exit(true)
                else exit(false);
 end;
procedure process;
 var  i:longint;
      d1,d2,d3:real;
 begin
        TG_Dieu:=0;
        TG_Can:=0;
        TG_Vuong:=0;
        TG_VuongCan:=0;
        Tg_Thuong:=0;
        For i:=1 to n do
         begin
                d1:= sqr(a[i,1]-a[i,3]) + sqr(a[i,2]-a[i,4]);
                d2:= sqr(a[i,3]-a[i,5]) + sqr(a[i,4]-a[i,6]);
                d3:= sqr(a[i,1]-a[i,5]) + sqr(a[i,2]-a[i,6]);
                if check_Dieu(d1,d2,d3) then
                 begin
                        TG_Dieu:=TG_Dieu+1;
                        continue;
                 end;
                if (Check_Can(d1,d2,d3)) and (Check_vuong(d1,d2,d3)) then
                 begin
                        TG_VuongCan:=TG_VuongCan+1;
                        continue;
                 end;
                if (Check_Can(d1,d2,d3)) then
                 begin
                        TG_Can:=TG_can+1;
                        continue;
                 end;
                if (Check_Vuong(d1,d2,d3)) then
                 begin
                        TG_Vuong:=TG_Vuong+1;
                        continue;
                 end;
                TG_Thuong:=TG_Thuong+1;
         end;
 end;
procedure xuat;
 begin
        writeln('Tam giac deu: ',TG_Dieu);
        writeln('Tam giac vuong can: ',TG_VuongCan);
        writeln('Tam giac can: ',TG_Can);
        writeln('Tam giac Vuong: ',TG_Vuong);
        writeln('Tam giac thuong: ',TG_Thuong);
 end;
BEGIN
        nhap;
        process;
        xuat;
END.