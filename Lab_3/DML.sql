-- ========== SELECT ==========

SELECT * FROM Users;

SELECT Username, Email FROM Users;

SELECT * FROM Book;

SELECT Title, PageCount FROM Book;

SELECT * FROM Author;

SELECT Title FROM Book;

SELECT * 
FROM Book
WHERE Language='English';

SELECT COUNT(*) AS "Кількість користувачів" 
FROM Users;

SELECT COUNT(*) AS "Кількість книг" 
FROM Book;

SELECT Title, Language, PageCount 
FROM Book 
WHERE Language = 'English';

SELECT UserID, BookID, Score 
FROM Rating 
WHERE Score > 4.5;

SELECT Title, PageCount, PublicationDate 
FROM Book 
WHERE PageCount > 300;

SELECT FullName, Country, BirthDate 
FROM Author 
WHERE Country = 'United Kingdom';

SELECT Name, Country, FoundedYear 
FROM Publisher 
WHERE FoundedYear > 1900;

SELECT Title, PageCount, Language 
FROM Book 
WHERE Language = 'English' AND PageCount > 200;

SELECT BookID, Score 
FROM Rating 
WHERE UserID = 1 AND Score > 4.0;

SELECT Name, Country 
FROM Publisher 
WHERE Country = 'United States' OR Country = 'United Kingdom';


SELECT AVG(Score) AS "Середня оцінка" 
FROM Rating;

SELECT MAX(Score) AS "Максимальна оцінка" 
FROM Rating;

SELECT MIN(Score) AS "Мінімальна оцінка" 
FROM Rating;

SELECT COUNT(*) AS "Кількість відгуків" 
FROM Review;


SELECT Title, PublicationDate 
FROM Book 
ORDER BY Title ASC;

SELECT Title, PageCount 
FROM Book 
ORDER BY PageCount DESC;

SELECT UserID, BookID, Score 
FROM Rating 
ORDER BY Score DESC;

SELECT DISTINCT Country 
FROM Publisher;

SELECT DISTINCT Language 
FROM Book;

SELECT COUNT(DISTINCT Country) AS "Кількість країн" 
FROM Author;

SELECT Title, BookID 
FROM Book 
WHERE BookID IN (1, 2, 3);

SELECT Title, PublicationDate 
FROM Book 
WHERE EXTRACT(YEAR FROM PublicationDate) BETWEEN 1900 AND 2000;

SELECT FullName, Country 
FROM Author 
WHERE FullName LIKE 'J%';

SELECT Username, Email 
FROM Users 
WHERE Username LIKE '%reader%';

-- ========== INSERT ==========

INSERT INTO Users (Username, Email, Password, Nickname, AvatarURL) 
VALUES ('temp_user', 'temp.user@example.com', '$2b$12$temppassword', 'TempUser', NULL);

SELECT * FROM Users WHERE Username = 'temp_user';

INSERT INTO Rating (UserID, BookID, Score) 
VALUES (
    (SELECT UserID FROM Users WHERE Username = 'temp_user'),
    1,
    3.5
);

SELECT UserID, BookID, Score 
FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');

INSERT INTO Review (UserID, BookID, ReviewText, ReviewDate) 
VALUES (
    (SELECT UserID FROM Users WHERE Username = 'temp_user'),
    1,
    'This is a temporary review for testing purposes. The book is interesting but quite dark.',
    CURRENT_TIMESTAMP
);

SELECT UserID, BookID, ReviewText, ReviewDate
FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');

-- ========== UPDATE ==========

UPDATE Users 
SET Nickname = 'UpdatedTempUser',
    Email = 'updated.temp@example.com'
WHERE Username = 'temp_user';

SELECT Username, Email, Nickname FROM Users WHERE Username = 'temp_user';

UPDATE Rating 
SET Score = 4.0 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;

SELECT UserID, BookID, Score 
FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');

UPDATE Review 
SET ReviewText = 'Updated review: After re-reading, I appreciate this book more. The dystopian themes are very relevant.',
    LastEditDate = CURRENT_TIMESTAMP
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;

SELECT UserID, ReviewText, LastEditDate
FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');

-- ========== DELETE ==========

DELETE FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;

SELECT * FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');

DELETE FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;

SELECT * FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');

DELETE FROM Users 
WHERE Username = 'temp_user';

SELECT * FROM Users WHERE Username = 'temp_user';