---
title:  "Terraform : un outil d'Infrastructure as Code"
excerpt: "Terraform permet aux développeur de créer, modifier et versionner une infrastructure..."
header:
    overlay_image: /assets/images/header.jpg
    overlay_filter: 0.6
category: DevOps
toc: true
toc_sticky: true
toc_label: "Table des matières"
toc_icon: "cog"
---
# Qu'est-ce que l'infrastructure as code (IaC)?

![](https://www.iguanesolutions.com/wp-content/uploads/2021/04/Terraform_PrimaryLogo_FullColor_RGB.png)
On peut comparer l'IaC au processus de compilation d'un programme informatique depuis le code source. En effet, un compilateur transforme des lignes de codes en un fichier binaire exploitable par n'importe quel ordinateur. L'IaC génère la même infrastructure à chaque fois qu'elle est lancée. Elle peut ainsi permettre aux équipes Dev et Ops de tester des applications dans des environnement proches de l'environnement de production final. 
# Terraform, un outil open-source d'IaC

> Terraform est un outil permettant la mise en place d'IaC. Il permet donc de stocker la configuration d'infrastructures entières sous forme de code, puis de les provisionner sur le cloud via des connecteurs (provider) tel qu'AWS, Azure, OVH etc... 

## HCL, le language Terraform
Terraform utilise un langage appelé HCL (pour HarshiCorp Configuration Langage) pour effectuer les configurations d'infrastructures. Il permet d'écrire rapidement des ressources à l'aide de blocs, arguments et expressions.