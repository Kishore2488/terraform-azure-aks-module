# Terraform Azure AKS Module

![Terraform CI](https://github.com/Kishore2488/terraform-azure-aks-module/actions/workflows/ci.yml/badge.svg)

A reusable Terraform module that provisions an AKS cluster with its supporting network (resource group, VNet, subnet) and container registry — the building block I'd hand to a team that needs a new AKS environment without re-deriving the networking and RBAC wiring each time.

## What's here

- `main.tf` — resource group, VNet/subnet, AKS cluster, ACR, and the role assignment that lets AKS pull from ACR.
- `variables.tf` / `outputs.tf` — the module's public interface.
- `versions.tf` — pinned Terraform and azurerm provider versions.

## Usage

```hcl
module "aks" {
  source               = "github.com/Kishore2488/terraform-azure-aks-module"
  resource_group_name  = "rg-platform-dev"
  location             = "centralindia"
  cluster_name         = "aks-platform-dev"
  node_count           = 2
  vm_size              = "Standard_D2s_v5"
}
```

## CI

Every push runs `terraform fmt -check` and `terraform validate` — no Azure credentials required, so the pipeline stays green without needing a live subscription wired into CI.

## Design notes

- RBAC-enabled AKS with Azure AD integration by default — no static admin kubeconfig credentials to leak.
- ACR pull access is granted via a managed identity role assignment, not a shared pull secret.
- Node pool size and VM SKU are variables, not hardcoded, so the same module serves dev and prod with different tfvars.
