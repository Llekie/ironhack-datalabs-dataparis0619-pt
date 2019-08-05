Nettoyage du fichier de données des attaques de requins

Ouverture du fichier

fonction supprespace : pour nettoyer d'emblée le fichier, application sur l'ensemble des données textuelles de la fonction strip, pour supprimer les espaces inutiles. (les colonnes de chiffres ne peuvent pas contenir d'espaces inutiles)
drop : suppression des éventuels doublons après ce premier nettoyage.

observation du fichier
combien de lignes dans le fichier ?
Test sur les valeurs vides : quel est leur poids dans chaque colonne ?


L'exercice permet d'identifier 2 colonnes presque vides : Unnamed: 22 et Unnamed: 23
L'affichage des quelques valeurs de ces colonnes permet de s'assurer qu'il ne s'agit pas d'un souci de séparateur, et qu'on peut supprimer les colonnes sans souci.


D'après les noms des colonnes :


- comparaison des colonnes href et href formula : elles sont presque identiques. La colonne pdf contient également des données comparables. On choisit de conserver uniquement l'une des colonnes href, qui permet d'avoir le chemin complet pour récupérer les pdf.
Pour savoir laquelle conserver, estimation de la colonne la plus propre :
          - en regardant les divergences avec la colonne pdf
          - en vérifiant les libellés qui se terminent comme on le souhaite (donc par .pdf)

Résultat sans ambiguïté : on conserve hrefformula.
Pour nettoyer et compléter ce champ :
        - on complète les valeurs vides lorsqu'elles sont présentes dans href
        - on remplace les valeurs qui ne se terminent pas ou ne commencent pas comme il faudrait
Une fois ces nettoyages effectués, on vérifie le nombre de lignes encore problématiques : il en reste 5, les derniers éléments à nettoyer seront faits à la main.


- Nettoyage de la colonne de date : On part du postulat que les dates sont pertinentes à partir du moment où on a une précision au mois.


- comparaison des colonnes Case.Number, Case.Number1 et Case.Number2 : elles sont redondantes.
Avant de choisir laquelle conserver, on fait un premier traitement basique pour une première correction, en remplaçant les "-" et "," par des "." pour uniformiser les données. Une fois ces données nettoyées, on liste les lignes problématiques (parce qu'un des 3 champs n'est pas cohérent avec les autres), pour ne s'intéresser qu'à elles.
