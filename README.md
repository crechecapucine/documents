* [Page GitHub](https://crechecapucine.github.io/documents/) de ce dépôt
* Site de l'association : http://www.creche-capucine-paris13.fr/
* Page Facebook : https://www.facebook.com/capucineetpapillons/

# Documents centraux de l'association

La commande suivante renumérote les articles:

```
perl ./process.plx FILE.md
```

La commande suivante produit une table des matières (niveaux numérotés
`##` et `###` uniquement):

```
bash toc.sh FILE.md
```

La commande suivante produit un fichier HTML dans le sous-répertoire "docs":

```
pandoc -s +smart FILE.md -o docs/FILE.html
```
