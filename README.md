# Gestion des Commandes et Livraisons de Pizzas

## Description du projet

Cette application Web permet de gérer les commandes et les livraisons de pizzas, en tenant compte des différents rôles d'utilisateur : **Client**, **Chef Cuisinier**, **Livreur**, et **Administrateur**. Les clients peuvent passer des commandes en ligne, les chefs cuisiniers gèrent la préparation des commandes, et les livreurs effectuent les livraisons. Un administrateur est également introduit pour la gestion des utilisateurs, des menus, et des promotions.

## Fonctionnalités

### Client
- Visualisation du menu des pizzas avec images et prix.
- Sélection des pizzas avec choix de la taille et de la quantité.
- Gestion du panier : ajout, modification, suppression des pizzas.
- Authentification et inscription (si nouveau client).
- Validation des commandes avec suivi en temps réel de l'état.
- Consultation de l'historique des commandes.
- Système de points de fidélité et bons de réduction.

### Chef Cuisinier
- Consultation des commandes avec tri par état (en attente, en cours, prêtes).
- Mise à jour de l'état des commandes (en cours de préparation, prêtes).
- Attribution des commandes aux livreurs disponibles.

### Livreur
- Consultation des commandes assignées.
- Mise à jour de l'état des livraisons (en cours, livrées).
- Consultation des informations du client.

### Administrateur
- Gestion des utilisateurs (création, suppression, modification).
- Gestion du menu (ajout, modification, suppression de pizzas).
- Gestion des promotions et des offres spéciales.
- Gestion des commandes.

## Outils et Technologies Utilisés

### Technologies
- **Java EE** : Utilisation des servlets, JSP, et JSTL pour la logique serveur.
- **JSTL/EL** : Pour la manipulation des données côté serveur dans les pages JSP.
- **HTML/CSS/JavaScript** : Pour la présentation et l'interactivité de l'interface utilisateur.
- **Bootstrap** : Pour un design responsive et moderne.
- **JDBC** : Pour la communication avec la base de données.
- **MySQL** : Base de données utilisée pour stocker les informations (utilisateurs, commandes, pizzas, etc.).
  
### Outils
- **Apache Tomcat** : Serveur d'application pour déployer l'application Web.
- **Maven** : Gestionnaire de projet pour la compilation, la gestion des dépendances, et le packaging.
- **Eclipse/IntelliJ IDEA** : IDE pour le développement Java.
- **Git** : Système de contrôle de version pour la gestion du code source.
- **MySQL Workbench** : Pour la gestion de la base de données MySQL.
- **Figma** : Outil de conception pour les maquettes d'interface utilisateur.

## Maquettes

Les maquettes des différentes interfaces de l'application ont été réalisées avec Figma. 

## Prérequis

- **Java JDK 8+**
- **Apache Tomcat 9+**
- **MySQL 5.7+**
- **Maven 3.6+**

## Démo

Pour voir une démo vidéo de l'application en action, cliquez sur le lien ci-dessous :

https://drive.google.com/file/d/15hv5v0HN9dRRsMc_HaG9fVDVdKBJzXKr/view?usp=sharing

