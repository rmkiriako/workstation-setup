#!/usr/bin/env bash

function configure_startup_applications() {
    install_accessibility_utilities

    configure_flycut
    configure_shiftit
}

function configure_flycut() {
    loginitems -a "Flycut"
}

function configure_shiftit() {
    sudo tccutil --insert "org.shiftitapp.ShiftIt"

    loginitems -a "ShiftIt"
}

function install_accessibility_utilities() {
    brew install tccutil

    brew tap OJFord/formulae
    brew install loginitems
}

