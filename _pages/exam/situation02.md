---
layout: single
title: Préparation de l’arrivée d’une nouvelle ligue dans le réseau de la M2L 
excerpt: Documentation complète précisant et décrivant la configuration réseau de la M2L
header:
    overlay_image: /assets/images/header_cisco.png
    overlay_filter: 0.6
permalink: /realisations/situation02
toc: true
toc_sticky: true
toc_label: "Table des matières"
toc_icon: "cog"
---
# Intégration d’une nouvelle ligue dans l’infrastructure réseau de la M2L 

## Contexte

La M2L est chargée d’offrir un service d’accès pour les ligues et pour ses services aux ressources hébergées comme aux ressources externes.
Le réseau de la M2L est organisé en VLAN et comporte des commutateurs de niveau 2 et un routeur. Chaque ligue possède son propre VLAN. Au niveau du domaine de la M2L, les ligues sont représentées en unités d’organisation.

## Annexes

_Téléchargements des documents relatifs à la situation._

* Fiche situation professionnelle E5 : [Télécharger](/bts/_pages/exam/Situation_E5_2_commutation.pdf)
* Dossier de l'infrastructure M2L : [Télécharger](/bts/_pages/exam/Infra_maj.pdf)
* Simulation PacketTracer du réseau (Packet Tracer version 8.1) : [Télécharger](/bts/_pages/exam/cisco.pkt)
* Schéma de l'infrastructure réseau:
![](/bts/_pages/exam/infra.png)

## Configuration du routeur RM2L

### Détail de la configuration du routeur RM2L

Le routeur RM2L est configuré afin de :

* Fournir une passerelle aux différents VLAN
* Permettre l'accès à Internet via un NAT
* Permettre un routage inter-vlan permettant aux différentes ligues d'obtenir une adresse IP via les serveurs DHCP situés sur le VLAN 2
* Permettre un routage inter-vlan permettant aux différentes ligues d'accéder aux ressources situés à la DMZ
* Permettre d'accéder aux ressources de la DMZ via l'extérieur sur les ports 80 et 21
* Empêcher les communications inter-vlan non désirées via la mise en place d'ACL

Le fichier de configuration est téléchargeable [en cliquant ici](/bts/_pages/exam/RM2L.txt)

### Détail de la configuration du switch SW1LIG

* Accessible à distance via SSH sur l'adresse 172.16.2.53
* Fait office de serveur VTP pour la synchronisation des VLAN

Le fichier de de configuration est téléchargeable [en cliquant ici](/bts/_pages/exam/SW1LIG.txt)

### Détail de la configuration du switch SW2LIG

* Accessible à distance via SSH sur l'adresse 172.16.2.54
* Client VTP 
* Est relié via la technologie EtherChannel afin de mutualiser certains ports pour augmenter le débit
* Le STP est configuré en mode PVST

Le fichier de de configuration est téléchargeable [en cliquant ici](/bts/_pages/exam/SW2LIG.txt)

### Détail de la configuration du switch SW3LIG

* Accessible à distance via SSH sur l'adresse 172.16.2.55
* Client VTP 
* Est relié via la technologie EtherChannel afin de mutualiser certains ports pour augmenter le débit
* Le STP est configuré en mode PVST

Le fichier de de configuration est téléchargeable [en cliquant ici](/bts/_pages/exam/SW3LIG.txt)

### Détail de la configuration du switch SWM2L

* Accessible à distance via SSH sur l'adresse 172.16.2.56
* Client VTP 
* Est relié via la technologie EtherChannel afin de mutualiser certains ports pour augmenter le débit
* Le STP est configuré en mode PVST

Le fichier de de configuration est téléchargeable [en cliquant ici](/bts/_pages/exam/SWM2L.txt)

### Détail de la configuration du switch SWDM2

* Accessible à distance via SSH sur l'adresse 192.168.16.13
* Seulement le VLAN 20 y est renseigné car fait office de DMZ

Le fichier de de configuration est téléchargeable [en cliquant ici](/bts/_pages/exam/SWDMZ.txt)
