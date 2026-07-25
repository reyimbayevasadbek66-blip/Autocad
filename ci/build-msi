;;; DELINSIDE.lsp
;;; Poligon ichidagi obyektlarni o'chirish — yaxshilangan va xavfsiz versiya
(defun c:DELINSIDE (/ pl pts ss cnt i ent)
  (vl-load-com)
  (if (setq pl (car (entsel "\nYopiq poligonni tanlang: ")))
    (progn
      ;; Poligon vertexlarini olish (entget dagi 10 guruhlari)
      (setq pts
            (mapcar 'cdr
                    (vl-remove-if-not
                      '(lambda (x) (= (car x) 10))
                      (entget pl))))
      (if (and pts
               (setq ss (ssget "_CP" pts)))
        (progn
          ;; Poligonni tanlovdan chiqarish (agar u ss ichida bo'lsa)
          (if (and (not (vl-catch-all-error-p (vl-catch-all-apply 'ssdel (list pl ss)))))
            nil)
          (setq cnt (sslength ss))
          (if (> cnt 0)
            (progn
              (command "_.ERASE" ss "")
              (princ (strcat "\n" (itoa cnt) " ta obyekt o'chirildi."))
            )
            (princ "\nPoligon ichida obyekt topilmadi.")
          )
        )
        (princ "\nPoligon vertexlari olinmadi yoki poligon mos kelmadi.")
      )
    )
  )
  (princ)
)
