/*개인변수*/
*대구;
proc phreg data=dip.data_d;
class sex(ref='2') q001G(ref='1') major_sameG(ref='1') h001(ref='2') q015G(ref='1') q016G (ref='1')q017G(ref='1') work_satiG (ref='1');
model FirstWorkPeriod * longwork2(1) = sex q001G major_sameG h001 q015G q016G q017G work_satiG age score / rl;
run;

%macro lifetest(var);
proc lifetest data=dip.data_d;
	time FirstWorkPeriod * longwork2(1);
	strata &var;
run;
%mend;

%lifetest(sex);
%lifetest(q001G);
%lifetest(provinceG);
%lifetest(major_sameG);
%lifetest(majorcatG);
%lifetest(h001);
%lifetest(q015G);
%lifetest(q016G);
%lifetest(q017G);
%lifetest(work_satiG);

*수도권;
proc phreg data=dip.data_S;
class sex(ref='2') q001G(ref='1') major_sameG(ref='1') h001(ref='2') q015G(ref='1') q016G (ref='1')q017G(ref='1') work_satiG (ref='1');
model FirstWorkPeriod * longwork2(1) = sex q001G major_sameG h001 q015G q016G q017G work_satiG age score  / rl;
run;

%macro lifetest(var);
proc lifetest data=dip.data_s;
	time FirstWorkPeriod * longwork2(1);
	strata &var;
run;
%mend;

%lifetest(sex);
%lifetest(q001G);
%lifetest(provinceG);
%lifetest(major_sameG);
%lifetest(majorcatG);
%lifetest(h001);
%lifetest(q015G);
%lifetest(q016G);
%lifetest(q017G);
%lifetest(work_satiG);

*비수도권;
proc phreg data=dip.data_NS;
class sex(ref='2') q001G(ref='1') major_sameG(ref='1') h001(ref='2') q015G(ref='1') q016G (ref='1')q017G(ref='1') work_satiG (ref='1');
model FirstWorkPeriod * longwork2(1) = sex q001G major_sameG h001 q015G q016G q017G work_satiG age score  / rl;
run;

%macro lifetest(var);
proc lifetest data=dip.data_ns;
	time FirstWorkPeriod * longwork2(1);
	strata &var;
run;
%mend;

%lifetest(sex);
%lifetest(q001G);
%lifetest(provinceG);
%lifetest(major_sameG);
%lifetest(majorcatG);
%lifetest(h001);
%lifetest(q015G);
%lifetest(q016G);
%lifetest(q017G);
%lifetest(work_satiG);

%lifetest(insurance);
%lifetest(supply);
%lifetest(work_timeB);
%lifetest(company_satiG);
















/*기업변수*/
*대구;
proc phreg data=dip.data_d;
class insurance(ref='0') supply(ref='0') work_timeB(ref='0') company_satiG (ref='1');
model FirstWorkPeriod * longwork2(1) = insurance supply work_timeB work_day company_satiG  / rl;
run;

*수도권;
proc phreg data=dip.data_s;
class insurance(ref='0') supply(ref='0') work_timeB(ref='0') company_satiG (ref='1');
model FirstWorkPeriod * longwork2(1) = insurance supply work_timeB work_day company_satiG  / rl;
run; 

*비수도권;
proc phreg data=dip.data_ns;
class insurance(ref='0') supply(ref='0') work_timeB(ref='0') company_satiG (ref='1');
model FirstWorkPeriod * longwork2(1) = insurance supply work_timeB work_day company_satiG  / rl;
run;


/*대구*/
%macro lifetest(var);
proc lifetest data=dip.data_d;
	time FirstWorkPeriod * longwork2(1);
	strata &var;
run;
%mend;

%lifetest(insurance);
%lifetest(supply);
%lifetest(work_timeB);
%lifetest(company_satiG);


/*수도권*/
%macro lifetest(var);
proc lifetest data=dip.data_s;
	time FirstWorkPeriod * longwork2(1);
	strata &var;
run;
%mend;

%lifetest(insurance);
%lifetest(supply);
%lifetest(work_timeB);
%lifetest(company_satiG);


/*비수도권*/
%macro lifetest(var);
proc lifetest data=dip.data_ns;
	time FirstWorkPeriod * longwork2(1);
	strata &var;
run;
%mend;

%lifetest(insurance);
%lifetest(supply);
%lifetest(work_timeB);
%lifetest(company_satiG);








