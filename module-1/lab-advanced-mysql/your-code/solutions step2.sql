USE publications;
SELECT Title_ID, Author_ID, SUM(sales_royalty) AS Sum_sales
FROM( 
	SELECT t.title_id AS Title_ID , a.au_id AS Author_ID, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 AS sales_royalty
	FROM publications.authors a
	LEFT JOIN publications.titleauthor ta ON a.au_id = ta.au_id
	LEFT JOIN publications.titles t ON t.title_id = ta.title_id
	LEFT JOIN publications.sales s ON s.title_id = t.title_id
		)tab_intermediaire
GROUP BY Title_ID, Author_ID
ORDER BY sales_royalty DESC, Author_ID;