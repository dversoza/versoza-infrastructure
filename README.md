# Versoza's Infrastructure

This repository contains the infrastructure for Versoza's services ([Daniel Versoza](https://github.com/dversoza)).
It is a collection of [Terraform](https://www.terraform.io/) modules that can be used to deploy
the infrastructure for Oracle Cloud Infrastructure (OCI) resources.

[![CodeFactor](https://www.codefactor.io/repository/github/dversoza/versoza-infrastructure/badge)](https://www.codefactor.io/repository/github/dversoza/versoza-infrastructure)

## Prerequisites

- [Terraform](https://www.terraform.io/) 0.13.0 or later

## Usage

### Terraform

The Terraform modules are located in the `terraform` directory. Each module is a self-contained
Terraform configuration that can be used to deploy a specific resource. The modules are designed
to be used together to deploy the entire infrastructure for Versoza's services.

The modules are designed to be used with the [Terraform OCI Provider](https://www.terraform.io/docs/providers/oci/index.html).
The provider is configured using the [Oracle Cloud Infrastructure Terraform Provider Configuration](https://www.terraform.io/docs/providers/oci/index.html#configuration-reference)
and the [Oracle Cloud Infrastructure Terraform Provider Authentication](https://www.terraform.io/docs/providers/oci/index.html#authentication-reference)
documentation.
