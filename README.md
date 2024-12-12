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
