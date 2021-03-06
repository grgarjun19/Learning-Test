#!/bin/bash
function search-branches() {
        for sha1 in `git log --oneline --all --grep "$1" | cut -d" " -f1`
        do
                git branch -r --contains $sha1
        done
}
function search-tags() {
        for sha1 in `git log --oneline --all --grep "$1" | cut -d" " -f1`
        do
                git tag --contains $sha1
        done
}

echo -e "\nRemote branches with '$1' in commit message:"
search-branches $1;
echo -e "\nTags with '$1' in commit message:"
search-tags $1;

# Put this script in any place in your PATH then you can show branches and tags that contain certain commit messages
# $ git search-commit-message "Fixes #1234"

## just added for practice##
