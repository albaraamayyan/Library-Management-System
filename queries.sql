-- 1. استعلام لعرض جميع الكتب مع اسم مؤلفيها
SELECT b.title, a.name AS author_name 
FROM books b
JOIN authors a ON b.author_id = a.author_id;

-- 2. استعلام لمعرفة الكتب المستعارة حالياً
SELECT b.title, m.name AS member_name, br.borrow_date
FROM borrowings br
JOIN books b ON br.book_id = b.book_id
JOIN members m ON br.member_id = m.member_id
WHERE br.return_date IS NULL;

-- 3. استعلام لإحصاء عدد الكتب في كل تصنيف
SELECT category, COUNT(*) AS total_books
FROM books
GROUP BY category;
