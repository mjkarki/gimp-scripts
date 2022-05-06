(script-fu-register
 "script-fu-mask-color-to-alpha"                                              ; Function name
 "Mask Color to Alpha Channel..."                                                ; Menu label
 "Replaces selected mask color with alpha channel and clears the mask color." ; Description
 "Matti J. Kärki <mjk@iki.fi>"                                                ; Author
 "Copyright 2015, Matti J. Kärki"                                             ; Copyright information
 "2015-04-09"                                                                 ; Creation date
 "RGB*"                                                                       ; Supported image types
 SF-IMAGE "Image" 0
 SF-DRAWABLE "Layer to edit" 0
 SF-COLOR "Color" '(255 0 255))

(script-fu-menu-register
 "script-fu-mask-color-to-alpha"
 "<Image>/Colors")

(define (script-fu-mask-color-to-alpha image layer color)
  (gimp-layer-add-alpha layer)
  (gimp-image-select-color image 0 layer color)
  (gimp-edit-clear layer)
  (gimp-selection-none image)
  (gimp-displays-flush))
