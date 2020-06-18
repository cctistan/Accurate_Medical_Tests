# Programming Languages: Semester Homework Program
This is an assignment for Programming Languages during the Fall 2019 semester at Rowan University.

Written by [Dr. Nancy Tinkham](http://elvis.rowan.edu/~nlt/hw_pl_f19.html)
## Purpose
In this assignment, the student would solve a programming problem in three different languages. The languages, used for this assignment, included the following:
- Scheme 
- Ada 
- Prolog

## Assignment Problem Description
**You will write a program which compares the accuracy of two medical tests for diagnosing a particular disease.**

The input to your program will be a list of data about a collection of patients specifying

Whether the patient has the disease
Whether the result of test 1 was positive
Whether the result of test 2 was positive
The input format will be a sequence of entries of this form:

A positive integer, which is the number of the patient. Patients will be numbered in increasing consecutive order, starting at 1.
The number 1 or 0: 1 if the patient has the disease, and 0 if the patient does not have the disease
The number 1 or 0: 1 if the patient tested positive on test 1, and 0 of the patient tested negative on test 1
The number 1 or 0: 1 if the patient tested positive on test 2, and 0 of the patient tested negative on test 2
For example, the list
```
   1 0 0 0
   2 1 1 0
   3 1 1 1
```
means that patient 1 does not have the disease, and tested negative on both tests; patient 2 has the disease, and tested positive on test 1 but negative on test 2; and patient 3 has the disease and tested positive on both tests.
Ideally, of course, we would like medical tests to be exactly accurate: the test result would be positive for any patient who has the disease, and negative for any patient who does not have the disease. In reality, most tests are not that accurate: some healthy patients test positive, and some sick patients test negative.

The output of the program will be four conditional probabilities, followed by a statement of which test (if either) is more accurate for this set of patients. Define six events:

1. Let D be the event that the person has the disease
2. Let H be the event that the person does not have the disease (thus is healthy)
3. Let Pos1 be the event that the person tests positive on test 1
4. Let Neg1 be the event that the person tests negative on test 1
5. Let Pos2 be the event that the person tests positive on test 2
6. Let Neg2 be the event that the person tests negative on test 2

You will compute these four probabilities:

```
P(D | Pos1): The probability that the patient has the disease, given that the result of test 1 was positive
P(D | Pos2): The probability that the patient has the disease, given that the result of test 2 was positive
P(H | Neg1): The probability that the patient does not have the disease, given that the result of test 1 was negative
P(H | Neg2): The probability that the patient does not have the disease, given that the result of test 2 was negative
```
After printing these four probabilities, you will print one of the following:

```
If P(D | Pos1) > P(D | Pos2) and P(H | Neg1) > P(H | Neg2) then report
        Test 1 is better
Else If P(D | Pos2) > P(D | Pos1) and P(H | Neg2) > P(H | Neg1) then report
        Test 2 is better
Else report
        Neither test is better
Computing the probabilities
```

A conditional probability is defined by this formula:

```
P(A | B) =   P(A && B) 
             ---------
                P(B)
```
You can compute a conditional probability from the collection of patient data this way:

```
P(A | B) =   the number of patients with properties A and B
             ----------------------------------------------
             the number of patients with property B
```

## Sample calculations

Note: In the examples below, the headings ("Patient number", etc.) are provided only for readability. The actual input data will consist only of numbers.

### Example 1:

#### Input:

```
Patient number          Has disease     Test1 positive  Test2 positive

1                       1               1               0
2                       1               1               1
3                       0               0               0
4                       0               0               0
5                       1               1               0
6                       0               0               0
7                       0               0               0
8                       1               0               1
9                       0               1               0
10                      0               0               0
```

##### Output:

```
P(D | Pos1) = .75
P(D | Pos2) = 1
P(H | Neg1) = .83
P(H | Neg2) = .75
Neither test is better
```

##### Rationale:

* 3 patients have the disease and tested positive on test 1.
4 patients tested positive on test 1.
P(D | Pos1) = 3 / 4 = .75
* 2 patients have the disease and tested positive on test 2.
2 patients tested positive on test 2.
P(D | Pos2) = 2 / 2 = 1
* 5 patients are healthy and tested negative on test 1.
6 patients tested negative on test 1.
P(H | Neg1) = 5 / 6 = .83
* 6 patients are healthy and tested negative on test 2.
8 patients tested negative on test 2.
P(H | Neg2) = 6 / 8 = 3 / 4 = .75

Neither test is better, since P(D | Pos1) < P(D | Pos2) but P(H | Neg1) > P(H | Neg2).
Example 2:

##### Input:

```
Patient number          Has disease     Test1 positive  Test2 positive

1                       1               0               1
2                       1               1               0
3                       0               0               0
4                       0               0               1
5                       0               0               1
6                       0               0               0
7                       0               0               1
8                       0               1               1
```

##### Output:

```
P(D | Pos1) = .5
P(D | Pos2) = .2
P(H | Neg1) = .83
P(H | Neg2) = .67
Test 1 is better
```
##### Rationale:

* 1 patient has the disease and tested positive on test 1.
2 patients tested positive on test 1.
P(D | Pos1) = 1 / 2 = .5
* 1 patient has the disease and tested positive on test 2.
5 patients tested positive on test 2.
P(D | Pos2) = 1 / 5 = .2
* 5 patients are healthy and tested negative on test 1.
6 patients tested negative on test 1.
P(H | Neg1) = 5 / 6 = .83
* 2 patients are healthy and tested negative on test 2.
3 patients tested negative on test 2.
P(H | Neg2) = 2 / 3 = .67

Test 1 is better, since P(D | Pos1) > P(D | Pos2) and P(H | Neg1) > P(H | Neg2).
