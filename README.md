#TPCodea

Requires Codea for iPad and TexturePacker 3.0 or greater.

##Installing Codea exporters for TexturePacker

If you have already set up TexturePacker's custom exporter directory, skip to step 3. 

1. Create a new directory somewhere
2. Open TexturePacker, and go to Preferences->Settings, and browse to the directory you just created in the Exporter Directory field
3. Copy the CodeaTab and CodeaChunk folders into the Exporter Directory

That's in! You'll have 2 new Data Format options in TexturePacker: Codea (project tab) and Codea (chunk).

##What's the difference between the project tab and chunk exporters?

###Project tab exporter
The project tab exporter produces output that is intended to be placed in a Codea project tab. When a Codea project containing tabs with exported TexturePacker frame data is run, the tables will be placed in the 'tp' namespace. The frame information can be accessed using <code>tp["SpriteSheetName"]</code> (or <code>tp.SpriteSheetName</code> if your sprite sheet name has no spaces). The project tab method is the simpler of the two export methods, however it comes with reduced flexibility (all sprite sheet frame tables are placed in the 'tp' namespace), and can be a memory hog if you have many sprite sheets in your project, since the frame data tables for every sprite sheet in your project are all loaded into memory at once, even when they are not being used. The exported frame data table is also more condensed than the 'chunk' version (i.e. occupies less vertical lines), since Codea can have trouble sometimes with very long files.

###Chunk exporter
The chunk exporter produces output that is intended to be loaded using loadstring()/loadfile(). As such, you have more flexibility in how and when you want to load your sprite sheet frame data. For example, you can serialize the frame data and save it to a file or to your project's data (using saveProjectData()), and de-serialize the frame data whenever you need it, so that you don't have to have all of your project's sprite sheet frame data loaded into memory at once. Also, you can put the loaded frame data into whatever namespace you want, giving you more flexibility to create your own sprite sheet management system. Getting frame data tables from the chunk exported into Codea is also a little more difficult. Currently I use Codea's <code>http.request()</code> and <code>loadstring()</code> to initially download the frame data table from my Dropbox or Github repo into Codea, and then serialize and save it using saveProjectData(). After that, the frame data table can be loaded using <code>readProjectData()</code> and <code>loadstring()</code>. The exported lua file from the chunk exporter is less dense than the tab exporter's output (i.e. table is spread out over more lines of code), to make it more easily readable by humans. The text editor performance concerns are not a factor in this case, since the frame data table is not intended to be used as a project tab.


##Generating retina sprite sheets

###Using Codea's import features to generate a non-retina version of your sprite sheet:
If you plan on importing your sprite sheet textures into Codea using the copy/paste import method or the photo
album import method, you don't need to do anything special in TexturePacker to create retina-ready sprite sheets. 
Just add your double-sized sprites to the sprite sheet in TexturePacker, and export them normally.
In Codea, simply import the texture and name it with the name that your frame data table is expecting (without the @2x suffix), and select the "Retina" option in the importer, 
and Codea will automatically create the non-retina version for you. If you plan on using Dropbox to import your 
sprite sheet textures, use the steps below to have TexturePacker generate the non-retina version of your sprite sheet texture. It is also possible to download and save the texture using http.request() and saveImage(), however I have not tried this yet, so I don't know how this behaves with regard to retina/non-retina versions.


###Using TexturePacker's AutoSD option to generate a non-retina version of your sprite sheet

1. Make sure you are adding double-sized versions of your individual sprites when creating you sprite sheet in TexturePacker
2. Click the gear icon next to AutoSD
3. In the presets, choose the 'Corona @2x' preset and click Apply. Make sure that the 'Force identical layout' option is selected.
4. Close the AutoSD options
5. Make sure the export filenames in the 'Data File' and 'Texture File' fields have a @2x suffix; TexturePacker is good at reminding you about this.


After you publish your sprite sheet, you'll have 4 files. For example, if your sheet is called MySheet, and you've selected .png as the texture format, the files generated will be:

* MySheet.png
* MySheet@2x.png
* MySheet.lua
* MySheet@2x.lua

You can ignore/discard the MySheet@2x.lua file, you won't need it since you checked the "Force identical layout' box in the AutoSD options.
If you plan on using Dropbox to import your sprite sheet textures, copy both the MySheet.png and MySheet@2x.png files into the Apps/Codea folder in your Dropbox, and sync your Dropbox folder in Codea.


##Getting the sprite sheets into Codea and drawing them:

See https://github.com/apendley/TPCodeaExamples for examples of how to use the tpBatch class to batch render TexturePacker-generated sprite sheets for both export methods.

Notes:
=

* There is a exporter bug in TexturePacker 3.0.1 where normalized texture coordinates are output incorrectly. I've worked around this by making the necessary calculations in the exported Lua table itself (the joys of Lua!). The next version of TexturePacker will include a fix for this bug, at which point I'll update the exporters to dump the normalized coordinates instead of making the calculations at run time.
* Andreas Lowe (the creator of TexturePacker) has informed me that he will include these exporters into next version of TexturePacker, so soon they will be built in and it will not be necessary to install them yourself.
