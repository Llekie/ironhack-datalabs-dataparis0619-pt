USE publications;

SELECT a.au_id AS Author_ID, a.au_lname AS Author_LastName, a.au_fname AS Author_FirstName, SUM(s.qty) AS "Qté"
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON t.title_id = ta.title_id
JOIN publications.sales s ON t.title_id = s.title_id
GROUP BY a.au_id, t.pub_id
ORDER BY "Qté" DESC;