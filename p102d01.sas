options linesize=95 pagesize=52;

data work.NewSalesEmps;
   length First_Name $ 12 Last_Name $ 18
          Job_Title $ 25;
   infile 'e:\newemps.csv' dlm=',';
   input First_Name $ Last_Name $
         Job_Title $ Salary;
run;

proc print data=work.NewSalesEmps;
run;

proc means data=work.NewSalesEmps;
   class Job_Title;
   var Salary;
run;



 data vote;
    infile 'c:\books\learning\political.csv' dsd;
    informat State $2. Party $3.;
    input State 
          Party 
          Age;
run;

title "Listing of VOTE";
proc print data=vote;
run;

title "Frequencies";
proc freq data=vote;
   tables Party / nocum;
run;

data school;
   input Age Quiz : $1. Midterm Final;
   if Age eq 13 then Grade = 6;
   else if Age eq 13 then Grade = 8;
   if Quiz eq 'A' then QuizGrade = 95;
   else if Quiz eq 'B' then QuizGrade = 85;
   else if Quiz eq 'C' then QuizGrade = 75;
   else if Quiz eq 'D' then QuizGrade = 70;
   else if Quiz eq 'E' then QuizGrade = 65;
   else if Quiz eq 'F' then QuizGrade = 55;
   CourseGrade = 0.2 * QuizGrade + 0.3 * Midterm + 0.5 * Final;
   


data readspeed;
   do method = 'A','B','C';
      do index = 1 t0 10;
      input score @;
      output;
      end;
   end;
   datalines;
   250 255 256 300 244 268 301 322 256 333
   267 275 256 320 250 340 345 290 280 300
   350 350 340 290 377 401 380 310 299 399;
   run;
   title "Reading speeds of three different methods";
   proc print data = readspeed;
   run;
   
   
   data money;
      do until (deposit > 30000);
         deposit + 1000;
         deposit + deposit * 0.0425;
         year + 1;
         output;
      end;
   run;
   title "Years count until $30000";
   proc print data = money noobs;
   run;
   
   data logitplot;
      do p=0 to 1 by 0.05;
      Logit = LOG(p/(1-p));
      output;
      end;
   run;
      
      
      
   data logitplot;
do p = 0 to 1 by .05;
 logit = log(p / ( 1 - p));
output;
end;
run;
goptions reset=all
ftext='arial'
htext=1.0
ftitle='arial/bo'
htitle=1.5
colors=(black);
symbol v=none i=sm; 
proc gplot data = logitplot;
title 'Logit Plot';
plot logit * p;
run;
quit;


data monthsales;
   input month sales @@;
   SumSales + sales; 
   format Sales dollar8.2 SumSales dollar10.2;
   datalines;
   1 4000 2 5000 3 . 4 5500 5 5000 6 6000 7 6500 8 4500
   9 5100 10 5700 11 6500 12 7500
   ;
   run;
   proc print data = monthsales noobs;
      title 'Sales to date';
   run; 
   
   
   
   
proc format;
value umar 0-30 = 'less than 30'
30-50 = '30 to 50'
50-70 = '50 to 70'
70-high = 'above 70';
value $politics 'D' = 'Democrat'
'R' = 'Republican';
value $likert '1' = 'Strongly Disagree'
 '2'='Disagree'
 '3'='No Opinion' 
 '4'='Agree' 
 '5'='Strongly Agree';
 run;
data voter;
infile datalines;
input Age Party$ (Ques1-Ques4)($1.+1);
datalines;
23 D 1 1 2 2
45 R 5 5 4 1
67 D 2 4 3 3
39 R 4 4 4 4
19 D 2 1 2 1
75 D 3 3 2 3
57 R 4 3 4 4
;
run;
PROC PRINT noobs;
RUN;
proc freq;
format Age umar.
Party $politics.
Ques1-Ques4 $likert.;
label Ques1 = 'The president is doing a good job'
Ques2 = 'Congress is doing a good job'
Ques3 = 'Taxes are too high'
Ques4 = 'Government should cut spending';
run;
