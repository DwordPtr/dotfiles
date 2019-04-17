alias aconf='nvim $HOME/aliases/android.sh'
function kill_emulators(){
	adb devices | grep emulator | cut -f1 | while read line; do adb -s $line emu kill; done
}
