;;; GG.lsp
;;; Avtomatik otmetka ekish — yaxshilangan versiya (entmake TEXT/POINT, TEXTSTYLE saqlanadi)
(defun c:GG (/ baseZ pnt pnt3d txtpt newZ dz i oldTextStyle txtHeight)
  (vl-load-com)
  (setq baseZ (getreal "\nBoshlang'ich balandlikni kiriting: "))
  (if baseZ
    (progn
      (setq oldTextStyle (getvar "TEXTSTYLE"))
      (setq txtHeight (getreal "\nYozuv balandligini kiriting (masalan 1.0): "))
      (if (not txtHeight) (setq txtHeight 1.0))
      (setq i 1)
      (while (setq pnt (getpoint "\nNuqtani tanlang (ESC - Tugatish): "))
        ;; dz — santimetr asosida (1 -> 0.01)
        (setq dz (/ i 100.0))
        (if (= (rem i 2) 1)
          (setq newZ (+ baseZ dz))
          (setq newZ (- baseZ dz)))
        ;; 3D POINT (qizil)
        (setq pnt3d (list (car pnt) (cadr pnt) newZ))
        (entmake
          (list
            '(0 . "POINT")
            (cons 10 pnt3d)
            (cons 62 1) ;; color red
          )
        )
        ;; Matn joylashuvi — kichik ofset (3D insertion poytaxti)
        (setq txtpt (list (+ (car pnt) 1.0) (+ (cadr pnt) 0.5) newZ))
        ;; TEXT entity yaratish entmake bilan
        (entmake
          (list
            '(0 . "TEXT")
            (cons 10 txtpt)
            (cons 40 txtHeight)
            (cons 1 (rtos newZ 2 2)) ;; text string
            (cons 7 oldTextStyle)
            (cons 50 0.0) ;; rotation
            (cons 62 1) ;; color red
          )
        )
        (setq i (1+ i))
      )
      ;; TEXTSTYLE tiklash (asl holat)
      (if oldTextStyle (setvar "TEXTSTYLE" oldTextStyle))
    )
  )
  (princ)
)