(script-fu-register
 "script-fu-batch-export-png"
 "Export All Images to PNG..."
 "Exports all open images to PNG files."
 "Matti J. Kärki <mjk@iki.fi>"
 "Copyright 2019, Matti J. Kärki"
 "2019-02-19"
 "RGB*"
 SF-DIRNAME "Folder" "")

(script-fu-menu-register
 "script-fu-batch-export-png"
 "<Image>/Image")

(define (script-fu-batch-export-png folder)
  (for-each (lambda (img)
              (let ((filename (string-append folder "/image_" (number->string img) ".png")))
                (file-png-save RUN-NONINTERACTIVE
                               img
                               (car (gimp-image-get-active-drawable img))
                               filename
                               filename
                               0
                               6
                               0
                               0
                               0
                               0
                               0)))
            (vector->list (cadr (gimp-image-list)))))
