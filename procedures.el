;;; ~/Public/02.Master-Emacs-Lisp-with-Solid-Procedures/procedures.el -*- lexical-binding: t; -*-

(sqrt 11)
(log 8 2)
(expt 2 3)

(defun insert-current-date ()
  "Insert the current date"
  (interactive "*")
  (insert (format-time-string "%Y-%m-%d %A" (current-time)))
  )
(defun current-date ()
  (format-time-string "%Y-%m-%d %A" (current-time)))
(current-date)
