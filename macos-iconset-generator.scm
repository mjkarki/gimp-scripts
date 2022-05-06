(script-fu-register
 "script-fu-macos-iconset-generator"                                    ; Function name
 "Macos Iconset Generator..."                                           ; Menu label
 "Creates PNG images with correct names from the given source image."   ; Description
 "Matti J. Kärki <mjk@iki.fi>"                                          ; Author
 "Copyright 2022, Matti J. Kärki"                                       ; Copyright information
 "2022-05-05"                                                           ; Creation date
 "RGB*"                                                                 ; Supported image types
 SF-IMAGE "Image" 0
 SF-DIRNAME "Destination Folder" "")

; Recommended folder name for icon files: <icon>.iconset.
; How to convert <icon>.iconset to actual icon package:
; iconutil -c icns <icon>.iconset

(script-fu-menu-register
 "script-fu-macos-iconset-generator"
 "<Image>/Image")

(define (save-file folder img)
  (let* ((size (number->string (cadr img)))
         (filename (string-append folder "/icon_" size "x" size ".png")))
    (file-png-save RUN-NONINTERACTIVE
                   (car img)
                   (car (gimp-image-get-active-drawable (car img)))
                   filename filename
                   0 6 0 0 0 0 0)))

(define (script-fu-macos-iconset-generator image folder)
  (if (not (= 1024 (car (gimp-image-width image)) (car (gimp-image-height image))))
      (gimp-message "The image must be 1024x1024!")
      (let ((images (list
                     (append (gimp-image-duplicate image) '(512))
                     (append (gimp-image-duplicate image) '(256))
                     (append (gimp-image-duplicate image) '(128))
                     (append (gimp-image-duplicate image) '(32 ))
                     (append (gimp-image-duplicate image) '(16 )))))
        (for-each (lambda (i)
                    (gimp-image-scale (car i) (cadr i) (cadr i))
                    (save-file folder i))
                  images)
        (gimp-displays-flush))))

