% question A
% get income for a specified family
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

% question b
% get income for each family
findall([H, W | C], family(H, W, C), L), calc_income(L), nl, nl.

% question c
% expose families with less than 2000 income
findall([H, W | C], family(H, W, C), L), calc_income_less(L), nl, nl.

% question d
% expose families where children income higher than parents
findall([H, W, [C]], family(H, W, C), L), calc_income_compare(L), nl, nl.
