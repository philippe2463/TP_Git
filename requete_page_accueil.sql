--requete Page d'Accueil

SELECT Article.titre AS Titre, Article.resume AS Extrait,
	DATE_FORMAT(Article.date_publication, '%d/%m/%Y') AS Publication,
	Utilisateur.pseudo AS Pseudo,
	COUNT(Commentaire.article_id) AS Nbre_commentaires
FROM Article
LEFT JOIN Utilisateur ON Article.auteur_id = Utilisateur.id
LEFT JOIN Commentaire ON Article.id = Commentaire.article_id
GROUP BY Article.titre
ORDER BY Article.date_publication DESC;

