## Commands
### Install:<br>
`sudo apt-get install git`
### Set up:<br>
- `git config --global user.name "User Name"` <br>
- `git config --global user.email "email@email.com"`
### Create a New Project:<br>
- `mkdir project`<br>
- `cd project`<br>
- `git init` *(initialise empty git repo in my folder (based on path) aka .git folder)* <br>
- `ls -la` *(check my folder)*
### Check "world status":<br>
`git status`
### Help for each command
`git help <command>`
### Add files
- `git add .` = add all on current branch
- `git add -p <param=file>` = add part of file to staging area, ask for each change (if no param => all files) so we have more control and cleaner commits.
*After any `git add`, we need a `git commit`, either a file or a pattern (e.g. `*.txt`)<br>*
### Delete a file
- `git rm <filename>` = deletes a file, updates git and then commit!<br>
- `git rm --cached <filename>"` = delete a previously tracked file
### Move a file
`git mv <old path> <new path>` *should be followed by:*<br>
`git rm <old path>`<br>
`git add <new path>`
### Check difference
- `git diff`= displays what will be added if i `git add`, so what changed in the folder and hasn't been updated yet
- `git diff <filename>` = displays the alterations of a file (the modified and the commited versions of it)
- `git diff --staged` = displays what has already been added and thus what changed will be recorded
- `git diff HEAD` = displays changes since last commit
### Display history
`git-log` = displays the history, the chronologival order of commits (based on their IDs), who did them, what was their description<br>
`git show <id>` = displays what the <id> commit did = `git log` + `git diff`
  
### Make an [alias](https://medium.com/the-lazy-developer/five-life-changing-git-aliases-e4211c090017)
- `git config --global alias.<aliasname> "command(s)"`
<br>e.g.:<br>
`git config --global alias.lg "log --color --graph --pretty=format: '%(red%h%(green(%cr)%((bold blue)<%an>%(reset' --abbrev -commit"`
- `git config --list` - displays our aliases
### Make archive
`git archive --format=zip -o latest.zip HEAD`
### Revert to old commit
`git log`<br>
`git checkout <commit hex id>`
### Cancel not staged changes
`git checkout` = it copies staging area (usually last commit) to out working copy
### Reset
`git reset` - remove all that exists in my staging area by copying them from the most recent commit (basically undoes `git add`)
### Copy a commit to another branch
`git cherry-pick <commit>` = we copy a commit from a point of the graph, we put it on active branch (therefore creating a copy of the selected commit) - new ID, same changes and description!
### Copy changes to new commit
`git revert <commit>` = inverted add/deletes etc. It cancels the commit that has already happened.
### Tags
- `git tag -a <tag>` = adds tag to last commit of current branch
- `git tag -a <tag> <commit>` = add tag to selected commit
- `git tag` = shows all tags in repo
- `git tag -d <tag>` = deletes a tag
### Publish tags
`git push <remote> <tag>` = publishes tag in remote
`git fetch --tags <remote>` = brings all tags from remote
### Serial list of changes
- `git reflog` = all the changes
- `git reflog <branch>` = changes on our branch
- `git reflog --date=relative` = displays changes relative to time
### Prune stale references
 - `git fetch -p`
# Questions
## How many `git add <filename>` do I need?

| Times | What it does |
| ------ | ------ |
| 1 | Tracks `<filename>` |
| 2 | Makes `<filename>` staged |
| 3 | If modified again after staged, we need a thrid `git add` to stage it again |

## What does `git commit` do?
- commit a file = create a snapshot of the current world state (files, folders & their contents)
- contains an explanatory message
- automatically stores metadata (creator, date etc)
- has a unique (hex) id number
<br> *e.g.: `git commit -m "Added README file`*

## Combinations
- `git commit -a` = `git add` + `git commit` (not desirable due to lack of control)
- `git pull` = `git fetch` + `git merge` (very useful)
