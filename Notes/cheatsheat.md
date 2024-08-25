# CONDA

#### create from file, activate, deactivate
```bash
conda env create -f environment.yml
```

```bash
conda activate myenv
```

```bash
conda deactivate
```
#### to get a list of all the packages in the environment
```bash
conda list
```

```bash
conda save --file environment.yml
```

#### to get a list of all available environments
```bash
conda env list
```

# vs code

Force Visual Studio Code to recognize a new Python environment
Open the Command Palette: Use the shortcut Cmd+Shift+P on Mac.
Select the Python Interpreter: Type Python: Select Interpreter in the Command Palette and press Enter.

To manually specify the path, select the option Enter interpreter path... and then either enter the path or browse to the Python executable 

Reload if Necessary: command palate, Reload Window command

