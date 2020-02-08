 #!/bin/bash
 i3-msg workspace 3
 chromium-browser http://betterhelp.com &
 /home/bryan/dev/kitty/kitty/launcher/./kitty nvim  -c ':GhostStart'& 
 i3-msg layout stacking

