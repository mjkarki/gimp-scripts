(script-fu-register
 "script-fu-batch-crop"
 "Crop All Images"
 "Crops all open images based on selection of the active image."
 "Matti J. Kärki <mjk@iki.fi>"
 "Copyright 2017, Matti J. Kärki"
 "2017-08-22"
 "RGB*"
 SF-IMAGE "Image" 0)

(script-fu-menu-register
 "script-fu-batch-crop"
 "<Image>/Image")

(define (script-fu-batch-crop image)
  (let* ((params (gimp-selection-bounds image))
         (selection (list-ref params 0))
         (x1 (list-ref params 1))
         (y1 (list-ref params 2))
         (x2 (list-ref params 3))
         (y2 (list-ref params 4)))
    (when selection
      (for-each (lambda (i)
                  (gimp-image-crop i (- x2 x1) (- y2 y1) x1 y1)
                  (gimp-selection-none i)
                  (gimp-displays-flush))
                (vector->list (cadr (gimp-image-list)))))))
