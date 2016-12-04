(defun put (symbol key value)
	(setf (get symbol key) value))

(setq me 'person)
(format t "Input name: ")
(setq name (read))
(format t "Input surname: ")
(setq surname (read))
(format t "Input day of birth: ")
(setq day (read))
(format t "Input month of birth: ")
(setq month (read))
(format t "Input year of birth: ")
(setq year (read))

(multiple-value-bind
	(second minute hour date month year day-of-week dst-p tz)
	(get-decoded-time)
	(setq curr-day date)
	(setq curr-month month)
	(setq curr-year year))

(if (< month curr-month) 
	
		
		(setq age (- curr-year year))
	
	(if (> month curr-month)
		
			
			(setq age (- curr-year year 1))
		
		(if (<= day curr-day)
				(setq age (- curr-year year))
				(setq age (- curr-year year 1))
			
		)
	)
)

(put 'birthday 'year year)
(put 'birthday 'month month)
(put 'birthday 'day day)

(put 'me 'name name)
(put 'me 'surname surname)
(put 'me 'age age)
(put 'me 'birthday 'birthday)

(format t "Name: ")
(write (get 'me 'name))
(format t "~CSurname: " #\linefeed)
(write (get 'me 'surname))
(format t "~CAge: " #\linefeed)
(write (get 'me 'age))
(format t "~CDay of Birth: " #\linefeed)
(write (get (get 'me 'birthday) 'day))
(format t "~CMonth of Birth: " #\linefeed)
(write (get (get 'me 'birthday) 'month))
(format t "~CYear of Birth: " #\linefeed)
(write (get (get 'me 'birthday) 'year))

