;;; Q.lsp
;;; Yozuvsiz otmetka ekish — soddalashtirilgan va barqarorroq
(defun c:Q (/ pnt z_val pnt3d)
  (vl-load-com)
  (while (setq pnt (getpoint "\nNuqtani tanlang (ESC - Tugatish): "))
    (setq z_val (getreal "\nZ balandligini kiriting: "))
    (if z_val
      (progn
        (setq pnt3d (list (car pnt) (cadr pnt) z_val))
        (entmake
          (list
            '(0 . "POINT")
            (cons 10 pnt3d)
            (cons 62 1) ; qizil rang
          )
        )
      )
    )
  )
  (princ "\nDastur tugadi.")
  (princ)
)
