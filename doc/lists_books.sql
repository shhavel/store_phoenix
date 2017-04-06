SELECT l.name, b.name
FROM lists l
INNER JOIN single_sorts s ON s.list_id = l.id
INNER JOIN books b ON b.id = s.book_id
WHERE s.id IN (SELECT id FROM single_sorts WHERE list_id = l.id ORDER BY position LIMIT 5)
ORDER BY l.id;
