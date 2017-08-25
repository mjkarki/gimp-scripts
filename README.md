# gimp-scripts
My GIMP scripts

Extensions I have created to simplify my workflow.

#### batch-crop.scm

When I need to take a large amounts of screenshots, it's easiest to just hit Print Screen button and paste the entire screen contents to GIMP with Ctrl+Shift+V. Then I use this script automatically to crop all open images to same size.

By using the rectangle selection tool to frame the area from *just one* of the open images and then executing this script (from the drop-down menu *Image --> Crop All Images*) I'm able to automatically crop all images from the exact same area to identical sized images. This makes it easy to document different views of an application.

#### mask-color-to-alpha.scm

Some applications (for example, Visual Basic 6 and related components) use a mask color to apply transparency to bitmap icons without an alpha channel. This script (found under drop-down menu *Layer --> Transparency --> Mask Color to Alpha Channel*) can automatically remove the mask color and replace it with a real alpha channel. This makes it easy to modify older images by using GIMP layers and real transparency. The results can be transformed back to old format just by adding a layer with a mask color to the background and then save the image to older formats.
