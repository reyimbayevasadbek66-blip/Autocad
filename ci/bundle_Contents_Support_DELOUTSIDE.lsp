;;; DELOUTSIDE.lsp
;;; Poligon tashqarisidagi obyektlarni o'chirish — yaxshilangan va xavfsiz versiya
(defun c:DELOUTSIDE (/ pl pts ssAll ssIn i ent cnt)
  (vl-load-com)
  (if (setq pl (car (entsel "\nYopiq poligonni tanlang: ")))
    (progn
      ;; Chizmadagi barcha obyektlar
      (setq ssAll (ssget "_X"))
      ;; Poligon vertexlarini olish
      (setq pts
            (mapcar 'cdr
                    (vl-remove-if-not
                      '(lambda (x) (= (car x) 10))
                      (entget pl))))
      (if pts
        (setq ssIn (ssget "_CP" pts))
        (setq ssIn nil))
      (if (and ssAll)
        (progn
          ;; Ichidagi obyektlarni ssAll dan chiqaramiz (poligon o'zini saqlash uchun)
          (if ssIn
            (progn
              (setq i 0)
              (while (< i (sslength ssIn))
                (setq ent (ssname ssIn i))
                (ssdel ent ssAll)
                (setq i (1+ i))
              )
            )
          )
          ;; Endi ssAll faqat tashqaridagi elementlarni o'z ichiga oladi
          (setq cnt (sslength ssAll))
          (if (> cnt 0)
            (progn
              (command "_.ERASE" ssAll "")
              (princ (strcat "\n" (itoa cnt) " ta tashqi obyekt o'chirildi."))
            )
            (princ "\nO'chiriladigan obyekt topilmadi.")
          )
        )
        (princ "\nChizma ichidagi obyektlarni olishda xatolik.")
      )
    )
  )
  (princ)
)