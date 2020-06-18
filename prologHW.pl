% Authors:
% Cole Tistan
% Kyle Kaminski
% Denisha Pimentel

% Class: Programming Languages
% Time: MW 2-3:15
% Semester: Fall 2019
% Professor: Tinkham

% This program compares the accuracy of two medical
% tests to diagnose a particular disease.

medical_test(L, ProbDPos1, ProbDPos2, ProbHNeg1, ProbHNeg2) :-

    % This function checks for diseased patients in test1 that are positive.
    count_Has_Disease(L, D),
    count_Has_PositiveOne(L, PosOne),
    ProbDPos1 is D / PosOne,

    % This function checks for diseased patients in test2 that are positive.
    count_Has_DiseaseSecond(L, DS),
    count_Has_PositiveTwo(L, PosTwo),
    ProbDPos2 is DS / PosTwo,

    % This function checks for healthy patients in test1.
    count_Has_Healthy(L, H),
    count_Has_NegativeOne(L, NegOne),
    ProbHNeg1 is H / NegOne,

    % This function checks for healthy patients in test2.
    count_Has_HealthySecond(L, H),
    count_Has_NegativeTwo(L, NegTwo),
    ProbHNeg2 is H / NegTwo.

% This function counts the patients with the disease.
count_Has_Disease([],0).
count_Has_Disease([[_,X,X,_]|T], Result) :-
    X =:= 1,
    count_Has_Disease(T, DiseaseCount),
    Result is DiseaseCount + 1.
    count_Has_Disease([[_,_,_,_]|T], Result) :-
    count_Has_Disease(T, Result).

% This function counts the patients that are positive in test1.
count_Has_PositiveOne([],0).
count_Has_PositiveOne([[_,_,X,_]|T], Result) :-
    X =:= 1,
    count_Has_PositiveOne(T, PositiveOneCount),
    Result is PositiveOneCount + 1.
    count_Has_PositiveOne([[_,_,_,_]|T], Result) :-
    count_Has_PositiveOne(T, Result).

% This function counts the patients that have the disease.
count_Has_DiseaseSecond([],0).
count_Has_DiseaseSecond([[_,X,_,X]|T], Result) :-
    X =:= 1,
    count_Has_DiseaseSecond(T, DiseaseCount),
    Result is DiseaseCount + 1.
    count_Has_DiseaseSecond([[_,_,_,_]|T], Result) :-
    count_Has_DiseaseSecond(T, Result).

% This function counts the patients that are positive in test2.
count_Has_PositiveTwo([],0).
count_Has_PositiveTwo([[_,_,_,X]|T], Result) :-
    X =:= 1,
    count_Has_PositiveTwo(T, PositiveTwoCount),
    Result is PositiveTwoCount + 1.
    count_Has_PositiveTwo([[_,_,_,_]|T], Result) :-
    count_Has_PositiveTwo(T, Result).

% This function counts all of the healthy patients.
count_Has_Healthy([],0).
count_Has_Healthy([[_,X,X,_]|T], Result) :-
    X =:= 0,
    count_Has_Healthy(T, HealthyCount),
    Result is HealthyCount + 1.
count_Has_Healthy([[_,_,_,_]|T], Result) :-
    count_Has_Healthy(T, Result).

% This function counts all of the patients that tested negative in test1.
count_Has_NegativeOne([],0).
count_Has_NegativeOne([[_,_,X,_]|T], Result) :-
    X =:= 0,
    count_Has_NegativeOne(T, NegativeOneCount),
    Result is NegativeOneCount + 1.
    count_Has_NegativeOne([[_,_,_,_]|T], Result) :-
    count_Has_NegativeOne(T, Result).

% This function counts all of the patients that tested healthy.
count_Has_HealthySecond([],0).
count_Has_HealthySecond([[_,X,_,X]|T], Result) :-
    X =:= 0,
    count_Has_HealthySecond(T, HealthyCount),
    Result is HealthyCount + 1.
count_Has_HealthySecond([[_,_,_,_]|T], Result) :-
    count_Has_HealthySecond(T, Result).

% This function counts all of the patients that tested negative in test2.
count_Has_NegativeTwo([],0).
count_Has_NegativeTwo([[_,_,_,X]|T], Result) :-
    X =:= 0,
    count_Has_NegativeTwo(T, NegativeTwoCount),
    Result is NegativeTwoCount + 1.
    count_Has_NegativeTwo([[_,_,_,_]|T], Result) :-
    count_Has_NegativeTwo(T, Result).