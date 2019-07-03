USE publications;

SELECT a.au_id AS Author_ID, a.au_lname AS Author_LastName, a.au_fname AS Author_FirstName, COUNT(t.title_id) AS Nb_Titres
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON t.title_id = ta.title_id
JOIN publications.publishers p ON p.pub_id = t.pub_id
GROUP BY a.au_id
ORDER BY Nb_Titres DESC, a.au_id LIMIT 3;