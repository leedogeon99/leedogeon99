libname goms 'C:\Users\222-04\Desktop\학교\DIP';

data data19; set goms.GP19;

where g191a388=1 | g191d001 =1;

year = 2019; * 조사시점;

/***    Resign (퇴사) 변수 만들기    ***/
if g191a388 = 1 then Resign = 0; *a388 현재일자리=첫일자리 그만 둔적 없음;
else Resign = 1; * 첫일자리 그만 둠;

if g191a388=1 then First_Work=1; *현재 일자리=첫일자리;
else First_Work = 2; * 첫일자리 존재;

/*  제외조건1: 비임금근로자  */
if (First_Work=1 & g191a021 in (4 5 6)) then delete;
if (First_Work=2 & g191d023 in (4 5 6)) then delete; 
/*  제외조건2: 인턴               */
if (First_Work=1 & (g191a060 =1| g191a063=2)) then delete; * 1206명 제외-> 13213명;
if (First_Work=2 & (g191d063 =1| g191d066=2)) then delete; * 904명 제외 -> 12309명;


keep g191pid g191province--g191gradum g191a001-g191a003 
		g191d002--g191d005
		g191f011 g191f012
		year  First_Work Resign

		g191sex g191age g191q001 g191p001
		g191province g191a144 g191d134 g191a146 g191d136 g191majorcat g191f073 g191f074 g191h001
		g191q015 g191q016 g191q017
		g191a010 g191a141 g191d016 g191d131 
		g191a140 g191d130 
		g191a038 g191a039 g191a043 g191a045 g191a046 g191a048 g191a392
		g191d041 g191d042 g191d046 g191d048 g191d049 g191d051 g191d254
		g191a116 g191a117 g191d106 g191d107
		g191a158 g191a159 g191a160 g191a161 g191a162
		g191d144 g191d145 g191d146 g191d147 g191d148

		g191d020 g191age 

		g191a016 g191a018 g191a019 

		g191a004_10 g191d007_10 g191a014


 

;

rename g191pid=pid g191province=province g191area =area g191sex=sex g191age=age g191birthy =birthy g191birthm=birthm g191graduy=graduy g191gradum=gradum
		g191a001=a001 g191a002=a002 g191a003=a003 
		g191d002=d002 g191d003=d003 g191d004=d004 g191d005=d005 
		g191f011=f011 g191f012=f012

		g191q001=q001 g191p001=p001
		g191province=province g191a144=a144 g191d134=d134 g191a146=a146 g191d136=d136 g191majorcat=majorcat g191f073=f073 g191f074=f074 g191h001=h001
		g191q015=q015 g191q016=q016 g191q017=q017

		g191a010 = a010 g191a141 = a141 g191d016 = d016  g191d131 = d131
		g191a140 = a140 g191d130 = d130
		g191a038 = a038 g191a039 = a039 g191a043 = a043  g191a045 = a045 g191a046 = a046 g191a048 = a048 g191a392 = a392
		g191d041 = d041 g191d042 = d042 g191d046 = d046  g191d048 = d048 g191d049 = d049 g191d051 = d051 g191d254 = d254
		g191a116 = a116 g191a117 = a117 g191d106 = d106  g191d107 = d107
		g191a158 = a158 g191a159 = a159 g191a160 = a160  g191a161 = a161 g191a162 = a162
		g191d144 = d144 g191d145 = d145 g191d146 = d146  g191d147 = d147 g191d148 = d148
		
		g191d020 = d020 g191age = age

		g191a016 = a016 g191a018 = a018 g191a019 = a019

		g191a004_10 = a004_10 g191d007_10 = d007_10  g191a014 = a014
		
;
run;

data data18; set goms.GP18;

where g181a388=1 | g181d001 =1;

year = 2018; * 조사시점;

/***    Resign (퇴사) 변수 만들기    ***/
if g181a388 = 1 then Resign = 0; *a388 현재일자리=첫일자리 그만 둔적 없음;
else Resign = 1; * 첫일자리 그만 둠;

if g181a388=1 then First_Work=1; *현재 일자리=첫일자리;
else First_Work = 2; * 첫일자리 존재;

/*  제외조건1: 비임금근로자  */
if (First_Work=1 & g181a021 in (4 5 6)) then delete;
if (First_Work=2 & g181d023 in (4 5 6)) then delete; 
/*  제외조건2: 인턴               */
if (First_Work=1 & (g181a060 =1| g181a063=2)) then delete; * 1206명 제외-> 13213명;
if (First_Work=2 & (g181d063 =1| g181d066=2)) then delete; * 904명 제외 -> 12309명;


keep g181pid g181province--g181gradum g181a001-g181a003 
		g181d002--g181d005
		g181f011 g181f012
		year  First_Work Resign

		g181sex g181age g181q001 g181p001
		g181province g181a144 g181d134 g181a146 g181d136 g181majorcat g181f073 g181f074 g181h001
		g181q015 g181q016 g181q017
		g181a010 g181a141 g181d016 g181d131 
		g181a140 g181d130 
		g181a038 g181a039 g181a043 g181a045 g181a046 g181a048 g181a392
		g181d041 g181d042 g181d046 g181d048 g181d049 g181d051 g181d254
		g181a116 g181a117 g181d106 g181d107
		g181a158 g181a159 g181a160 g181a161 g181a162
		g181d144 g181d145 g181d146 g181d147 g181d148

		g181d020 g181age 
 
		g181a016 g181a018 g181a019 

		g181a004_10 g181d007_10  g181a014 

;

rename g181pid=pid g181province=province g181area =area g181sex=sex g181age=age g181birthy =birthy g181birthm=birthm g181graduy=graduy g181gradum=gradum
		g181a001=a001 g181a002=a002 g181a003=a003 
		g181d002=d002 g181d003=d003 g181d004=d004 g181d005=d005 
		g181f011=f011 g181f012=f012

		g181q001=q001 g181p001=p001
		g181province=province g181a144=a144 g181d134=d134 g181a146=a146 g181d136=d136 g181majorcat=majorcat g181f073=f073 g181f074=f074 g181h001=h001
		g181q015=q015 g181q016=q016 g181q017=q017

		g181a010 = a010 g181a141 = a141 g181d016 = d016  g181d131 = d131
		g181a140 = a140 g181d130 = d130
		g181a038 = a038 g181a039 = a039 g181a043 = a043  g181a045 = a045 g181a046 = a046 g181a048 = a048 g181a392 = a392
		g181d041 = d041 g181d042 = d042 g181d046 = d046  g181d048 = d048 g181d049 = d049 g181d051 = d051 g181d254 = d254
		g181a116 = a116 g181a117 = a117 g181d106 = d106  g181d107 = d107
		g181a158 = a158 g181a159 = a159 g181a160 = a160  g181a161 = a161 g181a162 = a162
		g181d144 = d144 g181d145 = d145 g181d146 = d146  g181d147 = d147 g181d148 = d148
		
		g181d020 = d020 g181age = age
		
		g181a016 = a016 g181a018 = a018 g181a019 = a019

		g181a004_10 = a004_10 g181d007_10 = d007_10  g181a014 = a014
;
run;

data DATA; set Data18 Data19;

* 입학 시기/ 졸업시기;
Admission = mdy(f012, 1, f011);											format Admission yymmdd10.;			label Admission='입학시기';
if gradum=2 then Graduation = mdy(gradum, 28, graduy);
else if gradum=8 then Graduation = mdy(gradum, 31, graduy);format Graduation yymmdd10.;	label Graduation='졸업시기';

*근무기간 계산하기;
Cur = mdy(9,1,year); format Cur yymmdd10.;																				label Cur='조사시점';
Cur_Work_date = mdy(a002, 1, a001);		 							format Cur_Work_date yymmdd10.; 	label Cur_Work_date='현일자리 시작';
Start_Work1_date = mdy(d003, 1, d002);								format Start_Work1_date yymmdd10.; label Start_Work1_date='첫일자리 시작';
End_Work1_date =  mdy(d005, 1, d004); 								format End_Work1_date yymmdd10.; label End_Work1_date='첫일자리 마지막';

Work_to_Cur= intck ('month',Cur_Work_date,Cur)  ;
Start_to_End = intck ('month',Start_Work1_date, End_Work1_date) ;

drop  f011 f012 birthm birthy gradum graduy a001 a002 d002--d005; /* 날짜 계산 기존 데이터 drop */

if Work_to_Cur < 24 and Work_to_Cur^=. then ck = 1;
else ck = 0;

*현재 첫일자리지만 2년 이하인 사람, 일자리를 아예 가지지 못한 사람 제외;
if ck = 0;
/* 제외조건3: 나이 35 초과              */
if age > 35 then delete;

/*종속변수*/



/*       첫일자리 근무기간이 1년 이상 = 근속       */
*  첫직장의 근무기간 합치기;
if First_Work=1 then FirstWorkPeriod = Work_to_Cur; 
else if First_Work=2 then FirstWorkPeriod = Start_to_End;



/*제외조건4: 근속기간 36개월 초과*/
*if FirstWorkPeriod >36 then delete; * 471명 제외 -> 23886명;
/*제외조건5: 입학이전부터 일한 사람*/
*if Admission>Start_Work1_date and Admission>Cur_Work_date then delete;*첫일자리, 현일자리; * 12명 제외 -> 23874명;
/*제외조건6: 현재 일하고 있는 사람의 근무 개월이 24개월*/
*if Work_to_Cur < 24 and Work_to_Cur^=. then delete; * 18066명 제외 -> 5808명;



* Q. 이상값을 제외할 것인가?;
* 현직장=첫직장이 12개월 이상 일한 사람 or 첫 직장을 12개월 이상 일한 사람
-> 24개월 이상 일한 사람을 근속으로 하기로 함 ;
if FirstWorkPeriod>=12  then LongWork = 1; else LongWork = 0;	label LongWork = '근속 여부 1년 (1=Y)';
if FirstWorkPeriod>=24  then LongWork2 = 1; else LongWork2 = 0;	label LongWork2 = '근속 여부 2년 (1=Y)';


*전공연관성(일치)/전공연관성(도움) a와 d 합치기;
if a144 then major_same=a144; else if d134 then major_same=d134; label major_same = '전공 연관성 (일치)';
if a146 then major_help=a146; else if d136 then major_help=d136; label major_help='전공 연관성(도움)';

*종사자수 a와 d 합치기;
if a010 then big_company = a010; else if d016 then big_company = d016; label big_company='종사자수';

*일만족도 a와 d 합치기;
if a141 then work_sati = a141; else if d131 then work_sati = d131;label work_sati='일 만족도';

*직장만족도 a와 d 합치기;
if a140 then company_sati = a140; else if d130 then company_sati = d130; label company_sati='직장 만족도';

*직장제공 a와 d 합치기;
if a038 then supply1 = a038; else if d041 then supply1 = d041;label supply1='법정퇴직금/퇴직연금';
if a039 then supply2 = a039; else if d042 then supply2 = d042;label supply2='유급휴가';
if a043 then supply3 = a043; else if d046 then supply3 = d046;label supply3='시간외수당';
if a045 then supply4 = a045; else if d048 then supply4 = d048;label supply4='상여금';
if a046 then supply5 = a046; else if d049 then supply5 = d049;label supply5='유급주휴';
if a048 then supply6 = a048; else if d051 then supply6 = d051;label supply6='산전후휴가';
if a392 then supply7 = a392; else if d254 then supply7 = d254;label supply7='육아휴직';

*주당 근로일, 시간 a와 d 합치기;
if a116 then work_day = a116; else if d106 then work_day = d106;label work_day='주당 근로일';
if a117 then work_time = a117; else if d107 then work_time = d107;label work_time='주당 근로시간';

*보험가입 a와 d 합치기;
if a158 then insurance1 = a158; else if d144 then insurance1 = d144;label insurance1='국민연금';
if a159 then insurance2 = a159; else if d145 then insurance2 = d145;label insurance2='특수직역연금';
if a160 then insurance3 = a160; else if d146 then insurance3 = d146;label insurance3='건강보험';
if a161 then insurance4 = a161; else if d147 then insurance4 = d147;label insurance4='고용보험';
if a162 then insurance5 = a162; else if d148 then insurance5 = d148;label insurance5='산재보험';

*회사지역 합치기;
if d020 then com_area = d020; else if a014 then com_area = a014;label com_area='회사지역';
if com_area = -1 then com_area = .;

*산업체 합치기;
if a004_10 then industry = a004_10; else if d007_10 then industry = d007_10;label industry='산업체';
if industry = -1 then industry = .;

*학점 4.5점으로 통일;
if f073 = -1 then score=.; *모름/무응답 결측 처리;
else if f073 = 1 then score=(f073/4)*4.5; label score='학점';*4.0 -> 4.5;
else if f073 = 2 then score=(f073/4.3)*4.5;*4.3 -> 4.5;
else if f073 = 3 then score=f073;



/*그룹화*/
*건간상태;
if q001=1 or q001=2 then q001G=1; *건강X; label q001G='건강상태 그룹';
if q001=3                 then q001G=2; *보통;
if q001=4 or q001=5 then q001G=3; *건강;


*결혼여부;
if p001=1 or p001=3 or p001=4 then p001G=1;*미혼; label p001G='결혼여부 그룹';
if p001=2                                  then p001G=2;*기혼;


*대학지역;
if province=1 or province=2                       then provinceG=1;*수도권; label provinceG='대학지역 그룹';
if province=3 or province=4 or province=5 then provinceG=2;*비수도권;


*전공연관성(일치);
if major_same=1 or major_same=2 then major_sameG=1; label major_sameG='전공연관성(일치) 그룹';
if major_same=3                             then major_sameG=2; 
if major_same=4 or major_same=5 then major_sameG=3; 

*전공연관성(도움);
if major_help=1 or major_help=2 then major_helpG=1;  label major_helpG='전공연관성(도움) 그룹';
if major_help=3                           then major_helpG=2; 
if major_help=4 or major_help=5 then major_helpG=3; 

*본전공;
if majorcat=1 or majorcat=2 or majorcat=3 then majorcatG=1; label majorcatG='본전공 그룹';
if majorcat=4 or majorcat=5 or majorcat=6 then majorcatG=2;
if majorcat=7                                              then majorcatG=3;

*삶의 만족도(개인적 측면);
*if q015=1 or q015=2 or q015=3 then q015G=1;  label q015G='삶의 만족도(개인적 측면) 그룹';
*if q015=4                     then q015G=2; 
*if q015=5 or q015=6 or q015=7 then q015G=3; 

*삶의 만족도(관계적 측면);
*if q016=1 or q016=2 or q016=3 then q016G=1; label q016G='삶의 만족도(관계적 측면) 그룹';
*if q016=4                     then q016G=2; 
*if q016=5 or q016=6 or q016=7 then q016G=3; 

*삶의 만족도(소속 집단적 측면);
*if q017=1 or q017=2 or q017=3 then q017G=1; label q017G='삶의 만족도(소속 집단적 측면) 그룹';
*if q017=4                     then q017G=2; 
*if q017=5 or q017=6 or q017=7 then q017G=3; 

*종사자수;
if big_company = . then big_companyG = .;  label big_companyG='종사자수 그룹';
else if big_company = -1 then big_companyG = .;
else if big_company = 9 then big_companyG = 1;
else big_companyG = 2;

*일 만족도;
if work_sati=1 or work_sati=2 then work_satiG=1;  label work_satiG='일 만족도 그룹';
if work_sati=3                then work_satiG=2; 
if work_sati=4 or work_sati=5 then work_satiG=3; 

*직장 만족도;
if company_sati=1 or company_sati=2 then company_satiG=1;  label company_satiG='직장 만족도 그룹';
if company_sati=3                                then company_satiG=2; 
if company_sati=4 or company_sati=5 then company_satiG=3; 

*직장제공 0 or 1;
if supply1=1 and supply2=1 and  supply3=1 and supply4=1 and supply5=1 and supply6=1 and supply7=1 then supply=1;label supply='직장 제공 여부';
else supply=0;

*보험 0 or 1 - 특수직역연금 가입 빈도가 너무 낮아서 제외;
*if insurance1=1 and insurance3=1 and insurance4=1 and insurance5=1 then insurance=1; label insurance='보험 가입 여부';
*else insurance=0;

*주당 근로 시간 binary;
if work_time > 40 then work_timeB= 1; label work_timeB='주당 근로 시간 binary';
if work_time =< 40 then work_timeB= 0;

commuting_time = a018 * 60 + a019; label commuting_time='출퇴근 시간';

run;

*ods excel file='C:\Users\rnjst\OneDrive - 계명대학교\2023 PROJECT\2023 고용패널조사 학술대회\GOMS DATA\codebook.xlsx';

proc contents data=data varnum;
run;

*ods excel close;

data goms.data_final; set data; run;

proc export data=data outfile='C:\Users\222-04\Desktop\학교\DIP\data_final.csv'
					dbms = csv;
run;

proc freq data=data;
	table com_area * longwork2;
run;




