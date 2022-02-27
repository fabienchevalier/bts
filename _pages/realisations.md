---
layout: single
title: Réalisations Professionnelles (E5)
excerpt: Ressources documentaires et fiches projets pour le passage de l'épreuve E5
header:
    overlay_image: /assets/images/header.jpg
    overlay_filter: 0.6
    actions:
        - label: "Situation 01"
          url : "/realisations/situation01"
        - label : "Situation 02"
          url : "/realisations/situation02"
permalink: /realisations/
toc: true
toc_sticky: true
toc_label: "Table des matières"
toc_icon: "cog"
---

# Situation 1 : Mise en place d’une solution de gestion des incidents avec GLPI

![](https://glpi-project.org/wp-content/uploads/2017/03/logo-glpi-bleu-1.png)

## Description de la situation

La Maison des Ligues de Lorraine (M2L) a pour mission de fournir des espaces et des services aux différentes ligues sportives régionales et à d’autres structures hébergées.
Dans le cadre d’un plan d’amélioration générale de son infrastructure, la M2L souhaite se doter d’un outil de gestion d’incident lui permettant d’améliorer le support aux utilisateurs.


## Téléchargements

- Fiche mission E5 : [Télécharger](/bts/assets/files/e5/situation_01/situation_01.pdf)
- Schéma de l'infrastructure de la M2L : [Télécharger](/bts/assets/files/e5/situation_01/schema_infra_m2l.pdf)
- Schéma du VLAN Informatique : [Télécharger](/bts/assets/files/e5/situation_01/schema_vlan_info.pdf)
- Identifiants et mots de passes d'accès aux équipements : [Télécharger](/bts/assets/files/e5/situation_01/acces.docx)
- Procédure de déploiement et paramétrage de GLPI  : [Télécharger](/bts/assets/files/e5/situation_01/installation.pdf)
- Procédure de déploiement et paramétrage de l'agent Fusion-Inventory : [Télécharger]()

# Situation 2 : Mise en place du routage inter-vlans (Routeur-on-stick)

![](https://upload.wikimedia.org/wikipedia/commons/0/08/Cisco_logo_blue_2016.svg)

## Description de la situation

La M2L est chargée d'offrir un service d'accès pour les ligues et pour ses services aux ressources hébergées comme aux ressources externes. Le réseau de la M2L est organisé en VLAN et comporte des commutateurs de niveau 2 et un routeur. Les ligues sont organisés par VLAN. Au niveau du domaine de la M2L, les ligues sont représentées par des unités d'organisation. Les serveurs DHCPs étant situé dans le VLAN 2 (informatique), une configuration spécifique est nécessaire afin de permettre aux clients situés dans les différents VLANs d'obtenir une adresse IP dynamiquement.

## Téléchargements

- Fiche mission E5 : [Télécharger]()
- Schéma de l'infrastructure de la M2L : [Télécharger]()
- Schéma du VLAN Informatique : [Télécharger]()
- Maquette PacketTracer : [Télécharger]()
- Procédure de mise en place du routage inter-vlans : [Téléhcarger]()

