team(X), member(S, X),
findall([S, CNAM, CNUM], takes_course(S, CNAM, CNUM, _), LL),
sort(LL, L), length(L, NN),
write(S), write(' has only taken '), write(NN),
write(' courses in fall 2019.'), nl, fail.

team(X), member(S, X),
findall(S, takes_course(S, _, _, _), LL),
length(LL, NN),
write(S), write(' has only taken '), write(NN),
write(' courses and tutorials in fall 2019.'), nl, fail.
