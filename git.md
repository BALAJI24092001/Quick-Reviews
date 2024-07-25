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


## What is a branch?
It is a version of our code. Branches have a name and are pointing to a commit (there's a different history+past commits depending on our branch, but some commits may be common).
<br>
One branche per feature (the smaller the better) so changes happen to the branch, not the master workflow until the final merge. Afterwards, we merge and delete the branch.

## Commands
- `git branch <name>` = creates the branch, it's an exact duplicate of our current/previous branch (they point to the same commit)
- `git branch` = returns my current branch
- `git checkout <name>` = changes current (`HEAD`), `<name>` points to `HEAD` now
- `git branch -d <name>` = deletes this branch (**NOT** the commits also)
- `git checkout -b <name>` = creates a new branch and makes this new branch as our current working one = `git branch <name>` + `git checkout <name>`
- `git merge <branch>` = merges <branch>'s history with my current branch + try to merge changes in files from both the branches => 2 parents in new commit. *(Afterwards we find the most recent parent of those two parents => commits of the new branch = commits of parent1 + commits of parent2 => updates master, master in new commit - see schema (1))*

*schema (1)*
![branch](https://user-images.githubusercontent.com/19435096/66163182-62b38500-e638-11e9-96a8-bc81d9ca43a4.jpg)

*Note: If you make a branch on terminal and want it to show on GitHub, you need to `git push origin branchname` first!*
*Note2: After being done with a branch, `git checkout <productionbranch>`, and then `git merge <tesbranch>` and then `git branch -d <testbranch>` (you can delete the testbranch from GitHub's UX)*
#

### Master Branch
- Our default branch after a `git init` command.
- (For most projects) it has a 'current' code
- Usually we create a new branch as a copy of master

#
## References to parental nodes
| Symbol  | Meaning                                            |
|----|------------------------------------------------------------|
| ~  | 1 commit behind                                            |
| ^  | the first commited parent                                  |
| ~2 | commit's grandpa (2 commits back based on `^` (if merged)) |
| ^2 | second parent from merge                                   |

e.g. `192a812~2` = 2 commits before commit #192a812, or `HEAD^2`

## Rewriting History
We can change our commits' sequence, description and changes, but: **you should not rewrite a history in commits that others may pull** <br>
`git commit --amend` = changes most recent commit, add to it the staged stuff.<br>
`git commit --amend --no-edit` = [check here](https://dev.to/lt0mm/comment/eo8)

## Back Merging
When I work on a branch, it is possible that some changes might have happened on master => we need `git merge master` and resolve the conflicts. Or...
- `git rebase` = like `merge` but better, it happens between two branches and changes the base where a branch has been made, rewrites its history (clean). Followed by a clean `pull request`. Generally we merge only for final pull request on each branch.
- `git rebase -i` = dynamic: changes the sequence of commit applies changes, fixes multiple commits or can break a commit to many.
- `git reset <commit>` (usually `git reset HEAD`) = returns current branchto <commit>, cancels in between changes.

**Not for published commits!!**

- `git push --force-with-lease` or `git push --force` = if I change history, git denies pushing w/o it.

# Git

## Global Settings
- Related Setup: https://gist.github.com/hofmannsven/6814278
- Related Pro Tips: https://ochronus.com/git-tips-from-the-trenches/
- Interactive Beginners Tutorial: http://try.github.io/
- Git Cheatsheet by GitHub: https://services.github.com/on-demand/downloads/github-git-cheat-sheet/

## Reminder
Press `minus + shift + s` and `return` to chop/fold long lines!

Show folder content: `ls -la`

## Notes
Do not put (external) dependencies in version control!

## Setup
See where Git is located:
`which git`

Get the version of Git:
`git --version`

Create an alias (shortcut) for `git status`:
`git config --global alias.st status`

Help:
`git help`

## General
Initialize Git:
`git init`

Get everything ready to commit:
`git add .`

Get custom file ready to commit:
`git add index.html`

Commit changes:
`git commit -m "Message"`

Commit changes with title and description:
`git commit -m "Title" -m "Description..."`

Add and commit in one step:
`git commit -am "Message"`

Remove files from Git:
`git rm index.html`

Update all changes:
`git add -u`

Remove file but do not track anymore:
`git rm --cached index.html`

Move or rename files:
`git mv index.html dir/index_new.html`

Undo modifications (restore files from latest commited version):
`git checkout -- index.html`

Restore file from a custom commit (in current branch):
`git checkout 6eb715d -- index.html`

## Reset
Go back to commit:
`git revert 073791e7dd71b90daa853b2c5acc2c925f02dbc6`

Soft reset (move HEAD only; neither staging nor working dir is changed):
`git reset --soft 073791e7dd71b90daa853b2c5acc2c925f02dbc6`

Undo latest commit: `git reset --soft HEAD~ `

Mixed reset (move HEAD and change staging to match repo; does not affect working dir):
`git reset --mixed 073791e7dd71b90daa853b2c5acc2c925f02dbc6`

Hard reset (move HEAD and change staging dir and working dir to match repo):
`git reset --hard 073791e7dd71b90daa853b2c5acc2c925f02dbc6`

Hard reset of a single file (`@` is short for `HEAD`):
`git checkout @ -- index.html`

## Update & Delete
Test-Delete untracked files:
`git clean -n`

Delete untracked files (not staging):
`git clean -f`

Unstage (undo adds):
`git reset HEAD index.html`

Update most recent commit (also update the commit message):
`git commit --amend -m "New Message"`

## Branch
Show branches:
`git branch`

Create branch:
`git branch branchname`

Change to branch:
`git checkout branchname`

Create and change to new branch:
`git checkout -b branchname`

Rename branch:
`git branch -m branchname new_branchname` or:
`git branch --move branchname new_branchname`

Show all completely merged branches with current branch:
`git branch --merged`

Delete merged branch (only possible if not HEAD):
`git branch -d branchname` or:
`git branch --delete branchname`

Delete not merged branch:
`git branch -D branch_to_delete`

## Merge
True merge (fast forward):
`git merge branchname`

Merge to master (only if fast forward):
`git merge --ff-only branchname`

Merge to master (force a new commit):
`git merge --no-ff branchname`

Stop merge (in case of conflicts):
`git merge --abort`

Stop merge (in case of conflicts):
`git reset --merge` // prior to v1.7.4

Undo local merge that hasn't been pushed yet:
`git reset --hard origin/master`

Merge only one specific commit: 
`git cherry-pick 073791e7`

Rebase:
`git checkout branchname` » `git rebase master`
or:
`git merge master branchname`
(The rebase moves all of the commits in `master` onto the tip of `branchname`.)

Cancel rebase:
`git rebase --abort`

Squash multiple commits into one:
`git rebase -i HEAD~3` ([source](https://www.devroom.io/2011/07/05/git-squash-your-latests-commits-into-one/))

Squash-merge a feature branch (as one commit):
`git merge --squash branchname` (commit afterwards)

## Stash
Put in stash:
`git stash save "Message"`

Show stash:
`git stash list`

Show stash stats:
`git stash show stash@{0}`

Show stash changes:
`git stash show -p stash@{0}`

Use custom stash item and drop it:
`git stash pop stash@{0}`

Use custom stash item and do not drop it:
`git stash apply stash@{0}`

Use custom stash item and index:
`git stash apply --index`

Create branch from stash: 
`git stash branch new_branch`

Delete custom stash item:
`git stash drop stash@{0}`

Delete complete stash:
`git stash clear`

## Gitignore & Gitkeep
About: https://help.github.com/articles/ignoring-files

Useful templates: https://github.com/github/gitignore

Add or edit gitignore: 
`nano .gitignore`

Track empty dir: 
`touch dir/.gitkeep`

## Log
Show commits:
`git log`

Show oneline-summary of commits:
`git log --oneline`

Show oneline-summary of commits with full SHA-1:
`git log --format=oneline`

Show oneline-summary of the last three commits:
`git log --oneline -3`

Show only custom commits:
`git log --author="Sven"`
`git log --grep="Message"`
`git log --until=2013-01-01`
`git log --since=2013-01-01`

Show only custom data of commit:
`git log --format=short`
`git log --format=full`
`git log --format=fuller`
`git log --format=email`
`git log --format=raw`

Show changes:
`git log -p`

Show every commit since special commit for custom file only:
`git log 6eb715d.. index.html`

Show changes of every commit since special commit for custom file only:
`git log -p 6eb715d.. index.html`

Show stats and summary of commits:
`git log --stat --summary`

Show history of commits as graph:
`git log --graph`

Show history of commits as graph-summary:
`git log --oneline --graph --all --decorate`

## Compare
Compare modified files:
`git diff`

Compare modified files and highlight changes only:
`git diff --color-words index.html`

Compare modified files within the staging area:
`git diff --staged`

Compare branches:
`git diff master..branchname`

Compare branches like above:
`git diff --color-words master..branchname^`

Compare commits:
`git diff 6eb715d`
`git diff 6eb715d..HEAD`
`git diff 6eb715d..537a09f`

Compare commits of file:
`git diff 6eb715d index.html`
`git diff 6eb715d..537a09f index.html`

Compare without caring about spaces:
`git diff -b 6eb715d..HEAD` or:
`git diff --ignore-space-change 6eb715d..HEAD`

Compare without caring about all spaces:
`git diff -w 6eb715d..HEAD` or:
`git diff --ignore-all-space 6eb715d..HEAD`

Useful comparings:
`git diff --stat --summary 6eb715d..HEAD`

Blame:
`git blame -L10,+1 index.html`

## Releases & Version Tags
Show all released versions:
`git tag`

Show all released versions with comments:
`git tag -l -n1`

Create release version:
`git tag v1.0.0`

Create release version with comment:
`git tag -a v1.0.0 -m 'Message'`

Checkout a specific release version:
`git checkout v1.0.0`

## Collaborate
Show remote:
`git remote`

Show remote details:
`git remote -v`

Add remote upstream from GitHub project:
`git remote add upstream https://github.com/user/project.git`

Add remote upstream from existing empty project on server:
`git remote add upstream ssh://root@123.123.123.123/path/to/repository/.git`

Fetch:
`git fetch upstream`

Fetch a custom branch:
`git fetch upstream branchname:local_branchname`

Merge fetched commits:
`git merge upstream/master`

Remove origin:
`git remote rm origin`

Show remote branches:
`git branch -r`

Show all branches (remote and local):
`git branch -a`

Create and checkout branch from a remote branch:
`git checkout -b local_branchname upstream/remote_branchname`

Compare:
`git diff origin/master..master`

Push (set default with `-u`):
`git push -u origin master`

Push:
`git push origin master`

Force-Push:
`git push origin master --force

Pull:
`git pull`

Pull specific branch:
`git pull origin branchname`

Fetch a pull request on GitHub by its ID and create a new branch:
`git fetch upstream pull/ID/head:new-pr-branch`

Clone to localhost:
`git clone https://github.com/user/project.git` or:
`git clone ssh://user@domain.com/~/dir/.git`

Clone to localhost folder:
`git clone https://github.com/user/project.git ~/dir/folder`

Clone specific branch to localhost:
`git clone -b branchname https://github.com/user/project.git`

Clone with token authentication (in CI environment):
`git clone https://oauth2:<token>@gitlab.com/username/repo.git`

Delete remote branch (push nothing):
`git push origin :branchname` or:
`git push origin --delete branchname`

## Archive
Create a zip-archive: `git archive --format zip --output filename.zip master`

Export/write custom log to a file: `git log --author=sven --all > log.txt`

## Troubleshooting
Ignore files that have already been committed to a Git repository: http://stackoverflow.com/a/1139797/1815847

## Security
Hide Git on the web via `.htaccess`: `RedirectMatch 404 /\.git` 
(more info here: http://stackoverflow.com/a/17916515/1815847)

## Large File Storage
Website: https://git-lfs.github.com/

Install: `brew install git-lfs`

Track `*.psd` files: `git lfs track "*.psd"` (init, add, commit and push as written above)
