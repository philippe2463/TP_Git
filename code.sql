DELIMITER |
CREATE PROCEDURE maj_vm_page_administrateur()
BEGIN
	TRUNCATE VM_Page_administrateur;

	INSERT INTO VM_Page_administrateur
	SELECT u.pseudo AS pseudo, COUNT(a.id) AS nbre_article_ecrit,
	MAX(a.date_publication) AS date_dernier_article, COUNT(c.id) AS nbre_commentaire_ecrit,
	MAX(c.date_commentaire) AS date_dernier_commentaire
	FROM Utilisateur AS u
	INNER JOIN Article AS a ON u.id=a.auteur_id
	LEFT JOIN Commentaire AS c ON u.id=c.auteur_id
	GROUP BY u.pseudo
	ORDER BY u.pseudo;
END |
DELIMITER ;
