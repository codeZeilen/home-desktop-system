|package zip|

"Update the image."
[MCMcmUpdater updateFromServer] valueSupplyingAnswer: true.

"Get the Metacello configuration (for Squeak users)"

"If e.g. your tests change code in the image dynamically, the image will require you to set 
author initials which might fail these tests. So we set some dummy initials here to avoid this."
(Smalltalk at: #MetacelloPlatform) current authorName: 'Rack'.

"Load Home into image"
Metacello new
  baseline: 'Home';
  repository: 'github://hpi-swa-lab/home-desktop-system/repository';
  load: 'tests'.

SmalltalkImage current snapshot: false andQuit: true.