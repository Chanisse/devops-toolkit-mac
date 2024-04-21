# Devops toolkit for Mac

This repository is intended to accelerate a developers local setup by:
1. Automating the installation and configuration of linux command line tools.
2. Providing guides for installing and configuring tools.
3. Providing some basic best practices when using the tools.

## Table of contents
- [Section 1 - Automation](#section-1---automated-actions)
  - [One click solution for linux command line tools](#one-click-solution-for-linux-command-line-tools-via-homebrew)
  - [Tools](#tools)
  - [Best practices](#best-practices)
    - [tfenv](#tfenv)
    - [starship](#starship)
    - [pre-commit](#pre-commit)
    - [pyenv](#pyenv)
    - [git](#git)
- [Section 2 - Guides](#section-2---guides)
  - [oh-my-zsh](#oh-my-zsh)


# Section 1 - Automated actions 

# One click solution for linux command line tools via homebrew
Run the script to automate the installation and configuration of linux ocmmand line tools

### Pre-requisites 
- Install Homebrew : https://brew.sh/

Install homebrew for Mac:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Usage
```
bash brew-install.sh
```

### Tools
| Tool     | Description                                                                      | About                                                                       | Automated action                     |
|----------|----------------------------------------------------------------------------------|------------------------------------------------------------------------------|----------------------------------|
| tfenv    | Terraform version manager                                                        | `tfenv` allows you to switch between versions                                | Installs the latest stable version of Terraform and enables |
| Starship | The minimal, blazing-fast, and infinitely customizable prompt for any shell!     | `Starship` provides a customizable prompt with information you need          | Installs starship and configures a base config file `~/.config/starship.toml` |
| pre-commit| A framework for managing and maintaining pre-commit hooks                       | `pre-commit` manages pre-commit hooks for various tasks like linting, formatting, and more | Installs pre-commit|
| pyenv    | Python version manager                                                            | `pyenv` lets you easily switch between multiple versions of Python            | Installs pyenv. |
| git      | Distributed version control system                                                | `git` is a widely-used version control system                                | Installs git |
| tree     | Display directory structure as a tree                                            | `tree` shows the directory structure in a tree-like format                   | Installs tree |
| wget     | Network utility to retrieve files from the web                                   | `wget` is a command-line utility to download files from the web              | Installs wget |


### Best practices

#### `tfenv`

When juggling projects for different clients or projects, you may need various Terraform versions for compatibility or to ensure older code runs smoothly. However, upgrading Terraform can sometimes lead to unexpected issues so its recommended to use tfenv (tfswitch also works well)

**Best practice**

When using tfenv, it's recommended to specify the Terraform version in your project's .terraform-version file. This ensures consistent Terraform versions across environments and makes it easier for team members to use the correct version.

#### `Starship`
Starship is shell prompt that shows information you need while you're working in your terminal. You can configure this to match your individual workstyle as a developer.

Default config file

```
# Get editor completions based on the config schema
\"\$schema\" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
add_newline = true

# Replace the '❯' symbol in the prompt with '➜'
[character] # The name of the module we are configuring is 'character'
success_symbol = '[➜](bold green)' # The 'success_symbol' segment is being set to '➜' with the color 'bold green'

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
```

**Best practice**
Utilise features like custom segments and colors to create a personalised and informative prompt that enhances your shell experience.

#### `pre-commit`

Implement pre-commit hooks in your repository to automate code checks, ensuring code quality and consistency across contributions. Below is an example for terraform. See more info [here](https://pre-commit.com/).

```
repos:
  - repo: https://github.com/terraform-docs/terraform-docs
    rev: "v0.17.0"
    hooks:
      - id: terraform-docs-go
        args: ["markdown", "table", "--output-file", "README.md", "./"]
  - repo: https://github.com/antonbabenko/pre-commit-terraform
    rev: "v1.89.0"
    hooks:
      - id: terraform_fmt
      - id: terraform_tflint
      - id: terraform_validate
      - id: terraform_tfsec

```

**Best practice**

When setting up pre-commit, regularly update the hooks and dependencies to benefit from the latest improvements and fixes.

```
pre-commit autoupdate
```

#### `pyenv`

Since some of your local MacOS system tools rely on python, you should avoid interferring with python. pyenv will allow you to manage multiple Python versions.

**Best practice**

With pyenv, create a .python-version file in your project directory to specify the Python version needed for your project. This ensures that everyone working on the project uses the correct Python version, avoiding compatibility issues.

#### `git`
See more info for git [here](https://docs.github.com/en/get-started/using-git).

**Best practice**

Utilise feature branches and pull requests for new features or fixes to maintain a clean and organized repository.


## Section 2 - Guides

### Oh my zsh

A framework for managing your zsh configuration. 

Install oh-my-zsh using curl and follow the prompts:

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
