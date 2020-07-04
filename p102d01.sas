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
   
