TPCodea
=======

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


Getting the sprite sheets into Codea
=

The easiest way is probably using Dropbox. You can place the .png files in the Apps/Codea folder in your dropbox, and sync them in Codea. You can place the .lua file in your public folder, and import it into Codea using http.request(). Or you can just copy and paste the .lua file into a project tab. There are definitely other ways to get your sprite sheets into Codea, use whichever way you think is best. I'll update soon to post step by step methods for getting your sprite sheets into Codea, but for now you're on your own.

Drawing your batched sprites in Codea:
=

I've added a simple class to render batched sprites using TexturePacker sprite sheets at https://github.com/apendley/CodeaMisc (tpBatch.lua). It's basic at the moment, but it gets the job done. I will be extending the class soon to add more features.