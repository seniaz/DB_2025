DROP TABLE IF EXISTS BookGenre CASCADE;
DROP TABLE IF EXISTS BookAuthor CASCADE;
DROP TABLE IF EXISTS Review CASCADE;
DROP TABLE IF EXISTS Rating CASCADE;
DROP TABLE IF EXISTS Book CASCADE;
DROP TABLE IF EXISTS Genre CASCADE;
DROP TABLE IF EXISTS Author CASCADE;
DROP TABLE IF EXISTS Publisher CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE IF NOT EXISTS Users (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE CHECK (Email LIKE '%@%'),
    Password VARCHAR(255) NOT NULL,
    Nickname VARCHAR(50),
    AvatarURL TEXT
);

CREATE TABLE IF NOT EXISTS Publisher (
    PublisherID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(50),
    Website TEXT,
    FoundedYear INT CHECK (FoundedYear >= 1450 AND FoundedYear <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE TABLE IF NOT EXISTS Author (
    AuthorID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50),
    BirthDate DATE,
    DeathDate DATE CHECK (DeathDate IS NULL OR DeathDate >= BirthDate),
    PhotoURL TEXT,
    Biography TEXT
);

CREATE TABLE IF NOT EXISTS Genre (
    GenreID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
);

CREATE TABLE IF NOT EXISTS Book (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(17) UNIQUE,
    PublicationDate DATE,
    Description TEXT,
    PageCount INT CHECK (PageCount > 0),
    Language VARCHAR(50) NOT NULL DEFAULT 'English',
    CoverURL TEXT,
    PublisherID INT REFERENCES Publisher(PublisherID) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Rating (
    RatingID SERIAL PRIMARY KEY,
    UserID INT NOT NULL REFERENCES Users(UserID) ON DELETE CASCADE,
    BookID INT NOT NULL REFERENCES Book(BookID) ON DELETE CASCADE,
    Score NUMERIC(2,1) NOT NULL CHECK (Score >= 1.0 AND Score <= 5.0),
    UNIQUE(UserID, BookID)
);

CREATE TABLE IF NOT EXISTS Review (
    ReviewID SERIAL PRIMARY KEY,
    UserID INT NOT NULL REFERENCES Users(UserID) ON DELETE CASCADE,
    BookID INT NOT NULL REFERENCES Book(BookID) ON DELETE CASCADE,
    ReviewText TEXT NOT NULL CHECK (LENGTH(ReviewText) BETWEEN 10 AND 5000),
    ReviewDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    LastEditDate TIMESTAMP,
    UNIQUE(UserID, BookID)
);

CREATE TABLE IF NOT EXISTS BookAuthor (
    BookID INT NOT NULL REFERENCES Book(BookID) ON DELETE CASCADE,
    AuthorID INT NOT NULL REFERENCES Author(AuthorID) ON DELETE CASCADE,
    AuthorOrder INT NOT NULL CHECK (AuthorOrder > 0),
    PRIMARY KEY (BookID, AuthorID)
);

CREATE TABLE IF NOT EXISTS BookGenre (
    BookID INT NOT NULL REFERENCES Book(BookID) ON DELETE CASCADE,
    GenreID INT NOT NULL REFERENCES Genre(GenreID) ON DELETE CASCADE,
    PRIMARY KEY (BookID, GenreID)
);


INSERT INTO Users (Username, Email, Password, Nickname, AvatarURL) VALUES
('john_reader', 'john.smith@example.com', '$2b$12$hashedpassword1', 'Johnny', NULL),
('maria_book', 'maria.garcia@example.com', '$2b$12$hashedpassword2', 'Mary', NULL),
('alex_critic', 'alex.johnson@example.com', '$2b$12$hashedpassword3', 'Alex', NULL),
('sarah_fan', 'sarah.williams@example.com', '$2b$12$hashedpassword4', 'Sara', NULL),
('david_scholar', 'david.brown@example.com', '$2b$12$hashedpassword5', 'Dave', NULL);

INSERT INTO Publisher (Name, Country, Website, FoundedYear) VALUES
('Penguin Random House', 'United States', 'https://penguinrandomhouse.com', 1927),
('HarperCollins', 'United States', 'https://harpercollins.com', 1989),
('Bloomsbury Publishing', 'United Kingdom', 'https://bloomsbury.com', 1986),
('Vintage Books', 'United States', 'https://vintagebooks.com', 1954),
('Macmillan Publishers', 'United Kingdom', 'https://macmillan.com', 1843);

INSERT INTO Author (FirstName, MiddleName, LastName, Country, BirthDate, DeathDate, Biography) VALUES
('George', NULL, 'Orwell', 'United Kingdom', '1903-06-25', '1950-01-21', 'English novelist, essayist, journalist, and critic known for his dystopian novels.'),
('Joanne', 'Kathleen', 'Rowling', 'United Kingdom', '1965-07-31', NULL, 'British author, best known for writing the Harry Potter fantasy series.'),
('Harper', NULL, 'Lee', 'United States', '1926-04-28', '2016-02-19', 'American novelist widely known for To Kill a Mockingbird, published in 1960.'),
('Francis', 'Scott', 'Fitzgerald', 'United States', '1896-09-24', '1940-12-21', 'American novelist and short story writer, famous for The Great Gatsby.'),
('Jane', NULL, 'Austen', 'United Kingdom', '1775-12-16', '1817-07-18', 'English novelist known for her six major novels about British landed gentry.');

INSERT INTO Genre (Name, Description) VALUES
('Dystopian Fiction', 'Works depicting oppressive societies and totalitarian regimes'),
('Fantasy', 'Fiction featuring magical elements and fantastical worlds'),
('Classic Literature', 'Recognized literary works that have stood the test of time'),
('Romance', 'Works centered on romantic relationships and emotions'),
('Social Commentary', 'Literature exploring social issues and inequality');

INSERT INTO Book (Title, ISBN, PublicationDate, Description, PageCount, Language, CoverURL, PublisherID) VALUES
('1984', '978-0-452-28423-4', '1949-06-08', 'Dystopian novel about a totalitarian society under the surveillance of Big Brother.', 328, 'English', NULL, 1),
('Harry Potter and the Philosopher''s Stone', '978-0-7475-3269-9', '1997-06-26', 'First book in the series about a young wizard named Harry Potter.', 223, 'English', NULL, 3),
('To Kill a Mockingbird', '978-0-06-112008-4', '1960-07-11', 'Classic American novel about racial injustice in the Deep South.', 324, 'English', NULL, 2),
('The Great Gatsby', '978-0-7432-7356-5', '1925-04-10', 'American novel about the Jazz Age and the American Dream.', 180, 'English', NULL, 4),
('Pride and Prejudice', '978-0-14-143951-8', '1813-01-28', 'Romantic novel about Elizabeth Bennet and Mr. Darcy.', 432, 'English', NULL, 5);

INSERT INTO Rating (UserID, BookID, Score) VALUES
(1, 1, 5.0),
(1, 2, 4.5),
(1, 3, 4.8),
(2, 1, 4.9),
(2, 2, 5.0),
(2, 4, 4.2),
(3, 1, 4.5),
(3, 3, 5.0),
(3, 5, 4.7),
(4, 2, 5.0),
(4, 4, 3.8),
(5, 1, 4.7),
(5, 3, 4.9),
(5, 5, 5.0);


INSERT INTO BookAuthor (BookID, AuthorID, AuthorOrder) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

INSERT INTO BookGenre (BookID, GenreID) VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 3),
(3, 5),
(4, 3),
(4, 4),
(5, 3),
(5, 4);

INSERT INTO Review (UserID, BookID, ReviewText, ReviewDate) VALUES
(1, 1, $$An incredible novel about the dangers of totalitarianism. Orwell masterfully creates a bleak future that makes you think about the value of freedom.$$, '2024-06-10 14:30:00'),
(1, 2, $$A magical story that captivated me from the first pages. The world of Hogwarts comes alive in the book!$$, '2024-06-15 16:45:00'),
(2, 1, $$A classic of dystopian fiction. Still relevant today, despite being written over 70 years ago. A must-read!$$, '2024-06-12 10:20:00'),
(2, 2, $$The best book of my childhood! Thank you J.K. Rowling for this amazing world of magic and adventure.$$, '2024-06-18 09:15:00'),
(3, 3, $$A powerful story about racism and morality. Harper Lee created unforgettable characters and an important message.$$, '2024-06-22 11:00:00'),
(4, 4, $$A beautiful depiction of the Jazz Age. Fitzgerald masterfully shows the emptiness of the American Dream through Gatsby's fate.$$, '2024-07-01 13:30:00'),
(5, 5, $$Jane Austen is a genius! This novel about love, pride and social prejudices is relevant even today.$$, '2024-07-10 15:45:00');


