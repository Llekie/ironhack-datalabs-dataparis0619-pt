USE publications;
	SELECT Author_ID, Advance + SUM(sales_royalty) AS Total_paiement
	FROM( 
		SELECT t.title_id AS Title_ID , t.advance AS Advance, a.au_id AS Author_ID, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 AS sales_royalty
		FROM publications.authors a
		LEFT JOIN publications.titleauthor ta ON a.au_id = ta.au_id
		LEFT JOIN publications.titles t ON t.title_id = ta.title_id
		LEFT JOIN publications.sales s ON s.title_id = t.title_id
			)tab_intermediaire
GROUP BY Author_ID
ORDER BY Total_paiement DESC;