(defun chords (f a b)
	(-
		b
		(/
			(*
				(funcall f b)
				(- b a)
			)
			(-
				(funcall f b)
				(funcall f a)
			)
		)
	)	

	; (/ 
	; 	(- 
	; 		(* 
	; 			a
	; 			(funcall f b)
	; 		)
	; 		(*
	; 			b
	; 			(funcall f a)
	; 		)
	; 	)
	; 	(- 
	; 		(funcall f b) 
	; 		(funcall f a)
	; 	)
	; )
)

(defun chordsRecursive (f a b eps)
	(setq x (chords f a b))
	(if (> (abs (- x b)) eps)
		; (return-from chordsRecursive (chordsRecursive f a x eps))
		(setq x (chordsRecursive f a x eps))
	)
	(return-from chordsRecursive x)
)

(defun chordsLinear (f a b eps)
	(setq x (chords f a b))
	(setq it 0)
	(loop for i from 1
		while (> (abs (- x b)) eps)
		do
			(setq b x)
			(setq x (chords f a b))
			(setq it (+ it 1))
	)
	(return-from chordsLinear x)
)

(defun function1(x)
	(+
		(* x x)
		(* 4 (sin x))
	)
)

(defun function2(x)
	(sin x)
)

(defun function3(x)
	(*
		(cos x)
		2
	)
)


(write-line "x^2 + 4 * sin(x)")
(write-line "Linear:")
(setq result (chordsLinear 'function1 -1 1 0.00000001))
(write result)
(format t "~C" #\linefeed)
(write-line "Recursive:")
(setq result (chordsRecursive 'function1 -1 1 0.00000001))
(write result)
(format t "~C~C" #\linefeed #\linefeed)

(write-line "sin(x)")
(write-line "Linear:")
(setq result (chordsLinear 'function2 -1 1 0.00000001))
(write result)
(format t "~C" #\linefeed)
(write-line "Recursive:")
(setq result (chordsRecursive 'function2 -0.5 1 0.00000001))
(write result)
(format t "~C~C" #\linefeed #\linefeed)

(write-line "2 * cos(x)")
(write-line "Linear:")
(setq result (chordsLinear 'function3 4.6 5 0.00000001))
(write result)
(format t "~C" #\linefeed)
(write-line "Recursive:")
(setq result (chordsRecursive 'function3 4.6 5 0.00000001))
(write result)
(format t "~C~C" #\linefeed #\linefeed)
