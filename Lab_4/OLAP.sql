-- ========== AGGREGATION QUERIES ==========

SELECT COUNT(*) AS total_users
FROM Users;

SELECT COUNT(*) AS "Кількість книг"
FROM Book;

SELECT COUNT(*) AS "Кількість видавництв"
FROM Publisher;

SELECT SUM(PageCount) AS total_pages
FROM Book;

SELECT MAX(Score) AS max_rating
FROM Rating;

SELECT MIN(Score) AS "Мінімальна оцінка книги"
FROM Rating;

SELECT AVG(PageCount) AS avg_pages
FROM Book;

SELECT ROUND(AVG(Score), 2) AS "Середня оцінка книги"
FROM Rating;

-- ========== GROUP BY ==========

SELECT PublisherID, COUNT(*) AS "Кількість книг видавництва"
FROM Book
GROUP BY PublisherID;

SELECT 
    GenreID,
    COUNT(*) AS book_count
FROM BookGenre
GROUP BY GenreID
ORDER BY book_count DESC;

SELECT 
    Language,
    ROUND(AVG(PageCount), 0) AS "Середня оцінка книги"
FROM Book
GROUP BY Language;

-- ========== HAVING QUERIES ==========

SELECT 
    BookID,
    COUNT(*) AS rating_count
FROM Rating
GROUP BY BookID
HAVING COUNT(*) > 2;

SELECT 
    BookID,
    AVG(Score) AS avg_rating
FROM Rating
GROUP BY BookID
HAVING AVG(Score) > 4.5;

SELECT 
    UserID,
    COUNT(*) AS review_count
FROM Review
GROUP BY UserID
HAVING COUNT(*) > 1;

