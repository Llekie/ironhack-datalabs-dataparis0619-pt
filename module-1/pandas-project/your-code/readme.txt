Nettoyage du fichier de données des attaques de requins

Ouverture du fichier

fonction supprespace : pour nettoyer d'emblée le fichier, application sur l'ensemble des données textuelles de la fonction strip, pour supprimer les espaces inutiles, au milieu, au début et à la fin des cellules. (les colonnes de chiffres ne peuvent pas contenir d'espaces inutiles)
drop : suppression des éventuels doublons après ce premier nettoyage.

observation du fichier
combien de lignes dans le fichier ?
Test sur les valeurs vides : quel est leur poids dans chaque colonne ?


L'exercice permet d'identifier 2 colonnes presque vides : "Unnamed: 22" et "Unnamed: 23"
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


- Nettoyage de la colonne de date : On part du postulat que les dates sont pertinentes à partir du moment où on a une précision au mois. On extrait donc les dates à partir du moment où on dispose au moins de l'année et du mois : lorsque le jour est présent, on l'utilise, sinon on complète en mettant la date au permier jour du mois.
Puis on sélectionne les dates contenant l'année sur 2 positions et non 4, et on complète l'année : par 20.. lorsque l'année est inférieure à 20, par 19.. dans les autres cas.
Enfin, on complète les années lorsqu'elles sont manquantes, avant de convertir le champ en format date.

- comparaison des colonnes Case.Number, Case.Number1 et Case.Number2 : elles sont redondantes.
Avant de choisir laquelle conserver, on fait un premier traitement basique pour une première correction, en remplaçant les "-" et "," par des "." pour uniformiser les données. Une fois ces données nettoyées, on liste les lignes problématiques (parce qu'un des 3 champs n'est pas cohérent avec les autres), pour ne s'intéresser qu'à elles.
On compare les dates présentes dans les champs étudiés, en ajoutant la colonne de date. Lorsqu'elle est identique dans au moins 3 des 4 champs, on considère que cette date est correcte. Si le champ date contient "reported", on ajoute un suffixe ".R" à la date. Sinon, on vérifie qu'il n'y a pas déjà une occurrence de la date, avant de créer une valeur qui sera unique (si la date est présente, test pour créer un nouveau nom en vérifiant qu'il n'existe pas encore)
S'il n'y a pas majorité dans les dates existantes, on considère que la date du champ "date" est la plus fiable, et on recrée le Case.Number en prenant cette date comme référence, SAUF s'il s'agit d'une date fictive. Les derniers cas restants sont traités à la main.

- on supprime toutes les colonnes inutiles identifiées jusque là, et on renomme la colonne Date.

- colonne AGE : on remplace un certain nombre de valeurs contenues dans le champ, puis certaines valeurs "complètes" du champ, puis on remplit les NaN ; enfin, on supprime les espaces inutiles.
On convertit les mois en années, et on traite les intervalles ("12 to 15" ou "12 or 15" par ex), en faisant une moyenne des 2 valeurs annoncées.
Enfin, on supprime toutes les lettres.
Je n'ai pas réussi à transformer les champs en listes pour ensuite convertir en chiffres...
Ni compris pourquoi la valeur "13s" passait à travers les mailles du filet du filtre des lettres !

- Colonne Injury : On nettoie le champ de tous les caractères de ponctuation, puis on ajoute des tirets pour lier certains termes (notamment les négations). On crée ensuite un bag of words qui pourra être utilisé pour analyser le champ par la suite.

