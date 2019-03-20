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

La commande suivante produit un fichier HTML:

```
pandoc -s FILE.md -o FILE.html
```
