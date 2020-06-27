totalIncome(family(
  person(jack, fox, date(27,may,1940), unemployed),
  person(jane, fox, date(9,aug,1941), works(ntu, 13050)),
  [
    person(andy, fox, date(5,aug,1967), works(com, 12000)),
    person(kai, fox, date(5,jul,1969), unemployed)
]), S).

totalIncome(family(
  person(tom, cohen, date(7,may,1960), works(bcd, 15200)),
  person(ann, cohen, date(29,may,1961), unemployed),
  [
    person(pat, cohen, date(5,may,1983), works(bcd, 15200)),
    person(jim, cohen, date(5,may,1983), works(bcd, 15200))
]), S).

findall(S, totalIncome(family(_, _, _), S), L), write(L).

totalIncome(family(H, W, C), I), I/N < 2000.

exists(Person),
dateofbirth(Person,date(_,_,Year)),
Year < 1950,
salary(Person, Salary),
Salary < 8000.

findall(Person, (exists(Person),
dateofbirth(Person,date(_,_,Year)),
Year < 1950,
salary(Person, Salary),
Salary < 8000), L), write(L).

findall([H, W, C],
(),
L),
write(L).

totalIncome(family(H,W,C), I), length([H, W | C], N), I/N < 2000.

totalIncome(family(
  person(jack, fox, date(27,may,1940), unemployed),
  person(jane, fox, date(9,aug,1941), works(ntu, 13050)),
  [
    person(andy, fox, date(5,aug,1967), works(com, 12000)),
    person(kai, fox, date(5,jul,1969), unemployed)
]), I), length([H, W | C], N), I/N < 2000.

findall([H, W | C], family(H, W, C), L), calc_income(L).
