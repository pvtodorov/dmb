## 1. Setting Up the Conda Environment

To set up the `dmb` conda environment, follow the steps below:

### 1.1 Clone the repository:

```bash
git clone https://github.com/pvtodorov/dmb.git
cd dmb
```

### 1.2 Check for Conda:
    Make sure you have [Anaconda](https://www.anaconda.com/products/distribution) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) installed on your system. You can check this by running:

```bash
conda --version
```

    If conda is installed, this should return a version number. If not, you'll need to install either Anaconda or Miniconda.

### 1.3 Change the values in `environment.yml`:

The `environment.yml` file has some variables which should be removed or edited to match the paths on your system.
```yaml
variables:
PROJECT_DIR: /projects/petar/dmb/ # the directory where you cloned the repo
R_ENVIRON_USER: /projects/petar/dmb/.Renviron # the .Renviron file in the repo directory
R_PROFILE_USER: /projects/petar/dmb/.Rprofile # the .Rprofile in the repo directory
```

Additional changes should be made to:
- `"cbmrcomp01fl"` in the `.Rprofile`
- `TMPDIR`, `PROJECT_DIR=`, `R_ENVIRON_USER`, `R_PROFILE_USER` in `.Renviron`


### 1.4 Create the `dmb` Conda environment:

From the `environment.yml` file, create the `dmb` conda environment:

```bash
conda env create -f environment.yml -n dmb
```

This command creates a new conda environment named `dmb` based on the dependencies specified in the `environment.yml` file.

### 1.5 Activate the `dmb` environment:

```bash
conda activate dmb
```

Now you're ready to run the code in the `dmb` environment!

If you ever need to deactivate the environment, you can do so with:

```bash
conda deactivate
```



## 2. Setup R environment

Activate the dmb conda environment 
```bash
conda activate dmb
```

Open R and install the packages from the renv lockfile
```r
install.packages('renv')
renv::restore()
```

## 3. Run through the preprocessing steps and analyses

The repository is structured in numbered directories designed to be run in order. Notebooks and scripts within each are also numbered in the order in which they should be executed. Scripts which are not numbered can be run in any order.