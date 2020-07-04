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
   title "Reading speeds of three different methods";
   proc print data = readspeed;
   run;
   
