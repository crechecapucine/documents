* [Page GitHub](https://crechecapucine.github.io/documents/) de ce dépôt
* [Site de l'association](http://www.creche-capucine-paris13.fr/)
* [Page Facebook](https://www.facebook.com/capucineetpapillons/)

# Documents centraux de l'association

## Comment modifier les documents

### En ligne de commande: modification du règlement intérieur de la crèche

En amont d'un CA, une version de travail du règlement intérieur doit
être préparée pour être présentée au Conseil d'administration.

1. L'utilisateur "crèche Capucine" doit vous accorder les
   autorisations de modifications

2. Cloner le dépôt "crechecapucine/documents"

```bash
git clone https://github.com/crechecapucine/documents
cd documents/docs
```

3. Faire une copie de travail du règlement intérieur

```bash
cp RI_creche.md RI_creche_modif.md
git add RI_creche_modif.md
git commit -m "Modification du RI crèche: initiation"
```

4. Procéder aux modifications du RI avec un éditeur de texte (indiquer
   notamment la date du Conseil d'administration) ou d'autres outils
   (par exemple, le script de numérotation des articles)

5. Passer en revue les modifications avec git diff

```bash
git --no-pager diff --color-words -U1 RI_creche_modif.md
```

6. Répéter les étapes 4 et 5 si nécessaire

7. Créer une version PDF du document

```bash
pandoc --template template.tex RI_creche_modif.md -o RI_creche_modif.md
```

8. Modifier le fichier index.md et créer un paragraphe sur le document
   de travail

```md
Version de travail du [règlement intérieur](RI_creche_modif)
/[PDF](RI_creche_modif) devant être voté en Conseil d'administration
le XX/XX/XXXX. Les modifications majeures concernent

* Article xxx: <description des modifications>
* ...
```

9. Enregistrer les modifications

```bash
git add RI_creche_modif.md RI_creche_modif.pdf index.md
git commit -m "RI crèche: <résumé des modifications>"
```

10. Synchroniser les dépôts

```bash
git pull
git push
```

Le nouveau règlement intérieur entre en vigueur après un vote du
Conseil d'administration mais doit encore être ratifié par l’Assemblée
générale.

## Quelques commandes utiles

La commande suivante renumérote les articles:

```bash
perl ./process.plx FILE.md
```

La commande suivante produit une table des matières (niveaux numérotés
`##` et `###` uniquement):

```bash
bash toc.sh FILE.md
```

La commande suivante produit un fichier HTML dans le sous-répertoire
"docs" (mais ce n'est pas nécessaire car les fichier Markdown font
l'affaire sur les pages GitHub):

```
pandoc -s +smart FILE.md -o docs/FILE.html
```

La commande suivante produit une version PDF des documents:

```bash
for md in *.md; do
	tex=${md:r}.tex
	pandoc --template template.tex $md -o $tex
	lualatex $tex
done
```
