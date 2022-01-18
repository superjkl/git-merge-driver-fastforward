# git-merge-driver-fastforward
A custom merge driver which will only do fast-forward merges for each file. A file is marked with a conflict if there have been any changes to the file in the checked out branch since the shared ancestor commit of the branch you are attempting to merge in. If a file is marked with a conflict a diff off the changes in the checked out branch are printed.

## How it works
If there have been any changes in the currently merging file from the ancestor commit to HEAD the merge will fail. Upon failing the diff for the file from the ancestor commit to HEAD will be printed. 

This is a hacky way of using merge drivers to essentially accomplish a custom merge strategy. The intended usage of merge drivers is custom merging behavior for specific file types. This would include merging that is aware of the file's structure and grammar. This custom merge driver essentially acts like the `octopus` merge strategy while still giving the user the option to resolve conflicts manually.

## Usage
To your git attributes configuration add: 

`* merge=fastforward`

To you git config add:
```
[merge "fastforward"]
    name = fastforward merge driver
    driver = <path-to-file>/fastforward-merge-driver.sh %A %O %B %P
```
