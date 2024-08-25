# Using github

to download a repo without the .git folder:

```bash
git clone https://github.com/user/repo
cd repo
rm -rf .git
```

## NB the usual rm -rf .git will not work if you have submodules!

to remove all previous commits and start a new repo:

```bash
git config --global init.defaultBranch main

find . -name ".git" -type d -exec rm -rf {} + 
find . -name ".gitmodules" -type f -delete

git init
git add .
git commit -m "first commit"

git remote add origin https://github.com/yourusername/your-repo-name.git

git push -u origin main
```

To exclude from the commit, add a file or folder to .gitignore

```bash
echo "file_or_folder_name" >> .gitignore
```

Common casue of ahnging or failure on first commit is if the commit is too large. To fix this, add the following to .gitignore:

```bash 
echo ".ipynb_checkpoints" >> .gitignore
```

If you have already commmited them, remove them from the repo:

```bash
git rm -r --cached .ipynb_checkpoints

git commit -m "Remove .ipynb_checkpoints from version control"
```
Lets say we have set up git, then find we are sending too much junk, so add lots of exceptions to .gitignore. To remove all the files that are already in the repo, but are now in .gitignore, use the following:

```bash
git rm -r --cached .
git add .
git commit -m "Remove all files in .gitignore"
```

To remove a file type from the repo, but not from the local machine:

```bash
git rm --cached "*.pdf"
git commit -m "Remove all files of type pdf"
```

```gitignore

# Ignore all .keras files
*.keras

# But include these specific .keras files
!important_model.keras
!models/critical_model.keras

# If you have a specific directory where you want to track all .keras files
!important_models/
!important_models/*.keras

# Ignore .keras files in all directories
**/*.keras
# But don't ignore .keras files in the 'final_models' directory
!final_models/
!final_models/*.keras
```

## Stripping out notebook outputs

```bash
pip install nbstripout
nbstripout --install
```
This will remove all the outputs from the notebook, but keep the code, in the version control. The local file is not changed, but the version in the repo is.

To apply to existing notebooks:

```bash 
nbstripout notebook.ipynb
```
or recursively with a wildcard:

```bash
nbstripout -r *.ipynb
```

# Important "Gotchas"

If the internet connection ins slow or unreliable, you may need to change some parameters:

```bash
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999
```
