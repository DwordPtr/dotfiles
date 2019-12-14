 #!/bin/bash
i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
LIBGL_DEBUG=verbose $ANDROID_SDK_ROOT/emulator/emulator -avd nougat -noskin
