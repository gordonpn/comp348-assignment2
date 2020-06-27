team(['40018402', '40063115']).
student_info('40018402', 'Gordon', 'Pham-Nguyen').
student_info('40063115', 'Tiffany', 'Zeng').
takes_course('40018402', 'comp', '335', 'h').
takes_course('40018402', 'comp', '335', 'hc').
takes_course('40018402', 'comp', '348', 'u').
takes_course('40018402', 'comp', '348', 'ua').
takes_course('40018402', 'engr', '213', 'u').
takes_course('40018402', 'engr', '213', 'ub').
takes_course('40018402', 'inst', '250', 'ec').
takes_course('40018402', 'soen', '341', 's').
takes_course('40018402', 'soen', '341', 'sb').
takes_course('40063115', 'comp', '348', 'u').
takes_course('40063115', 'comp', '348', 'ua').
takes_course('40063115', 'engr', '371', 's').
takes_course('40063115', 'engr', '371', 'sb').
takes_course('40063115', 'elec', '275', 't').
takes_course('40063115', 'elec', '275', 'ta').
takes_course('40063115', 'elec', '275', 'tl-x').
takes_course('40063115', 'comp', '232', 'dd').
takes_course('40063115', 'comp', '232', 'dddd').
takes_course('40063115', 'phys', '284', 'ec').
course_schedule('comp', '335', 'h', 'mon', '1615', '1730').
course_schedule('comp', '335', 'h', 'wed', '1615', '1730').
course_schedule('comp', '335', 'hc', 'mon', '1145', '1235').
course_schedule('comp', '348', 'u', 'mon', '0845', '1000').
course_schedule('comp', '348', 'u', 'wed', '0845', '1000').
course_schedule('comp', '348', 'ua', 'mon', '1015', '1105').
course_schedule('engr', '213', 'u', 'wed', '1145', '1300').
course_schedule('engr', '213', 'u', 'fri', '1145', '1300').
course_schedule('engr', '213', 'ub', 'mon', '1415', '1555').
course_schedule('soen', '341', 's', 'tue', '1145', '1300').
course_schedule('soen', '341', 's', 'thu', '1145', '1300').
course_schedule('soen', '341', 'sb', 'thu', '0900', '1000').
course_schedule('engr', '371', 's', 'mon', '1315', '1430').
course_schedule('engr', '371', 's', 'wed', '1315', '1430').
course_schedule('engr', '371', 'sb', 'thu', '1315', '1405').
course_schedule('elec', '275', 't', 'wed', '1145', '1300').
course_schedule('elec', '275', 't', 'fri', '1145', '1300').
course_schedule('elec', '275', 'ta', 'fri', '1315',  '1455').
course_schedule('elec', '275', 'tl-x', 'mon', '1445', '1730').
course_schedule('comp', '232', 'dd', 'wed', '1745', '2015').
course_schedule('comp', '232', 'dddd', 'thu', '1615', '1755').
all_sections(CNAM, CNUM, L) :- findall(SEC, takes_course(_, CNAM, CNUM, SEC), LL), sort(LL, L).
all_subjects(S, L) :- findall(CNAM, takes_course(S, CNAM, _, _), LL), sort(LL ,L).
has_taken(S, [CNAM|[CNUM|[SEC|[]]]]) :- takes_course(S, CNAM, CNUM, SEC).
has_taken2(S, [CNAM|[CNUM|[]]]) :- takes_course(S, CNAM, CNUM, _).
% set_prolog_flag(answer_write_options, [quoted(true), portray(true), spacing(next_argument)]).
% the previous line allows prolog to print the entire list instead of a truncated list
all_courses(S, L) :- findall([CNAM, CNUM, SEC], takes_course(S, CNAM, CNUM, SEC), L).
all_courses2(S, L) :- findall([CNAM, CNUM], takes_course(S, CNAM, CNUM, _), LL), sort(LL, L).
