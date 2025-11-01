# Descrizione

Un esempio concreto di Terraform code che crea semplice architettura, attraverso l'uso dei moduli.

La struttura del progetto:

```bash
web-app/
├── main.tf          # Main configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output values
├── terraform.tfvars # Variable values (non commited se sensibili)
└── modules/
    ├── networking/  # VPC, subnets, security groups
    ├── compute/     # Launch template, ASG
    └── load-balancing/  # ALB, target group
```
