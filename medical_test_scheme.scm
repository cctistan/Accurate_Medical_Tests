; Cole Tistan

; tests for all cases
(define firstTest '( (1 1 1 0) (2 1 1 1) (3 0 0 0) (4 0 0 0) (5 1 1 0) (6 0 0 0) (7 0 0 0) (8 1 0 1) (9 0 1 0) (10 0 0 0) ) )

(define secondTest '( (1 1 0 1) (2 1 1 0) (3 0 0 0) (4 0 0 1) (5 0 0 1) (6 0 0 0) (7 0 0 1) (8 0 1 1) ) )

(define thirdTest '( (1 0 1 1) (2 1 0 1) (3 0 0 0) (4 0 1 1) (5 0 1 1) (6 0 0 0) (7 0 1 1) (8 1 1 1) ) )

; this method will serve as the main method of this program
(define (medical_Test Patient_Data)
         (cons (Disease_Positive_One_Ratio Patient_Data)
         (cons (Disease_Positive_Two_Ratio Patient_Data)
         (cons (Healthy_Negative_One_Ratio Patient_Data)
         (cons (Healthy_Negative_Two_Ratio Patient_Data)
         (cons (Best_Results Patient_Data) '())))))
)

;P(D|P1) method
;calculates Probability of patients with diseases and positive test results
;returns the number of infected patients
(define (Disease_Positive_One_Prob L)

        (cond ((null? L) 0)
              ((and (eq? (cadar L) 1) (eq? (caddar L) 1)) (+ 1 (Disease_Positive_One_Prob (cdr L))))
              (else (Disease_Positive_One_Prob (cdr L))) ;recursively loops throughout the list
        )

)

;P(D|P2) method
;returns the number of infected patients
(define (Disease_Positive_Two_Prob L)

        (cond ((null? L) 0)
              ((and (eq? (cadar L) 1) (eq? (car(cdr(cdr(cdr(car L))))) 1)) (+ 1 (Disease_Positive_Two_Prob (cdr L))))
              (else (Disease_Positive_Two_Prob (cdr L)))
        )

)

;P(H|N1) method
;returns the number of healthy patients
(define (Healthy_Negative_One_Prob L)

          (cond ((null? L) 0)
                ((and (eq? (cadar L) 0) (eq? (caddar L) 0)) (+ 1 (Healthy_Negative_One_Prob (cdr L))))
                (else (Healthy_Negative_One_Prob (cdr L)))
                )

)

;P(H|N2) method
;returns the number of healthy patients
(define (Healthy_Negative_Two_Prob L)

   (cond ((null? L) 0)
              ((and (eq? (cadar L) 0) (eq? (car(cdr(cdr(cdr(car L))))) 0)) (+ 1 (Healthy_Negative_Two_Prob (cdr L))))
              (else (Healthy_Negative_Two_Prob (cdr L)))
        )


)

;returns the number of patients that tested positive on test 1
(define (Total_Positive_One_Results L)

         (cond ((null? L) 0)
              ((eq? (caddar L) 1) (+ 1 (Total_Positive_One_Results (cdr L))))
              (else (Total_Positive_One_Results (cdr L)))
         )
)

;returns the number of patients that tested positive on test 2
(define (Total_Positive_Two_Results L)

         (cond ((null? L) 0)
              ((eq? (car(cdr(cdr(cdr(car L))))) 1) (+ 1 (Total_Positive_Two_Results (cdr L))))
              (else (Total_Positive_Two_Results (cdr L)))
         )
)

;returns the number of patients that tested negative on test 1
(define (Total_Negative_One_Results L)

         (cond ((null? L) 0)
              ((eq? (caddar L) 0) (+ 1 (Total_Negative_One_Results (cdr L))))
              (else (Total_Negative_One_Results (cdr L)))
         )
)

;returns the number of patients that tested negative on test 2
(define (Total_Negative_Two_Results L)

         (cond ((null? L) 0)
              ((eq? (car(cdr(cdr(cdr(car L))))) 0) (+ 1 (Total_Negative_Two_Results (cdr L))))
              (else (Total_Negative_Two_Results (cdr L)))
         )
)

; returns the rational number of P(D|P1)
(define (Disease_Positive_One_Ratio L)

(/ (Disease_Positive_One_Prob L) (Total_Positive_One_Results L))

)

; returns the rational number of P(D|P2)
(define (Disease_Positive_Two_Ratio L)

(/ (Disease_Positive_Two_Prob L) (Total_Positive_Two_Results L))

)

; returns the rational number of P(H|N1)
(define (Healthy_Negative_One_Ratio L)

(/ (Healthy_Negative_One_Prob L) (Total_Negative_One_Results L))

)

; returns the rational number of P(H|N2)
(define (Healthy_Negative_Two_Ratio L)

(/ (Healthy_Negative_Two_Prob L) (Total_Negative_Two_Results L))

)

;returns a report on the results
(define (Best_Results L)

  (cond ((and (> (Disease_Positive_One_Ratio L) (Disease_Positive_Two_Ratio L))
             (> (Healthy_Negative_One_Ratio L) (Healthy_Negative_Two_Ratio L))) 'test1)

        ((and (> (Disease_Positive_Two_Ratio L) (Disease_Positive_One_Ratio L))
              (> (Healthy_Negative_Two_Ratio L) (Healthy_Negative_One_Ratio L))) 'test2)

        (else 'neither)
  )

)
