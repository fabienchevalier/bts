---
title:  "Kubernetes : La plateforme d'orchestration de containers"
excerpt: "Kubernetes permet d'automatiser le déploiement et la gestion d'applications multi-container..."
header:
    overlay_image: /assets/images/header.jpg
    overlay_filter: 0.6
category: DevOps
toc: true
toc_sticky: true
toc_label: "Table des matières"
toc_icon: "cog"
---
# Qu'est-ce que Kubernetes?
![enter image description here](https://ml32ltopxlgp.i.optimole.com/j9-pdEk-NyyhK8p-/w:auto/h:auto/q:75/https://www.blackcreeper.com/wp-content/uploads/2020/04/kubernetes-logo-big.png)
## Le principe d'un orchestrateur

Un orchestrateur, comme son nom l'indique agit comme une sorte de chef d'orchestre. Dans notre cas, il permet d'automatiser et de configurer le déploiement d'applications multi-container. En effet, beaucoup d'applications reposent sur différents services tournant dans différents containeurs (serveur web apache, base de données, front end web, CMS etc..). Kubernetes sert de liant et permet de gérer l'ensemble au sein d'un cluster.

## Comment fonctionne Kubernetes
![enter image description here](https://images.ctfassets.net/w1bd7cq683kz/5Ex6830HzBPU5h8Ou8xQAB/2c948105fc10094348203bec6c1eab04/Kubernetes_20architecture_20diagram.png)

### Les Pods
Un pod est un groupe de containers. Chaque containeurs dans un pod partagent les mêmes ressources comme la mémoire vive ou le stockage. Les pod possèdent une adresse ip unique, appliquée à chaque containeurs présents en leur sein.

### Les noeuds
Un noeud Kubernet gère et administre les pods; c'est un serveur (virtualisé ou physique) execute la charge de travail. 

### Le plan de contrôle 
C'est le point d'entrée des administrateurs pour gérer les différents noeuds. La gestion des noeuds se fait via des requettes HTTP (api REST).

### Le cluster
Un cluster Kubernete, c'est l'ensemble des 3 composants cités ci-dessus réunis.

# Comment et pourquoi Kubernetes est-il utilisé dans des environnements de production?

En production, Kubernete permet l'automatisation des processus manuels d'hébergement et de déploiement de conteneurs. Aussi, il facilite grandement le transfert des applications depuis l'environnement de développement vers l'environnement de production. Concrètement, Kubernetes permet aux développeurs de ne plus se soucier de l'infrastructure sur laquelle ils codent. Il permet aussi de surveiller, monitorer et assurer une haute disponibilité des ressources. Ainsi, un développeur aura uniquement à se soucier de sa propre création de nouvelles fonctionnalités et non de la stabilité de l’infrastructure lors du déploiement de ses fonctionnalités.


