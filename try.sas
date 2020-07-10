libname orion '/folders/myfolders';

data answer(DROP=i);
set orion.test_answers;

do i = 1 to 10;
	if i eq 1 and Q1 eq 'A' then q1score = 1;
	else if i eq 2 and Q2 eq 'C' then q2score = 1;
	else if i eq 3 and Q3 eq 'C' then q3score = 1;
	else if i eq 4 and Q4 eq 'B' then q4score = 1;
	else if i eq 5 and Q5 eq 'E' then q5score = 1;
	else if i eq 6 and Q6 eq 'E' then q6score = 1;
	else if i eq 7 and Q7 eq 'D' then q7score = 1;
	else if i eq 8 and Q8 eq 'B' then q8score = 1;
	else if i eq 9 and Q9 eq 'B' then q9score = 1;
	else if i eq 10 and Q10 eq 'A' then q10score = 1;

end;

total_score = sum(q1score , q2score , q3score , q4score , q5score , 
			q6score , q7score , q8score , q9score , q10score) ;
			
if total_score ge 7 then result = "Passed";
else result = "Failed";
			
run;

data Pass(drop =q1score q2score q3score q4score q5score 
			q6score q7score q8score q9score q10score );
set answer;
where result eq "Passed";
run;

data Fail(drop =q1score q2score q3score q4score q5score 
			q6score q7score q8score q9score q10score );
set answer;
where result eq "Failed";
run;

proc print data = pass;
run;

proc print data = fail;
run;
