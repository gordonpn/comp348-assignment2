# COMP 348 – Fall 2019

## Assignment 2 - Prolog

| Gordon Pham-Nguyen | Tiffany Zeng |
|--------------------:|--------------:|
| 40018402           | 40063115     |

#### 1. Fact Representation

A. Please view the file `schedule-40018402.pl`

B.

````
40018402 has only taken 9 courses and tutorials in fall 2019.
40063115 has only taken 10 courses and tutorials in fall 2019.
false.
````

> Is the above information correct?

Yes.

C. Please view the file `schedule-40018402.pl`

D.

````
team(X), member(S, X),
findall([S, CNAM, CNUM], takes_course(S, CNAM, CNUM, _), LL),
sort(LL, L), length(L, NN),
write(S), write(' has only taken '), write(NN),
write(' courses in fall 2019.'), nl, fail.
````

Will print the following:

````
40018402 has only taken 5 courses in fall 2019.
40063115 has only taken 5 courses in fall 2019.
false.
````

E.
> Compare the result for all\_courses2('40018402', L) vs. all\_courses2(40018402, L). Explain.

In the first query, it will return the correct list of courses that student is taking. In the second query, the prolog interpreter will not find any unification because the student ID is written surrounded by single quotes in the knowledge-base.

<div style="page-break-after: always;"></div>

#### 2. Unification

|    | Term 1                                   | Term 2                                 |                                                                             Answer (Term 1 = Term 2)                                                                            |
|:--:|------------------------------------------|----------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|  1 | ancestor(french(jean), B)                | ancestor(A, scottish(joe))             |                                                                       A = french(jean)                                                                        |
|  2 | food(bread, X)                           | Food(Y, soup)                          |                          Fails, since prolog is case sensitive, food() and Food() are not the same, therefore they cannot be unified.                         |
|  3 | food(bread, X, milk)                     | food(Y, salad, X)                      |                                                                       Y = bread <br> X = milk                                                                      |
|  4 | mangaer(X)                               | Y                                      |                                      Fails, since Y is not a term, rather a single variable, thus they  cannot be unified                                     |
|  5 | meal(healthyFood(bread), drink(milk))    | meal(X,Y)                              |                                                            X = healthyFood(bread) <br> Y = drink(milk)                                                            |
|  6 | meal(eat( Z ), drink(milk))              | meal(X,Y)  |       X = eat(Z) <br> Y = drink(milk)                                                                  |
|  7 | f(X, t(b, c))                            | f(l, t(Z, c))                          |                                                                             Z = b                                                                             |
|  8 | meal(healthyFood(bread), Y)              | meal(X, drink(water))                  |                                                                     X = healthyFood(bread)                                                                    |
|  9 | breakfast(healthyFood(bread), egg, milk) | breakfast(healthyFood(Y), Y, Z)        | Fails, since the following are instantiated to : <br> Y = egg <br> healthyFood(Y) = healthyFood(bread) <br> Thus, the second term fail. Therefore, they cannot be unified.  |
| 10 | dinner(X, Y, Time)                       | dinner(jack, cook( egg, oil), Evening) |                                                                         returns true.                                                                         |
| 11 | k(s(g), Y)                               | k(X, t(k))                             |                                                                            X = s(g)                                                                           |
| 12 | characters(hero(luke), X)                | characters(X, villain(vader))          |                                                                         X = hero(luke)                                                                        |
| 13 | equation(Z, f(L, 17, M), L*M, 17)        | equation(C, f(D, D, E), C, E)          |                                                                     C = 17*17 <br> D = E <br> E = 17                                                                    |      |

<div style="page-break-after: always;"></div>

#### 3. Queries

````
course(hit_transfer, mechanical).
course(web_design,computer).
course(design_methods, fine-arts).
course(poetry, literature).
course(leadership, management).
course(biology,medicin).
lab_number(mechanical,15).
lab_number(fine_arts,10).
lab_number(X, Z) :-course(X, Y), lab_number(Y, Z).
field(mechanical,engineering).
field(computer, engineering).
field(fine-arts, art).
field(literature, social).
field(management, buisiness).
field(X, Y) :- course(X, Z), field(Z, Y).
student(anna, hit_transfer).
student(daniel, hit_transfer).
student(adrian, web_design).
student(ava, design_methods).
student(jack, poetry).
student(lee, leadership).
student(X, Y) :- field(Z, Y), student(X, Z).
student(X):- student(X,_).
````
<br>

> Determine the type of each of the following queries (ground/non-ground), and explain what will Prolog respond for each of these queries (write all the steps of unifications and resolutions for each query)?

<br>

1. `? field(hit_transfer,engineering).`

	This ground query will match with the rule `field(X, Y)`. X will be instantiated to "hit\_transfer" and Y will be instantiated to "engineering". Which looks for `course(hit_transfer, Z)` and matches with `course(hit_transfer, mechanical)` and Z will lbe instantiated to "mechanical". This will return true for the first part. The next condition is `field(Z, Y)`. Which will match with `field(mechanical,engineering)` which also returns true, thus the final answer is true.

2. `? lab_number(fine_arts,X).`

	This non-ground query will return `X = 10`.

3. `? field(computer, literature).`

	Ground query. Will match with `field(X, Y)`. X instantiated to "computer". course(computer, Z) doesn't exist. Returns false.

4. `? course(X,Y).`

	Non-ground query will match first statement it sees. Returns `X = hit_transfer`, `Y = mechanical`.

5. `? student(adrian).`

	Ground query will match the rule `student(X)`. Which looks for `student(X, _)` and finds `student(adrian, web_design)`. Returns true.

6. `? student(anna, engineering).`

	Ground query will match rule `student(X, Y)`. Looking for `field(Z, engineering)` which returns `Z = mechanical`, it continues to look for `student(anna, mechanical)` which ends up in a loop with `student(X, Y)` again, continuing in this manner until it starts looking for `student(anna, hit_transfer)` which will return true.

7. `? student(X, engineering).`

	Non-ground query will work in a similar way as the previous query. Ultimately it will return `student(anna, hit_transfer)` in the second conditon of the rule `student(X, Y)` and thus return `X = anna`.

7. `? student(X,fine-arts), course(fine_arts, Y).`

	Non-ground query, matches rule `student(X, Y)`, looks for first condition `field(Z, fine-arts)` which in turn unifies with `field(X, Y)`, at this point the program loops at `course(X, Z)` as it tries every course. The condition `field(Z, fine-arts)` ultimately fails and the rule is not satisfied and cannot find a student X. The second conditon of the query is not even tried given that it is a conjunction.

8. `? field(_,X).`

	Non-ground query will return `X = engineering` when it matches the first statement it finds.

9. `? lab_number(_,X), field(X,Y).`

	Non-ground query. `lab_number(_,X)` will return `X = 15` which fails then tries with `X = 10` and finally matches the rule `lab_number(X, Z)`. The first condition always passes a number to the second condition which never ends up finding a field where `X =` number.

10. `? lab_number(X,15), field(X,Y).`

	Non-ground query. First conditon unifies with `lab_number(mechanical,15)` returns `X = mechanical`. Second condition is called as `field(mechanical, Y)` which unifies with `field(mechanical,engineering)` and returns `Y = engineering`.

11. `? student(X), !, student(X,_).`

	Non-ground query. In the first condition it matches the rule `student(X)` which returns `student(anna, hit_transfer)` which results in `X = anna` and passes to the next condition. Calling `student(anna, _)` which returns true so `X = anna`.

12. `? student(X), student(X,_), !.`

	Non-ground query. In the first condition it matches the rule `student(X)` which returns `student(anna, hit_transfer)` which results in `X = anna` and passes to the next condition. Calling `student(anna, _)` which returns true so `X = anna`.

13. `? course(X,_), \+ student(_,X).`

	Non-ground query. The first condition unifies with `course(hit_transfer, mechanical)` hence
`X = hit_transfer`. We look into the second condition which becomes `student(_,hit_transfer)`. Which returns true as it unifies with `student(anna,hit_transfer)`. Since it is paired with a negation, the second condition is false. Therefore, we loop through every course until there is a course in which no student takes, such that the second statement, paired with a negation, returns true. When the program unifies with `course(biology, medicin)`, the second condition becomes `student(_,biology)`, which is false, but paired with negation becomes true. Hence, `X = biology`.

<div style="page-break-after: always;"></div>

#### 4. Unification, Resolution, and Backtracking

`? magic(Hermione).`

| Steps       |      Answer      |
|-------------|:----------------:|
| Unification |     magic(X)     |
| Unification |   house_elf(X)   |
| Resolution  | house_elf(dobby) |
| Resolution  | magic(dobby)     |

__Hermione = dobby__

 <br>

`? magic(hermione).`

| Steps              |        Answer       |
|--------------------|:-------------------:|
| Unification        |   magic(hermione)   |
| Unification        | house_elf(hermione) |
| Resolution (Fails) | house_elf(dobby) |
| Backtracking       |   magic(hermione)   |
| Unification        |   wizard(hermione)  |
| Resolution (Fails) |   wizard(dobby)  |
| Backtracking       |   magic(hermione)   |
| Unification        |   witch(hermione)   |
| Resolution (Matches)        |   witch(hermione)   |
| Resolution         |   magic(hermione)   |

 __true__

#### 5. Lists

Please view prolog file `question5-40018402-40063115.pl` and `question5driver-40018402-40063115.pl`
