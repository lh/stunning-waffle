# Python 1

problems with 1d_demo2.py

Using matplotlib

Needs an appropriate backend defined in matplotlibrc (where is it?)
To find the matplotlibrc that is in use, from a terminal:

```
python3
>>> import matplotlib
>>> matplotlib.matplotlib_fname()
```

Need sudo to edit matplotlibrc; this works for me and on ubuntu the QT 
backend is nicer I think (easy to label graph etc)

```
## ***************************************************************************
## * BACKENDS                                                                *
## ***************************************************************************
## The default backend.  If you omit this parameter, the first working
## backend from the following list is used:
##     MacOSX QtAgg Gtk4Agg Gtk3Agg TkAgg WxAgg Agg
## Other choices include:
##     QtCairo GTK4Cairo GTK3Cairo TkCairo WxCairo Cairo
##     Qt5Agg Qt5Cairo Wx  # deprecated.
##     PS PDF SVG Template
## You can also deploy your own backend outside of Matplotlib by referring to
## the module name (which must be in the PYTHONPATH) as 'module://my_backend'.
backend: Qt5Agg
```

Also the file 1d_demo2.py as furnished omitted a line needed to display:
`plt.show()`

## Python syntax
formatted print uses
`print(f"Hello {variable}")`

Lists defined by `list = [1,a,3,b,5,c]`

Access list by position for reading or writing, `list[2]` is the third item in
the list (lists start at 0). `list[-1]` is the last item.


## Actual teaching notes!
Installing extensions in vs code

1. Python
1. Jupyter

Some settings:

- notebook output scrolling tick!
- notebook output text line limit increase to 500
- 

### Setting up interactive window in vs code

Top right of code window there is an arrowhead - drop it down and you can
select "run code in interactive window"

### ipynb - Jupyter notebooks
If you open a .ipynb then it goes into Jupyter mode. Can inspect variables in
the bottom JUPYTER tab. 

#### Using Jupyter notebooks
Idea of code cells and markdown cells. Can reorder cells. Number to the left
shows the order in which it has been run. 
Jupyter notebooks contain the outputs unless they are reset. 
Access clear all outputs from the elipses at the top near
the restart icon. 

## Installing packages
Need to install with pip:

```bash
pip install numpy
```

or if a particular versionis needed:

```bash
pip install numpy==1.0.1
```

## Environments
Essentially use one virtual environment per project and install in to that environment only.

```bash
conda create --name new_venv
```

and if we want to define the python version

```bash
conda create --name new_env python=3.9.16
```

to start using do

```bash
conda activate new_env
```
and to end:
```bash
conda deactivate
```

can also import from a yaml

```bash
conda env create -f environment.yml
```
it is usually called environment.yml: the actual environment name lives in the yaml.

You can create an environment file from conda:

```bash
conda env export > environment.yml
```

If exporting cross operating system needs a modification 

```bash
conda env export --from-history > environment.yml
```

this _should_ improve compatibility. But it only includes anaconda packages, only conda installed and we do need to use pip!

conda-cheatsheet.pdf <https://docs.conda.io/projects/conda/en/latest/_downloads/843d9e0198f2a193a3484886fa28163c/conda-cheatsheet.pdf>

#### Installing with conda

```bash
conda install pip
```

#### Installing with pip

```bash
pip install numpy
```

## Code patterns

### try .. except

```python
try:
    import numpy
    print ("That worked!  It's probably just an issue with NLTK, which you")
    print ("won't need, so don't worry about it.")
except:
    print ("You seem to have an issue with the Anaconda Distribution")
``` 