# La Disparition de la Madone Flamande
## Mystere SQL — Module 106

---

### Le contexte

Lausanne, le 14 mars 2025, 23h17.

Un appel entre au central de police. Beatrice Morel, agent d'entretien du Musee cantonal des Beaux-Arts, vient de decouvrir le corps de Marc Leblanc, gardien de securite, dans la Salle 7 — celle des peintures flamandes. Le tableau le plus precieux de la collection, *La Madone de Bruges* (XVIIe siecle, valeur estimee : 2.1 millions de francs suisses), a disparu.

Aucune effraction. Le ou la coupable connaissait les lieux.

---

### Ton role

Tu es inspecteur de la Police cantonale vaudoise.

Tu as acces a la base de donnees interne du musee. Elle contient les journaux de badges, les enregistrements du parking, les fiches des personnes liees au musee, et les registres d'appels telephoniques des suspects.

Trouve le meurtrier. Trouve le complice. Explique le mobile.

---

### Tables disponibles

| Table | Contenu |
|---|---|
| `rapport_crime` | Rapport officiel de l'incident |
| `personne` | Toutes les personnes impliquees (victimes, suspects, temoins) |
| `lieu` | Lieux du musee et des environs |
| `temoignage` | Declarations recueillies apres l'incident |
| `acces_badge` | Journal des entrees et sorties du musee (horodatage) |
| `appel` | Registre des appels telephoniques de la nuit du 14 mars |
| `vehicule` | Vehicules enregistres au nom des personnes |
| `parking` | Journal du parking du musee (entrees/sorties) |

---

### Ta mission

Reponds aux trois questions suivantes en t'appuyant uniquement sur des requetes SQL :

1. **Qui a tue Marc Leblanc ?**
2. **Y a-t-il un complice ? Si oui, qui ?**
3. **Quel etait le mobile ?**

Note tes requetes et tes conclusions. Quand tu es pret, demande la correction.

---

### Installation

#### 1. Demarrer le container

```bash
docker-compose up -d
```

Attendre environ 30 secondes que SQL Server soit pret.

#### 2. Se connecter et creer le schema

```bash
docker exec -it mystery_sql /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P 'MysterySql2025!' \
  -i /mystery/schema.sql -No
```

#### 3. Charger les donnees (BULK INSERT)

```bash
docker exec -it mystery_sql /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P 'MysterySql2025!' \
  -i /mystery/bulk_insert.sql -No
```

#### 4. Connexion depuis ton client SQL (Azure Data Studio, DBeaver...)

```
Serveur   : localhost,1433
Login     : sa
Mot de passe : MysterySql2025!
Base     : MystereMusee
```

---

> Bonne chance, inspecteur.
