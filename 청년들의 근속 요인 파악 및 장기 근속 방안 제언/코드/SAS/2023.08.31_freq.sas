libname dip '/home/u59045417/DIP';

*sex q001G p001G provinceG major_sameG majorcatG h001 q015G q016G q017G work_satiG age score
insurance supply work_timeB company_satiG work_day
;

/*대구*/
proc freq data=dip.data_d;
table (sex q001G p001G provinceG major_sameG h001 q015G q016G q017G work_satiG) * longwork2 / norow nocum nopercent chisq;
run;

proc ttest data=dip.data_d;
class longwork2;
var age score;
run;

proc freq data=dip.data_d;
table (insurance supply work_timeB company_satiG) * longwork2 / norow nocum nopercent chisq;
run;

proc ttest data=dip.data_d;
class longwork2;
var work_day;
run;