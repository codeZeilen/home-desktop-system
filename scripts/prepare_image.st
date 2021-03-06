|package zip ws|

"Update the image."
[MCMcmUpdater updateFromServer] valueSupplyingAnswer: true.

"Get the Metacello configuration (for Squeak users)"
Installer gemsource
    project: 'metacello';
    addPackage: 'ConfigurationOfMetacello';
    install.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://metacello/metacello:configuration';
  load.

"Now load latest version of Metacello"
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://metacello/metacello:master/repository';
  get.
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://metacello/metacello:master/repository';
  load.

"If e.g. your tests change code in the image dynamically, the image will require you to set 
author initials which might fail these tests. So we set some dummy initials here to avoid this."
(Smalltalk at: #MetacelloPlatform) current authorName: 'HomeInstallation'.

"Load Home into image"
Metacello new
  baseline: 'Home';
  repository: 'github://hpi-swa-lab/home-desktop-system/repository';
  load: 'default'.

"Prepare Image a little bit"
PluggableSystemWindow allInstances do: #abandon.
ws := Workspace new.
ws contents: '#Welcome to your New Home
This is just an example object which you can safely delete.'.
TheRack add: ws named: 'Welcome'.
RRackTool open.
(ActiveWorld submorphNamed: 'Your Object Rack') bounds: (30@30 corner: 330@430).

SmalltalkImage current snapshot: true andQuit: true.
