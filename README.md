TPCodea
=======

Requires TexturePacker 3.0 or greater.

Installation:

If you have already set up TexturePacker's exporter directory, skip to step 3. 

1. Create a new directory somewhere
2. Open TexturePacker, and go to Preferences->Settings, and browse to the directory you just created in the Exporter Directory field
3. Copy the CodeaTab and CodeaChunk folders into the Exporter Directory

That's in! You'll have 2 new Data Format options in TexturePacker: Codea (project tab) and Codea (chunk).

Generating retina sprite sheets
=

You can use TexturePacker's AutoSD option to generate both retina and non-retina versions of your sprite sheet by following these instructions:

1. Click the gear icon next to AutoSD
2. Click the + icon in the empty list
3. In the extension box, type '@2x.' (without the single quotes)
4. Make sure the 'Force identical layout' box in the lower left corner is checked.
5. Close the AutoSD options
6. Make sure the export filenames in the 'Data File' and 'Texture File' fields have a @2x suffix; TexturePacker is good at reminding you about this.


After you publish your sprite sheet, you'll have 4 files. For example, if your sheet is called MySheet, and you've selected .png as the texture format, the files generated will be:

* MySheet.png
* MySheet@2x.png
* MySheet.lua
* MySheet@2x.lua

You can ignore/discard the MySheet@2x.lua file, you won't need it since you checked the "Force identical layout' box in the AutoSD options.


Getting the sprite sheets into Codea and drawing them:
=

See https://github.com/apendley/TPCodeaExample for an example of one way to import TexturePacker sprite sheets into your project and use them to render sprites.

Notes:
=

There is a bug in TexturePacker 3.0.1 with the exporters where normalized texture coordinates are output incorrectly. I've worked around this by making the necessary calculations in the exported .lua file (the joys of Lua!). The next version of TexturePacker will include a fix for this bug, at which point I'll update the exporters to dump the normalized coordinates instead of making the calculations in the exported .lua file.