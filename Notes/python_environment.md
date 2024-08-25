
# Using pip with anaconda

For others who run into this situation, I found this to be the most straightforward solution:

Run

`conda create -n venv_name`

and

`conda activate venv_name`

where venv_name is the name of your virtual environment.
Run

`conda install pip`

This will install pip to your venv directory.
Find your anaconda directory, and find the actual venv folder. It should be somewhere like /anaconda/envs/venv_name/.

Install new packages by doing

`/anaconda/envs/venv_name/bin/pip install package_name`

This should now successfully install packages using that virtual environment's pip!

To leave the venv use `conda deactivate`
