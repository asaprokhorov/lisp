(setq me 'person)
(format t "Input name: ")
(setq name (read))
(format t "Input surname: ")
(setq surname (read))
(format t "Input age: ")
(setq age (read))

(setf (get 'me 'name) name)
(setf (get 'me 'surname) surname)
(setf (get 'me 'age) age)

(format t "Name: ")
(write (get 'me 'name))
(format t "~CSurname: " #\linefeed)
(write (get 'me 'surname))
(format t "~CAge: " #\linefeed)
(write (get 'me 'age))

