USE publications;

SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM publications.authors a
JOIN publications.titleauthor ta ON a.au_id = ta.au_id
JOIN publications.titles t ON t.title_id = ta.title_id
JOIN publications.publishers p ON p.pub_id = t.pub_id;