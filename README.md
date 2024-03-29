# gimp-scripts
My GIMP scripts

Extensions I have created to simplify my workflow.

#### Installation under Windows

Open Gimp *Preferences* and navigate to *Folders --> Scripts*. Copy all script
files to one of the listed folders.

GIMP should be able to find the scripts automatically. If the GIMP is already
running, execute *Filters --> Script-Fu --> Refresh Scripts*.

#### batch-crop.scm

When I need to take a large amounts of screenshots, it's easiest to just hit
Print Screen button and paste the entire screen contents to GIMP with
Shift+Ctrl+V. Then I use this script automatically to crop all open images to
same size.

By using the rectangle selection tool to frame the area from *just one* of the
open images and then executing this script (from the drop-down menu *Image -->
Crop All Images*) I'm able to automatically crop all images from the exact same
area to identical sized images. So, batch cropping, in other words.

#### mask-color-to-alpha.scm

Some applications (for example, Visual Basic 6 and related components) use a
mask color to apply transparency to bitmap icons without an alpha channel. This
script (found under drop-down menu *Layer --> Transparency --> Mask Color to
Alpha Channel*) can automatically remove the mask color and replace it with a
real alpha channel. This makes it easy to modify older images by using GIMP
layers and real transparency. The results can be transformed back to old format
just by adding a layer with a mask color to the background and then save the
image to older formats. (GIMP has "Color to Alpha...", which I was not aware
of, or it was not available before the version 2.10.)

#### batch-export-png.scm

Exports all open images to a selected folder in PNG format. The script is
located in *Image --> Export All Images to PNG* and it asks for a destination
folder. The script names files using the IMAGE identifier of each image, which
happens to be a number.

#### macos-iconset-generator.scm

Create a 1024x1024 image with transparent background. Draw an icon and ensure
that all layers are merged down so there is a single layer (the transparent
background layer) with the graphics. Execute the script: *Image --> Macos
Iconset Generator...*. Select a destination folder (recommended name for the
folder is "<iconname>.iconset") and press OK. The script will generate all
required images for both regular and HiDPI displays. Finally, from the
terminal, execute "iconutil -c icns <iconname>.iconset" command to create the
actual icon file.

