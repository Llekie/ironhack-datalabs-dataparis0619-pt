USE publications;

SELECT a.au_id AS Author_ID, a.au_lname AS Author_LastName, a.au_fname AS Author_FirstName, p.pub_name AS Publisher, SUM(s.qty) AS "Qté"
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON t.title_id = ta.title_id
JOIN publications.publishers p ON p.pub_id = t.pub_id
GROUP BY p.pub_id, a.au_id;
SELECT COUNT(*) FROM publications.titles;