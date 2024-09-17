# i3config
my configuration for i3


# userChrome.css
Adapted instructions from https://github.com/MrOtherGuy/firefox-csshacks
___
Go to about:config and set the pref toolkit.legacyUserProfileCustomizations.stylesheets to true

While Firefox is running, go to about:support and find a Profile folder row near the top - there should also be a button labeled "Open folder" next to it. Clicking that button should open the folder in your file manager.

The profile folder should have files like prefs.js and places.sqlite

Firefox loads userChrome.css from <profileFolder>/chrome/userChrome.css. That chrome-folder or the stylesheet files do not exist by default.

Manually copy individual styles directly into userChrome.css
