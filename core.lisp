(defmacro λ (args &rest f-body)
  (let ((f (lambda (arg)
             (if (eq (type-of arg) 'symbol)
                 arg
                 (eval arg)))))
    (print (mapcar f args))
    (cons 'lambda
          (cons (mapcar f args)
                f-body))))

;; This won't work. We actually need to put the point of evaluation in the returned function
;; actually we need to not return a function at all.

(type-of 'λ)

(macroexpand '(λ (a 'b) (+ a b)))
(macroexpand '(λ (a 'b) (cons (car b) (cons a (cdr b)))))

((λ (a 'b) (cons (car b) (cons a (cdr b)))) (+ 12 3) (* 2))

(describe 'vector)

(cons 4 '(1 2 3))
