# Git Commands Cheat Sheet 📋

A collection of essential and frequently used git commands to boost your productivity.

---

## 1. General
- ✅ `git init`: Initializes a new Git repository.
- ✅ `git clone <url>`: Clones an existing Git repository.
- ✅ `git status`: Shows the current state of the working directory.
- ✅ `git add <file>`: Stages changes in a file.
- ✅ `git add ."`: Stage all your changes.
- ✅ `git commit -m "<message>"`: Commits staged changes with a message.
- ✅ `git remote add <remote_name> <url>`: Adds a new remote repository with a given name and URL.
- ✅ `git push -u <remote_name> <branch_name>"`:  Push your local branch to a remote repository and `-u` flag sets the upstream branch for your local branch. This means that subsequent git push commands to the same remote and branch will push your commits directly without specifying the remote and branch names again.

---

## 2. Committing
- ✅ `git log`: Shows commit history.
- ✅ `git diff`: Shows differences between commits, files, or branches.
- ✅ `git reset --hard HEAD^`: Resets the current HEAD to the previous commit.
- ✅ `git revert <commit>`: Reverts a specific commit.
- ✅ `git tag <tag_name>`: Creates a tag at the current commit.

---

## 3. Branch
- ✅ `git branch`: Lists all local branches.
- ✅ `git branch -a`: Lists all local and remote branches.
- ✅ `git branch -v`: Lists branches with additional information.
- ✅ `git branch <branch_name>`: Creates a new branch.
- ✅ `git checkout <branch_name>`: Switches1 to an existing branch.
- ✅ `git checkout -b <branch_name>`: Creates a new branch based on the default branch and switches to it.
- ✅ `git checkout -b <branch_name> <base_branch_name>`: Creates a new branch based on the specified branch and switches to it. This means that the new branch will start at the same commit as the specified branch.
- ✅ `git branch -d <branch_name>`: Deletes a branch.
- ✅ `git branch -D <branch_name>`: Force delete a local Git branch.
- ✅ `git push <remote_name> --delete <branch_name>`: Deletes a remote branch.
- ✅ `git push <remote_name> :<branch_name>`: Deletes a remote branch.
- ✅ `git branch -m <old_name> <new_name>`: Renames a branch.
- ✅ `git branch --merged`: Lists branches that are fully merged into the current branch.
- ✅ `git branch --no-merged`: Lists branches that are not yet merged into the current branch.
- ✅ `git branch --track <remote_branch>`: Creates a local branch that tracks a remote branch.

---

## 4. Remote Repository
- ✅ `git remote -v`: Lists all remote repositories configured for the current project.
- ✅ `git remote add <name> <url>`: Adds a new remote repository with a given name and URL.
- ✅ `git remote rm <name>`: Removes an existing remote repository.
- ✅ `git remote rename <old_name> <new_name>`: Renames an existing remote repository.
- ✅ `git fetch <remote>`: Fetches commits, branches, and tags from a remote repository without merging them into your local branches.
- ✅ `git pull <remote> <branch>`: Fetches commits from a remote branch and merges them into your local branch.
- ✅ `git push <remote> <branch>`: Pushes commits from your local branch to a remote branch.
- ✅ `git remote set-url <remote> <new_url>`: Changes the URL of an existing remote repository.
- ✅ `git remote show <remote>`: Displays detailed information about a remote repository.
- ✅ `git remote prune <remote>`: Removes remote-tracking branches that no longer exist on the remote repository.

---

## 5. Merging
- ✅ `git merge <branch_name>`: Merges the specified branch into the current branch.
- ✅ `git merge --no-commit <branch_name>`: Merges the specified branch but doesn't create a merge commit immediately. This allows you to review the changes before committing.
- ✅ `git merge --abort`: Aborts an ongoing merge process.
- ✅ `git merge --continue`: Continues a merge process after resolving conflicts.
- ✅ `git mergetool`: Opens a visual merge tool to help resolve conflicts.
- ✅ `git merge --squash <branch_name>`: Merges the specified branch into the current branch, combining all commits into a single commit.
- ✅ `git merge --no-ff <branch_name>`: Forces a merge commit even if a fast-forward merge is possible.

---

## 6. Stashing
- ✅ `git stash`: Saves the current state of the working directory.
- ✅ `git stash list`: Lists all stashed changes.
- ✅ `git stash pop`: Removes the most recent stash and applies it to the current branch.
- ✅ `git stash apply`: Applies the most recent stash without removing it.
- ✅ `git stash drop`: Removes the most recent stash.
- ✅ `git stash clear`: Removes all stashes.


---

With these commands, you're equipped to handle various aspects of git efficiently!
