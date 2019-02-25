#!/usr/bin/env bash

GIT_USER="${GH_NAME}"

# Exit script as soon as a command fails.
set -o errexit

build() {
    cd website 
    npm install
    npm run publish-gh-pages
}

timestamp() {
    date +"%T"
}

move_index_html() {
    git checkout gh-pages
    curl -o index.html https://raw.githubusercontent.com/satyamakgec/terminalApp/master/website/pages/en/index.html
}

git_push() {
    git add .
    git commit -m `add index ${timestamp}`
    git push origin gh-pages
}

# status_check() {
#     curl -get https://satyamakgec.github.io/terminalApp/
# }

build
move_index_html
git_push

