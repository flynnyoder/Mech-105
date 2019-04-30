function nd = days(mo, da, leap)
mo=menu('Month','January','February','March','April','May','June','July','August','September','October','November','December');
da=menu('Day','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31');
leap=menu('Leap Year','No','Yes');
dayss=0;
month=[31,28,31,30,31,30,31,31,30,31,30,31];
if mo>1
    dayss=sum(month(1:mo-1));
end
if da>0
    dayss=dayss+da;
end
if leap>1
    if mo>2
        dayss=dayss+1;
    end
end
fprintf('%d days have elapsed this year\n',dayss)
end