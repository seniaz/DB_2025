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

-- ========== JOIN QUERIES ==========

SELECT 
    b.Title,
    r.Score
FROM Book b
INNER JOIN Rating r ON b.BookID = r.BookID;

SELECT 
    b.Title,
    a.FullName
FROM Book b
INNER JOIN BookAuthor ba ON b.BookID = ba.BookID
INNER JOIN Author a ON ba.AuthorID = a.AuthorID;

SELECT 
    u.Username,
    b.Title,
    rev.ReviewText
FROM Users u
INNER JOIN Review rev ON u.UserID = rev.UserID
INNER JOIN Book b ON rev.BookID = b.BookID;

SELECT 
    b.Title,
    p.Name AS publisher
FROM Book b
LEFT JOIN Publisher p ON b.PublisherID = p.PublisherID;

SELECT 
    u.Username,
    COUNT(r.RatingID) AS rating_count
FROM Users u
LEFT JOIN Rating r ON u.UserID = r.UserID
GROUP BY u.UserID, u.Username;

SELECT 
    b.Title,
    COUNT(r.RatingID) AS rating_count
FROM Book b
LEFT JOIN Rating r ON b.BookID = r.BookID
GROUP BY b.BookID, b.Title;

-- ========== SUBQUERY QUERIES ==========

SELECT Title
FROM Book
WHERE BookID IN (
    SELECT BookID
    FROM Rating
    GROUP BY BookID
    HAVING AVG(Score) > (SELECT AVG(Score) FROM Rating)
);

SELECT Username
FROM Users
WHERE UserID IN (
    SELECT UserID
    FROM Rating
    WHERE Score = (SELECT MAX(Score) FROM Rating)
);

SELECT FullName
FROM Author
WHERE AuthorID IN (
    SELECT AuthorID
    FROM BookAuthor
);
