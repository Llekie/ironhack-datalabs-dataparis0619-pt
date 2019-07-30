Extraction d'un API : code dans "APICode.ipynb"

J'ai choisi de travailler sur un API disponible sur le site de la mairie de Paris :
les données mises à disposition sont accessibles sur le site https://opendata.paris.fr/
J'ai choisi les données sur les activités culturelles proposées ("Que faire à Paris ?") :
https://opendata.paris.fr/explore/dataset/que-faire-a-paris-/information/
Sur cette page, un onglet API permet de retrouver l'adresse à utiliser pour récupérer les données.


Après installation des bibliothèques et paramétrage de l'URL souhaitée, j'ai récupéré la donnée avec une requête GET.
Les données transformées en json, j'ai appliqué dessus un json.normalize pour les visualiser correctement.

Le tableau obtenu m'a permis de prévisualiser les données, et de constater que les données les plus intéressantes se situaient dans un dictionnaire impriqué, situé en colonne "Records".
J'ai donc normalisé à nouveau le dictionnaire contenu dans cette colonne, pour obtenir une donnée exploitable.

C'est cette donnée que j'ai exportée dans le fichier "QueFaireAParis.csv", situé dans le même dossier que ce Readme.



Extraction d'une page HTML : code dans "HTMLCode.ipynb"

J'ai cherché à extraire les informations principales sur titre des éditions Gallimard.
Pour cela, en imaginant pouvoir utiliser un jour ce code pour différents titres, j'ai commencé par définir quelques objets permettant de définir l'url avec des variables : éditeur, collection et titre.

J'ai ensuite récupéré le contenu de la page avec un GET CONTENT.

Pour récupérer le titre et l'auteur, j'ai du faire des boucles pour isoler le texte qui m'intéressait, avant de récupérer la dernière balise à laquelle je souhaitais accéder.

Puis j'ai examiné le résumé à extraire sur la page web dans Chrome pour identifier les balises qui permettent de le retrouver.
Une fois identifiées, j'ai lancé l'extraction du résumé.

Le résultat m'a amenée à modifier le GET CONTENT, pour décoder le texte, dont les accents n'apparaissaient pas correctement.
Restaient quelques balises qui subsistaient, que j'ai retirées avec des "replace"


J'ai également souhaité récupérer la date de publication de l'oeuvre.
Après avoir identifié la balise, j'ai récupéré un texte, le libellé "Date de parution : " apparaissant en clair dans le résultat.
Pour le supprimer, j'ai splité mon résultat, pour avoir une colonne contenant uniquement la date. J'ai ensuite sélectionné cette colonne seulement pour ne conserver que la donnée intéressante.


Enfin, j'ai récupéré l'ISBN (ou EAN ou gencode) qui permet d'identifier le livre dont on parle.
J'ai pour cela récupéré un bloc de texte, contenant un certain nombre d'informations.
L'ISBN étant un chiffre sur 13 positions, j'ai cherché à récupérer les informations de ce type avec une regex.