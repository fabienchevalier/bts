---
layout: single
title: Mise en place d'une solution de gestion des incidents avec GLPI
excerpt: Documentation complète précisant et décrivant la mise en place d'un logiciel de gestion d'incident avec GLPI
header:
    overlay_image: /assets/images/webheader-glpi-9.5.jpg
    overlay_filter: 0.6
permalink: /realisations/situation01
toc: true
toc_sticky: true
toc_label: "Table des matières"
toc_icon: "cog"
---
# Mise en place d’une solution de gestion des incidents avec GLPI

![](https://www.linuxtricks.fr/upload/logo-glpi.png)

## Contexte

La Maison des Ligues de Lorraine (M2L) a pour mission de fournir des espaces et des services aux différentes ligues sportives régionales et à d’autres structures hébergées.
Dans le cadre d’un plan d’amélioration générale de son infrastructure, la M2L souhaite se doter d’un outil de gestion d’incident lui permettant d’améliorer le support aux utilisateurs. En outre, une procédure détaillée devra être rédigée et remise aux techniciens et utilisateurs afin d'expliquer l'utilisation de l'outil.

## Annexes

_Téléchargements des documents relatifs à la situation._

### Fiche situation professionnelle E5

### Procédure d'utilisation de GLPI à destination des utilisateurs

### Procédure de résolution d'incident à destination des techniciens

### Schémas d'infrastructure

_Le serveur GLPI est situé dans le VLAN informatique de la M2L (VLAN 2)._

#### Infrastructure générale

![](/bts/_pages/exam/infra.png)

#### VLAN informatique

![](/bts/_pages/exam/vlan2.png)

## Déploiement de GLPI

### Prérequis

GLPI nécessite l'installation de dépendances pour fonctionner, à savoir :

- PHP
- Perl
- Une base de données (MySQL ou MariaDB)
- Un serveur web (pile LAMP)

La synchronisation LDAP permettant d’importer les utilisateurs du domaine depuis l’annuaire Active Directory, elle nécessite un contrôleur de domaine déployé et fonctionnel. En outre, le serveur sur lequel GLPI est déployé doit être en mesure de communiquer avec le serveur AD. Dans notre contexte, c'est effectivement le cas.

### Installation des prérequis

L'installation des prérequis se fait en déployant leurs paquets :
`sudo apt-get install -y apache2 perl php-ldap php-imap php-apcu php-xmlrpc php-cas php-mysqli php-mbstring php-curl php-gd php-simplexml php-xml php-intl php-zip php-bz2 mariadb-server`

Une fois l'installation terminée, on relance Apache2:
`sudo systemctl reload apache2`

On vérifie le fonctionnement du serveur web (Apache2) via l'adresse de la boucle locale:
![](/bts/_pages/exam/imgs/apache.png)

#### Paramétrage de la base de donnée

On sécurise l'installation du serveur MariaDB:
`sudo mysql_secure_installation`
![](/bts/_pages/exam/imgs/mysql_secure.png)

On créee la base de donnée et l'user autorisé à y accéder:
![](/bts/_pages/exam/imgs/user_dbase.png)

### Installation de GLPI

Il faut récupérer la dernière version de GLPI disponible sur le site du projet à cette adresse : [https://glpi-project.org/fr/telechargements/](https://glpi-project.org/fr/telechargements/)

A l'heure ou je rédige ses lignes, la dernière version en date est la 9.5.7. Adapter les commandes suivantes en fonction de la dernière version mise à jour:

`sudo tar xzf glpi-9.5.7.tgz -C /var/www/html`

Configuration des droits:
`sudo chown -R www-data:www-data /var/www/html/glpi && chmod -R 775 /var/www/html/glpi`

La suite de l'installation se poursuit vers l'interface web. A l'étape 1, entrer les informations concernant la base de donnée précédemment créée:
![](/bts/_pages/exam/imgs/glpi_web_install.png)

Poursuivre l'installation, puis se connecter avec les ID administrateurs par défaut (GLPI/GLPI) afin de paramétrer le logiciel.

#### Paramétrage de la synchronisation LDAP

La synchronisation LDAP permet d'importer les utilisateurs d'un serveur AD dans la base GLPI. Elle permet entre autres aux utilisateurs de s'identifier par leur identifiants du domaine. Ce paramétrage est très facile à faire dans GLPI. Il suffit de se rendre via l'interface de GLPI dans Configuration>Authentification>Annuaires LDAP et d'y inscrire les informations comme ceci:
![](/bts/_pages/exam/imgs/ldap.png)

On peut ensuite tester la configuration:
![](/bts/_pages/exam/imgs/ldap_config.png)

Et importer les users:
![](/bts/_pages/exam/imgs/ldap_users.png)

#### Paramétrage du DNS

Afin de rendre le serveur GLPI accessible depuis une URL dans l'intranet de la M2L, il faut paramétrer le serveur DNS situé sur l'AD de la M2L. Pour ce faire, on crée un nouvel enregistrement de type A dans la zone DNS m2l.lan:
![](/bts/_pages/exam/imgs/dns.png)

Une fois cette option entrée, GLPI est accessible depuis l'adresse http://support.m2l.lan/glpi:
![](/bts/_pages/exam/imgs/dns.png)

#### Règles d'attribution de profil

Pour les besoins de la M2L, j'ai créé deux profils GLPI qui octroye différents droits en fonction du besoin.

|Droits|Utilisateurs|Techniciens|
|------|------------|-----------|
|Page d'accueil par défaut|Création de ticket|Liste des tickets en cours|
|Création de tickets|Oui|Oui|
|Modification de tickets|Non|Oui|
|Attribution d'un ticket|Non|Oui|
|Clôturer un ticket|Non|Oui|

Ces profils sont attribués automatiquement aux utilisateurs en fonction de leur groupe d'appartenance dans l'AD. Les règles GLPI permettent cela en assignant un profil selon critères:

>Si un utilisateur est membre du groupe AD Technicien N1 alors:
![](/bts/_pages/exam/imgs/regle_tech.png)
![](/bts/_pages/exam/imgs/profil_tech.png)
On lui attribue le profil GLPI Technicien

#### Catégories de tickets

Pour faciliter le tri dans les demandes d’incidents, il est plus aisé de proposer à l’utilisateur de sélectionner une catégorie parmi une liste préétablie. Ces catégories sont modifiables via la configuration des intitulés, Catégories ITIL :
![](/bts/_pages/exam/imgs/itil.png)

## Tests et validation de l'installation

Le comportement attendu est:

- GLPI est accessible depuis cette url : http://support.m2l.lan/glpi
- Un utilisateur membre du domaine peut se connecter sur GLPI
- Il est en mesure de créer un ticket et de lui attribuer une catégorie
- Un technicien est en mesure de se connecter sur GLPI
- Il peut s'attribuer un ticket, et y répondre

### Connexion et création d'un ticket (utilisateur)

Sophia Robert se connecte sur GLPI avec ses identifiants personnels:
![](/bts/_pages/exam/imgs/rsophia_co.png)
Elle expose son problème:
![](/bts/_pages/exam/imgs/rsophia_ticket.png)
Son ticket est désormais enregistré:
![](/bts/_pages/exam/imgs/rsophia_ok.png)

### Connexion et attribution d'un ticket (technicien)

Le technicien se connecte à son portail GLPI:
![](/bts/_pages/exam/imgs/tech_co.png)
Dans l'onglet Assistance, il aperçoit un ticket entrant:
![](/bts/_pages/exam/imgs/tech_attribue.png)
Il se l'attribue, et est en mesure de traiter et de répondre le problème:
![](/bts/_pages/exam/imgs/tech_traite.png)
