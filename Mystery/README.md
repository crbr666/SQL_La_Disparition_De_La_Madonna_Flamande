# La Disparition de la Madone Flamande
### Mystere SQL — Module 106

Un jeu d'enquete policiere a resoudre uniquement avec des requetes SQL Server.

---

## Arborescence

```
Mystery/
├── README.md               — Ce fichier
├── docker-compose.yml      — Container SQL Server 2022
├── schema.sql              — Creation de la base de donnees et des tables
├── bulk_insert.sql         — Chargement des donnees depuis les CSV
├── scenario.md             — Histoire et mission de l inspecteur
└── data/
    ├── lieu.csv            — Lieux du musee et des environs
    ├── personne.csv        — Victimes, suspects et temoins
    ├── rapport_crime.csv   — Rapport officiel de l incident
    ├── temoignage.csv      — Declarations des temoins
    ├── acces_badge.csv     — Journal des entrees/sorties du musee
    ├── appel.csv           — Registre des appels telephoniques
    ├── vehicule.csv        — Vehicules enregistres
    └── parking.csv         — Journal du parking du musee
```

---

## Prerequis

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installe et demarre
- Un client SQL : [Azure Data Studio](https://azure.microsoft.com/fr-fr/products/data-studio) ou [DBeaver](https://dbeaver.io/)

---

## Installation

### 1. Demarrer le container SQL Server

Depuis le dossier `Mystery/` :

```bash
docker-compose up -d
```

Attendre environ **30 secondes** que SQL Server soit pret.

Pour verifier que le container tourne :

```bash
docker ps
```

Tu dois voir `mystery_sql` avec le statut `Up`.

---

### 2. Creer le schema de la base de donnees

```bash
docker exec -it mystery_sql /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P 'MysterySql2025!' \
  -i /mystery/schema.sql -No
```

Cette commande cree la base `MystereMusee` et toutes ses tables.

---

### 3. Charger les donnees

```bash
docker exec -it mystery_sql /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P 'MysterySql2025!' \
  -i /mystery/bulk_insert.sql -No
```

Cette commande execute les `BULK INSERT` depuis les fichiers CSV.

---

### 4. Se connecter depuis ton client SQL

| Parametre    | Valeur          |
|--------------|-----------------|
| Serveur      | `localhost,1433` |
| Authentification | SQL Server  |
| Login        | `sa`            |
| Mot de passe | `MysterySql2025!` |
| Base         | `MystereMusee`  |

---

## Tables disponibles

| Table | Description |
|---|---|
| `rapport_crime` | Rapport officiel de l'incident (date, lieu, description) |
| `personne` | Toutes les personnes impliquees (id, nom, prenom, profession...) |
| `lieu` | Lieux du musee et des environs |
| `temoignage` | Declarations recueillies aupres des temoins |
| `acces_badge` | Entrees et sorties du musee avec horodatage |
| `appel` | Appels telephoniques passes dans la nuit du 14 mars |
| `vehicule` | Vehicules enregistres au nom des personnes |
| `parking` | Entrees et sorties du parking du musee |

---

## Comment jouer

1. Lis le fichier `scenario.md` pour decouvrir l'histoire et ta mission.
2. Connecte-toi a la base `MystereMusee` depuis ton client SQL.
3. Commence par explorer les tables avec des `SELECT *` pour comprendre leur structure.
4. Remonte les indices en ecrivant des requetes SQL.
5. Quand tu as identifie le meurtrier et le complice, note ta reponse et demande la correction.

### Par ou commencer ?

```sql
-- Voir toutes les tables disponibles
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;

-- Lire le rapport de crime
SELECT * FROM rapport_crime;
```

---

## Arreter et supprimer le container

```bash
# Arreter le container (les donnees sont conservees)
docker-compose stop

# Supprimer le container completement
docker-compose down
```

---

## Reinitialiser la base de donnees

Si tu veux repartir de zero :

```bash
docker-compose down
docker-compose up -d
# Attendre 30 secondes, puis relancer schema.sql et bulk_insert.sql
```
