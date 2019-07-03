USE publications;

SELECT a.au_id AS Author_ID, a.au_lname AS Author_LastName, a.au_fname AS Author_FirstName, SUM(IFNULL (s.qty,'0')) AS Sum_Vtes
FROM publications.authors a
LEFT JOIN publications.titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN publications.titles t ON t.title_id = ta.title_id
LEFT JOIN publications.publishers p ON p.pub_id = t.pub_id
LEFT JOIN publications.sales s ON s.title_id = t.title_id
GROUP BY a.au_id
ORDER BY Sum_Vtes DESC, a.au_id;