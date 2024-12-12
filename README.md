# Azure Policy as Code

This repository contains Azure Policy definitions and assignments managed as code. The goal is to ensure consistent and automated policy management across your Azure environment.

## Introduction

Azure Policy helps to enforce SMBC standards and assess compliance at-scale. This repository uses Infrastructure as Code (IaC) principles to manage Azure Policy definitions and assignments.

## Prerequisites

- [Bicep CLI](https://github.com/Azure/bicep) installed for unit tests

## Repository Structure

```plaintext
azure-policy-as-code/
├── policies/
│   ├── policy1.bicep
│   ├── policy2.bicep
│   └── ...
├── assignments/
│   ├── assignment1.bicep
│   ├── assignment2.bicep
│   └── ...
├── tests/
│   ├── biceptests.Tests.ps1
│   └── ...
├── docs/
│   └── ...
├── main.bicep
├── README.md
└── ...
```

---

# Development Setup

### Pre-commit Hooks

This guide will help you set up pre-commit hooks to run Bicep template tests before committing your code. This ensures that your templates are always tested and validated.

### Windows (PowerShell)

Create a file named `pre-commit.ps1` in your repository's `.git/hooks` directory with the following content:

```powershell
#!powershell

# Run the Bicep Template Tests
$testResult = Invoke-Pester -Script .\tests\biceptests.Tests.ps1

if ($LASTEXITCODE -ne 0) {
    Write-Host "Bicep Template Tests failed. Commit aborted."
    exit 1
}
```

Make sure the script is executable by running the following command in PowerShell:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Mac and Linux (Shell Script)

Create a file named `pre-commit` in your repository's `.git/hooks` directory with the following content:

```sh
#!/bin/sh

# Run the Bicep Template Tests
if ! pwsh -Command "Invoke-Pester -Script ./tests/biceptests.Tests.ps1"; then
    echo "Bicep Template Tests failed. Commit aborted."
    exit 1
fi
```

Make the script executable by running the following command:

```sh
chmod +x .git/hooks/pre-commit
```

### Final Steps

After creating the appropriate pre-commit hook script for your operating system, every time you attempt to commit changes, the Bicep template tests will run automatically. If the tests fail, the commit will be aborted, ensuring that only validated templates are committed to the repository.