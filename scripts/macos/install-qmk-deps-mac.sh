#!/bin/bash
brew tap osx-cross/avr
brew tap PX4/homebrew-px4
brew update
brew install avr-gcc@8
brew link --force avr-gcc@8
brew install dfu-programmer
brew install dfu-util
brew install gcc-arm-none-eabi
brew install avrdude
