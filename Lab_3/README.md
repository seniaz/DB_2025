# Лабораторна робота №3 
## Маніпулювання даними SQL (OLTP)

У цій лабораторній роботі виконано набір **SELECT-запитів** до бази даних системи оцінювання книг (**Book Rating System**) для демонстрації основних можливостей SQL DML (отримання даних).

---

## Запити SELECT
```sql
SELECT * FROM Users;
```
Повертає всі колонки та всі рядки таблиці Users.

![1](screenshots/1.png)

---

```sql
SELECT Username, Email FROM Users;
```
Вибирає лише стовпці Username і Email з таблиці Users.  
![2](screenshots/2.png)

---

```sql
SELECT * FROM Book;
```
Повертає всі колонки та всі рядки таблиці Book.  
![3](screenshots/3.png)

---

```sql
SELECT Title, PageCount FROM Book;
```
Показує назву книги та кількість сторінок.  
![4](screenshots/4.png)

---

```sql
SELECT * FROM Author;
```
Повертає всі колонки та всі рядки таблиці Author.  
![5](screenshots/5.png)

---

```sql
SELECT Title FROM Book;
```
Виводить лише назви всіх книг.  
![6](screenshots/6.png)

---

```sql
SELECT * 
FROM Book
WHERE Language='English';
```
Відображає книги, написані англійською мовою.  
![7](screenshots/7.png)

---

```sql
SELECT COUNT(*) AS "Кількість користувачів" 
FROM Users;
```
Рахує кількість користувачів у таблиці Users.  
![8](screenshots/8.png)

---

```sql
SELECT COUNT(*) AS "Кількість книг" 
FROM Book;
```
Підраховує кількість книг у таблиці Book.  
![9](screenshots/9.png)

---

```sql
SELECT Title, Language, PageCount 
FROM Book 
WHERE Language = 'English';
```
Показує назву, мову та кількість сторінок англомовних книг.  
![10](screenshots/10.png)

---

```sql
SELECT UserID, BookID, Score 
FROM Rating 
WHERE Score > 4.5;
```
Показує всі оцінки, більші ніж 4.5.  
![11](screenshots/11.png)

---

```sql
SELECT Title, PageCount, PublicationDate 
FROM Book 
WHERE PageCount > 300;
```
Показує книги, у яких кількість сторінок перевищує 300.  
![12](screenshots/12.png)

---

```sql
SELECT FullName, Country, BirthDate 
FROM Author 
WHERE Country = 'United Kingdom';
```
Показує авторів із Великої Британії.  
![13](screenshots/13.png)

---

```sql
SELECT Name, Country, FoundedYear 
FROM Publisher 
WHERE FoundedYear > 1900;
```
Показує видавництва, засновані після 1900 року.  
![14](screenshots/14.png)

---

```sql
SELECT Title, PageCount, Language 
FROM Book 
WHERE Language = 'English' AND PageCount > 200;
```
Комбінує фільтрацію за мовою та кількістю сторінок.  
![15](screenshots/15.png)

---

```sql
SELECT BookID, Score 
FROM Rating 
WHERE UserID = 1 AND Score > 4.0;
```
Показує оцінки користувача з ID=1, більші за 4.0.  
![16](screenshots/16.png)

---

```sql
SELECT Name, Country 
FROM Publisher 
WHERE Country = 'United States' OR Country = 'United Kingdom';
```
Вибирає видавництва із США або Великої Британії.  
![17](screenshots/17.png)

---

```sql
SELECT AVG(Score) AS "Середня оцінка" 
FROM Rating;
```
Обчислює середню оцінку всіх книг.  
![18](screenshots/18.png)

---

```sql
SELECT MAX(Score) AS "Максимальна оцінка" 
FROM Rating;
```
Показує найвищу оцінку серед усіх користувачів.  
![19](screenshots/19.png)

---

```sql
SELECT MIN(Score) AS "Мінімальна оцінка" 
FROM Rating;
```
Показує найнижчу оцінку в таблиці Rating.  
![20](screenshots/20.png)

---

```sql
SELECT COUNT(*) AS "Кількість відгуків" 
FROM Review;
```
Рахує кількість відгуків у таблиці Review.  
![21](screenshots/21.png)

---

```sql
SELECT Title, PublicationDate 
FROM Book 
ORDER BY Title ASC;
```
Сортує книги за назвою у зростаючому порядку.  
![22](screenshots/22.png)

---

```sql
SELECT Title, PageCount 
FROM Book 
ORDER BY PageCount DESC;
```
Відображає книги у порядку спадання кількості сторінок.  
![23](screenshots/23.png)

---

```sql
SELECT UserID, BookID, Score 
FROM Rating 
ORDER BY Score DESC;
```
Сортує оцінки від найвищої до найнижчої.  
![24](screenshots/24.png)

---

```sql
SELECT DISTINCT Country 
FROM Publisher;
```
Виводить список унікальних країн із таблиці Publisher.  
![25](screenshots/25.png)

---

```sql
SELECT DISTINCT Language 
FROM Book;
```
Виводить унікальні мови книг.  
![26](screenshots/26.png)

---

```sql
SELECT COUNT(DISTINCT Country) AS "Кількість країн" 
FROM Author;
```
Підраховує кількість унікальних країн серед авторів.  
![27](screenshots/27.png)

---

```sql
SELECT Title, BookID 
FROM Book 
WHERE BookID IN (1, 2, 3);
```
Показує книги з конкретними ідентифікаторами 1, 2, 3.  
![28](screenshots/28.png)

---

```sql
SELECT Title, PublicationDate 
FROM Book 
WHERE EXTRACT(YEAR FROM PublicationDate) BETWEEN 1900 AND 2000;
```
Виводить книги, опубліковані між 1900 і 2000 роками.  
![29](screenshots/29.png)

---

```sql
SELECT FullName, Country 
FROM Author 
WHERE FullName LIKE 'J%';
```
Показує авторів, чиє ім’я починається на літеру J.  
![30](screenshots/30.png)

---

```sql
SELECT Username, Email 
FROM Users 
WHERE Username LIKE '%reader%';
```
Показує користувачів, у логіні яких є слово reader.  
![31](screenshots/31.png)

## INSERT (SELECT) → UPDATE (SELECT) → DELETE (SELECT)

Нижче наведена повна послідовність операцій `INSERT`, `UPDATE` та `DELETE`, які виконуються з використанням підзапитів `SELECT` для перевірки результатів.

```sql
INSERT INTO Users (Username, Email, Password, Nickname, AvatarURL) 
VALUES ('temp_user', 'temp.user@example.com', '$2b$12$temppassword', 'TempUser', NULL);
```
Створює тимчасового користувача для тестових операцій.

```sql
SELECT * FROM Users WHERE Username = 'temp_user';
```
Перевіряє, що користувача успішно додано.  
![32](screenshots/32.png)

```sql
INSERT INTO Rating (UserID, BookID, Score) 
VALUES (
    (SELECT UserID FROM Users WHERE Username = 'temp_user'),
    1,
    3.5
);
```
Додає оцінку для книги `BookID = 1` від створеного користувача.

```sql
SELECT UserID, BookID, Score 
FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');
```
Перевіряє, що оцінку збережено коректно.  
![33](screenshots/33.png)

```sql
INSERT INTO Review (UserID, BookID, ReviewText, ReviewDate) 
VALUES (
    (SELECT UserID FROM Users WHERE Username = 'temp_user'),
    1,
    'This is a temporary review for testing purposes. The book is interesting but quite dark.',
    CURRENT_TIMESTAMP
);
```
Створює тестовий відгук до тієї ж книги від тимчасового користувача.

```sql
SELECT UserID, BookID, ReviewText, ReviewDate
FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');
```
Підтверджує, що відгук збережено.  
![34](screenshots/34.png)

---

```sql
UPDATE Users 
SET Nickname = 'UpdatedTempUser',
    Email = 'updated.temp@example.com'
WHERE Username = 'temp_user';
```
Оновлює e-mail і нікнейм тимчасового користувача.

```sql
SELECT Username, Email, Nickname FROM Users WHERE Username = 'temp_user';
```
Перевіряє застосування змін у таблиці користувачів.  
![35](screenshots/35.png)

```sql
UPDATE Rating 
SET Score = 4.0 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;
```
Підвищує оцінку користувача для книги `BookID = 1` до `4.0`.

```sql
SELECT UserID, BookID, Score 
FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');
```
Перевіряє оновлене значення оцінки.  
![36](screenshots/36.png)

```sql
UPDATE Review 
SET ReviewText = 'Updated review: After re-reading, I appreciate this book more. The dystopian themes are very relevant.',
    LastEditDate = CURRENT_TIMESTAMP
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;
```
Оновлює текст відгуку та фіксує час останнього редагування.

```sql
SELECT UserID, ReviewText, LastEditDate
FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');
```
Перевіряє, що оновлення відгуку застосовано.  
![37](screenshots/37.png)

---

```sql
DELETE FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;
```
Видаляє тестову оцінку користувача для книги `BookID = 1`.

```sql
SELECT * FROM Rating 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');
```
Переконується, що оцінку видалено.  
![38](screenshots/38.png)

```sql
DELETE FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user')
  AND BookID = 1;
```
Видаляє тестовий відгук користувача до книги `BookID = 1`.

```sql
SELECT * FROM Review 
WHERE UserID = (SELECT UserID FROM Users WHERE Username = 'temp_user');
```
Переконується, що відгук видалено.  
![39](screenshots/39.png)

```sql
DELETE FROM Users 
WHERE Username = 'temp_user';
```
Видаляє тимчасового користувача з таблиці `Users`.

```sql
SELECT * FROM Users WHERE Username = 'temp_user';
```
Фінальна перевірка — користувач має бути відсутній.  
![40](screenshots/40.png)
