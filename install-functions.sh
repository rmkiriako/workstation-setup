#!/usr/bin/env bash

function install_browsers() {
    brew cask install firefox
    brew cask install google-chrome
}

function install_cd_and_dvd_tools() {
    brew cask install burn
    brew cask install dvdstyler
}

function install_cloudfoundry_cli() {
    brew tap cloudfoundry/tap
    brew install cf-cli
}

function install_communication_tools() {
    brew cask install cord
    brew cask install screenhero
    brew cask install skype
    brew cask install slack
    brew cask install teamviewer
}

function install_database_tools() {
   brew cask install robomongo
   brew cask install squirrelsql
}

function install_file_sharing_tools() {
    brew cask install dropbox
    brew cask install filezilla
    brew cask install google-drive
}

function install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function install_javascript_tools() {
    brew install node

    npm install --global grunt-cli
    npm install --global gulp-cli
}

function install_java_and_tools() {
    brew cask install java
    brew cask install intellij-idea

    brew install gradle
    brew install maven
}

function install_markdown_editor() {
    brew cask install macdown
}

function install_media_tools() {
    brew cask install 4k-video-downloader
    brew cask install soundflower
    brew cask install vlc
}

function install_pdf_tools() {
    brew cask install pdfsam-basic
}

function install_source_code_management_tools() {
    brew install git

    brew cask install sourcetree
}

function install_terminal_utilities() {
    brew install the_silver_searcher
    brew install wget
}

function install_text_editors() {
    brew cask install sublime-text
    brew cask install textmate
}

function install_utilities() {
    brew cask install 1password
    brew cask install flycut
    brew cask install iterm2
    brew cask install postman
    brew cask install rightzoom
    brew cask install shiftit
}

function install_virtualization_tools() {
    brew cask install docker
    brew cask install virtualbox

    brew cask install vagrant
    vagrant plugin install vagrant-vbguest
}

