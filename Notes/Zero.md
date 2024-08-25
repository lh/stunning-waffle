# Getting ready (using xubuntu 22.04, same as Ubuntu 20.04) [and updates for xubuntu 24.04]

ZOOM links for meetings

 <https://Universityofexeter.zoom.us/j/89864790376?pwd=elN1MVpDeGFlSG1MTm9BSEw0UWp4dz09>

Meeting ID: 898 6479 0376, Password: 353922



## General installation techniques

 _Important - you need make tools installed!_
`sudo apt-get install build-essential`

### Installing from a downloaded .deb file

`sudo dpkg -i /absolute/path/to/deb/file`
then if (when!) it fails, to make sure all dependencies are fixed:

`sudo apt-get install -f` and rerun dpkg.

## Specific packages

### Anaconda (Python)

Installing anaconda - anaconda-navigator not running on xubuntu on HSMA

#### More details on conda and anaconda

Easiest to create a virtual environment (see python_environment.md) and then activate it in the vscode terminal; then activate within vscode
To activate the Anaconda environment in VSCode, you need to select it as your Python interpreter. Open the Command Palette (Ctrl+Shift+P), type Python: Select Interpreter , and hit Enter. A list of available interpreters will appear. Select the one that corresponds to your Anaconda environment.

## Conda on linux
Rather than the whole anaconda distribution can just
install conda on ubuntu using:
```bash
mkdir -p ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh

bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3

rm -rf ~/miniconda3/miniconda.sh
# initialise
~/miniconda3/bin/conda init bash
```
If you restart your terminal your prompt should be prefixed by "(base)". 

To change conda repositories (they call them channels), create and activate an environment:

```bash
conda create -n minimal_ds
conda activate minimal_ds
```
and then choose your channel (repository)
```bash
conda config --env --add channels conda-forge
# and make it so that conda-forge is preferred even if newer exists elsewhere
conda config --env --set channel_priority strict
```

Setting a minimal datascience installation in base with
```bash
conda install pandas scikit-learn matplotlib notebook
```

and to get other stuff working
```bash
conda install 

```
### conda by itself led to all sorts of compatability nightmares. 

Instead back to anaconda
```bash
Anaconda3-2024.02-1-Linux-x86_64.sh

curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh

bash ~/Downloads/Anaconda3-2024.02-1-Linux-x86_64.sh
```


### LaTeX and LyX

`sudo apt-get install texlive-full` (it is easier than messing around with tlmgr)

NB there is a bug in the texlive-full installation process - it hangs at "ConTeXt Mark IV format". Press enter until it moves on!

(note for 24.04 - no bug!)

`sudo apt-get install lyx`

### Git

install git

`sudo apt install git`

### GitHub

install github

`sudo apt install gh`

give github authority

`gh auth login`

`mkdir (whatever)`

`cd (whatever)`

Clone from git:
1a
`gh repo clone hsma-programme/h6_1a_welcome_to_hsma`
1b
`gh repo clone hsma-programme/h6_1b_intro_or_ds`

#### To download material from one repository and then commit to a different repository, you can follow these steps:

Clone the repository from which you want to download the material. Replace source_repo_url with the URL of the repository.
```bash
git clone source_repo_url
```

Navigate into the cloned repository's directory.
```bash
cd repository_name
```
Remove the original Git remote, which is named origin by default.
```bash
git remote remove origin
```
Add your own repository as a new remote. Replace your_repo_url with the URL of your repository.
```bash
git remote add origin your_repo_url
```
Now, you can commit changes to your own repository.
```bash
git add .
git commit -m "Your commit message"
git push origin master
```
### QGIS

Painful to install, use their website guide
<https://qgis.org/en/site/forusers/alldownloads.html#debian-ubuntu>

## Quarto

Download from their website at <https://quarto.org/docs/get-started/> then install as per .deb packages

### R

To obtain the latest R 4.1 packages, add an entry like

`deb https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/`

in your /etc/apt/sources.list file.

`sudo apt update -qq`

`sudo apt install --no-install-recommends software-properties-common dirmngr`

#### this fails on 22.04

`gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc`

Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9

`sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"`

`sudo apt install --no-install-recommends r-base`

Trying

`wget https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc`

Confirm E298A3A825C0D65DFD57CBB651716619E084DAB9 with an expiration date of 2027-09-30 using

`gpg --show-keys ./marutter_pubkey.asc`

can then put the key in the right place:

`wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc`
Or copy it manually to the correct place and name.

## R on 24.04
```bash
# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt install --no-install-recommends r-base

# Add repository
sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+
# update index again
sudo apt update -qq

```
### Important note 6 May 2024
RStudio doesn't run after installing until permissions are changed with:
```bash
sudo chmod 4755 /usr/lib/rstudio/chrome-sandbox 
```
this will probably be ironed out soon as the version is certified for 22.04, not 24.04

### Rstudio

Download from their website <https://posit.co/download/rstudio-desktop/>

Install as per .deb files.

At the end running `quarto check` gives a good summary of your installation.

This is my installation 14-4-2024

```bash
Quarto 1.4.553
[✓] Checking versions of quarto binary dependencies...
      Pandoc version 3.1.11: OK
      Dart Sass version 1.69.5: OK
      Deno version 1.37.2: OK
[✓] Checking versions of quarto dependencies......OK
[✓] Checking Quarto installation......OK
      Version: 1.4.553
      Path: /opt/quarto/bin

[✓] Checking tools....................OK
      TinyTeX: (not installed)
      Chromium: (not installed)

[✓] Checking LaTeX....................OK
      Using: Installation From Path
      Path: /usr/bin
      Version: 2021

[✓] Checking basic markdown render....OK

[✓] Checking Python 3 installation....OK
      Version: 3.11.7 (Conda)
      Path: /home/luke/anaconda3/bin/python
      Jupyter: 5.5.0
      Kernels: python3

[✓] Checking Jupyter engine render....OK

[✓] Checking R installation...........OK
      Version: 4.3.3
      Path: /usr/lib/R
      LibPaths:
        - /home/luke/R/x86_64-pc-linux-gnu-library/4.3
        - /usr/local/lib/R/site-library
        - /usr/lib/R/site-library
        - /usr/lib/R/library
      knitr: (None)
      rmarkdown: (None)

      The knitr package is not available in this R installation.
      Install with install.packages("knitr")
      The rmarkdown package is not available in this R installation.
      Install with install.packages("rmarkdown")
```
Installation in d 6-5-2024
```bash
Quarto 1.4.554                                                                  
[✓] Checking versions of quarto binary dependencies...                          
      Pandoc version 3.1.11: OK                                                 
      Dart Sass version 1.69.5: OK                                              
      Deno version 1.37.2: OK                                                   
[✓] Checking versions of quarto dependencies......OK                            
[✓] Checking Quarto installation......OK                                        
      Version: 1.4.554                                                          
      Path: /opt/quarto/bin                                                     
                                                                                
[✓] Checking tools....................OK
      TinyTeX: (not installed)                                                  
      Chromium: (not installed)                                                 
                                                                                
[✓] Checking LaTeX....................OK
      Using: Installation From Path                                             
      Path: /usr/bin                                                            
      Version: 2023   

[✓] Checking basic markdown render....OK

[✓] Checking Python 3 installation....OK
      Version: 3.12.2 (Conda)
      Path: /home/luke/miniconda3/bin/python
      Jupyter: 5.5.0
      Kernels: python3

[✓] Checking Jupyter engine render....OK

[✓] Checking R installation...........OK
      Version: 4.4.0
      Path: /usr/lib/R
      LibPaths:
        - /home/luke/R/x86_64-pc-linux-gnu-library/4.4
        - /usr/local/lib/R/site-library
        - /usr/lib/R/site-library
        - /usr/lib/R/library
      knitr: 1.46
      rmarkdown: 2.26

[✓] Checking Knitr engine render......OK

```

## Zoom

Download from the website <https://us04web.zoom.us/support/download>

May need to import key
`sudo apt install rpm` if not already there
download the key form their website
<https://us04web.zoom.us/linux/download/pubkey?version=5-12-6> NB this is subject to change so check on site.

`rpm --import package-signing-key-[version].pub`

Then install using the .deb instructions above.

### Slack

Download from their website <https://slack.com/intl/en-gb/downloads/instructions/ubuntu>

then install as per any .deb file.

## Draw.io and Mermaid

1. Select the draw.io macro in your Confluence by typing / which brings up the macros menu.
2. Choose a blank diagram and don’t forget to give your new diagram a name.
3. Go to the toolbar and select the + symbol.
(You can also insert a mermaid diagram using the menu bar: Arrange > Insert > Advanced > Mermaid)
4. Select Advanced and then Mermaid.
A dialog box will pop up where you can enter the text for the diagram you want to create.