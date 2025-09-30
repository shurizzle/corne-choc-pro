#!/bin/sh

set -eux

if test -d qmk_firmware; then
    git -C qmk_firmware pull --recurse-submodules
    make -C qmk_firmware clean
else
    git clone --recursive https://github.com/Keebart/vial-qmk-corne-choc-pro.git qmk_firmware
    ln -s ../../../../../shurizzle qmk_firmware/keyboards/keebart/corne_choc_pro/keymaps/shurizzle
fi

make -C qmk_firmware keebart/corne_choc_pro/standard:shurizzle
