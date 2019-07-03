USE publications;

SELECT a.au_id AS Author_ID , a.au_lname AS Author_LastName, a.au_fname AS Author_FirstName, (s.qty * ta.royaltyper /100 * t.royalty / 100* t.price) + r.royalty AS Profit
FROM publications.authors a
LEFT JOIN publications.titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN publications.titles t ON t.title_id = ta.title_id
LEFT JOIN publications.publishers p ON p.pub_id = t.pub_id
LEFT JOIN publications.roysched r ON r.title_id = t.title_id
LEFT JOIN publications.sales s ON s.title_id = t.title_id
GROUP BY a.au_id
ORDER BY Profit DESC, a.au_id LIMIT 3;