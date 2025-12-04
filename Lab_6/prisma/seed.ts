import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  console.log('Starting database seeding...');

  await prisma.review.deleteMany();
  await prisma.rating.deleteMany();
  await prisma.bookauthor.deleteMany();
  await prisma.bookgenre.deleteMany();
  await prisma.book.deleteMany();
  await prisma.genre.deleteMany();
  await prisma.author.deleteMany();
  await prisma.publisher.deleteMany();
  await prisma.users.deleteMany();

  console.log('Database cleaned');

  await prisma.users.createMany({
    data: [
      { userid: 1, username: 'john_reader', email: 'john.smith@example.com', password: '$2b$12$hashedpassword1', nickname: 'Johnny', avatarurl: null },
      { userid: 2, username: 'maria_book', email: 'maria.garcia@example.com', password: '$2b$12$hashedpassword2', nickname: 'Mary', avatarurl: null },
      { userid: 3, username: 'alex_critic', email: 'alex.johnson@example.com', password: '$2b$12$hashedpassword3', nickname: 'Alex', avatarurl: null },
      { userid: 4, username: 'sarah_fan', email: 'sarah.williams@example.com', password: '$2b$12$hashedpassword4', nickname: 'Sara', avatarurl: null },
      { userid: 5, username: 'david_scholar', email: 'david.brown@example.com', password: '$2b$12$hashedpassword5', nickname: 'Dave', avatarurl: null },
    ]
  });

  await prisma.publisher.createMany({
    data: [
      { publisherid: 1, name: 'Penguin Random House', country: 'United States', website: 'https://penguinrandomhouse.com', foundedyear: 1927 },
      { publisherid: 2, name: 'HarperCollins', country: 'United States', website: 'https://harpercollins.com', foundedyear: 1989 },
      { publisherid: 3, name: 'Bloomsbury Publishing', country: 'United Kingdom', website: 'https://bloomsbury.com', foundedyear: 1986 },
      { publisherid: 4, name: 'Vintage Books', country: 'United States', website: 'https://vintagebooks.com', foundedyear: 1954 },
      { publisherid: 5, name: 'Macmillan Publishers', country: 'United Kingdom', website: 'https://macmillan.com', foundedyear: 1843 },
    ]
  });

  await prisma.author.createMany({
    data: [
      { authorid: 1, firstname: 'George', middlename: null, lastname: 'Orwell', country: 'United Kingdom', birthdate: new Date('1903-06-25'), deathdate: new Date('1950-01-21'), biography: 'English novelist, essayist, journalist, and critic known for his dystopian novels.' },
      { authorid: 2, firstname: 'Joanne', middlename: 'Kathleen', lastname: 'Rowling', country: 'United Kingdom', birthdate: new Date('1965-07-31'), deathdate: null, biography: 'British author, best known for writing the Harry Potter fantasy series.' },
      { authorid: 3, firstname: 'Harper', middlename: null, lastname: 'Lee', country: 'United States', birthdate: new Date('1926-04-28'), deathdate: new Date('2016-02-19'), biography: 'American novelist widely known for To Kill a Mockingbird, published in 1960.' },
      { authorid: 4, firstname: 'Francis', middlename: 'Scott', lastname: 'Fitzgerald', country: 'United States', birthdate: new Date('1896-09-24'), deathdate: new Date('1940-12-21'), biography: 'American novelist and short story writer, famous for The Great Gatsby.' },
      { authorid: 5, firstname: 'Jane', middlename: null, lastname: 'Austen', country: 'United Kingdom', birthdate: new Date('1775-12-16'), deathdate: new Date('1817-07-18'), biography: 'English novelist known for her six major novels about British landed gentry.' },
    ]
  });

  await prisma.genre.createMany({
    data: [
      { genreid: 1, name: 'Dystopian Fiction', description: 'Works depicting oppressive societies and totalitarian regimes' },
      { genreid: 2, name: 'Fantasy', description: 'Fiction featuring magical elements and fantastical worlds' },
      { genreid: 3, name: 'Classic Literature', description: 'Recognized literary works that have stood the test of time' },
      { genreid: 4, name: 'Romance', description: 'Works centered on romantic relationships and emotions' },
      { genreid: 5, name: 'Social Commentary', description: 'Literature exploring social issues and inequality' },
    ]
  });

  await prisma.book.createMany({
    data: [
      { bookid: 1, title: '1984', isbn: '978-0-452-28423-4', publicationdate: new Date('1949-06-08'), description: 'Dystopian novel about a totalitarian society under the surveillance of Big Brother.', pagecount: 328, language: 'English', publisherid: 1 },
      { bookid: 2, title: 'Harry Potter and the Philosopher\'s Stone', isbn: '978-0-7475-3269-9', publicationdate: new Date('1997-06-26'), description: 'First book in the series about a young wizard named Harry Potter.', pagecount: 223, language: 'English', publisherid: 3 },
      { bookid: 3, title: 'To Kill a Mockingbird', isbn: '978-0-06-112008-4', publicationdate: new Date('1960-07-11'), description: 'Classic American novel about racial injustice in the Deep South.', pagecount: 324, language: 'English', publisherid: 2 },
      { bookid: 4, title: 'The Great Gatsby', isbn: '978-0-7432-7356-5', publicationdate: new Date('1925-04-10'), description: 'American novel about the Jazz Age and the American Dream.', pagecount: 180, language: 'English', publisherid: 4 },
      { bookid: 5, title: 'Pride and Prejudice', isbn: '978-0-14-143951-8', publicationdate: new Date('1813-01-28'), description: 'Romantic novel about Elizabeth Bennet and Mr. Darcy.', pagecount: 432, language: 'English', publisherid: 5 },
    ]
  });

  await prisma.bookauthor.createMany({
    data: [
      { bookid: 1, authorid: 1, authororder: 1 },
      { bookid: 2, authorid: 2, authororder: 1 },
      { bookid: 3, authorid: 3, authororder: 1 },
      { bookid: 4, authorid: 4, authororder: 1 },
      { bookid: 5, authorid: 5, authororder: 1 },
    ]
  });

  await prisma.bookgenre.createMany({
    data: [
      { bookid: 1, genreid: 1 },
      { bookid: 1, genreid: 3 },
      { bookid: 2, genreid: 2 },
      { bookid: 3, genreid: 3 },
      { bookid: 3, genreid: 5 },
      { bookid: 4, genreid: 3 },
      { bookid: 4, genreid: 4 },
      { bookid: 5, genreid: 3 },
      { bookid: 5, genreid: 4 },
    ]
  });

  await prisma.rating.createMany({
    data: [
      { userid: 1, bookid: 1, score: 5.0 },
      { userid: 1, bookid: 2, score: 4.5 },
      { userid: 1, bookid: 3, score: 4.8 },
      { userid: 2, bookid: 1, score: 4.9 },
      { userid: 2, bookid: 2, score: 5.0 },
      { userid: 2, bookid: 4, score: 4.2 },
      { userid: 3, bookid: 1, score: 4.5 },
      { userid: 3, bookid: 3, score: 5.0 },
      { userid: 3, bookid: 5, score: 4.7 },
      { userid: 4, bookid: 2, score: 5.0 },
      { userid: 4, bookid: 4, score: 3.8 },
      { userid: 5, bookid: 1, score: 4.7 },
      { userid: 5, bookid: 3, score: 4.9 },
      { userid: 5, bookid: 5, score: 5.0 },
    ]
  });

  await prisma.review.createMany({
    data: [
      { userid: 1, bookid: 1, reviewtext: 'An incredible novel about the dangers of totalitarianism. Orwell masterfully creates a bleak future that makes you think about the value of freedom.', reviewdate: new Date('2024-06-10T14:30:00Z') },
      { userid: 1, bookid: 2, reviewtext: 'A magical story that captivated me from the first pages. The world of Hogwarts comes alive in the book!', reviewdate: new Date('2024-06-15T16:45:00Z') },
      { userid: 2, bookid: 1, reviewtext: 'A classic of dystopian fiction. Still relevant today, despite being written over 70 years ago. A must-read!', reviewdate: new Date('2024-06-12T10:20:00Z') },
      { userid: 2, bookid: 2, reviewtext: 'The best book of my childhood! Thank you J.K. Rowling for this amazing world of magic and adventure.', reviewdate: new Date('2024-06-18T09:15:00Z') },
      { userid: 3, bookid: 3, reviewtext: 'A powerful story about racism and morality. Harper Lee created unforgettable characters and an important message.', reviewdate: new Date('2024-06-22T11:00:00Z') },
      { userid: 4, bookid: 4, reviewtext: 'A beautiful depiction of the Jazz Age. Fitzgerald masterfully shows the emptiness of the American Dream through Gatsby\'s fate.', reviewdate: new Date('2024-07-01T13:30:00Z') },
      { userid: 5, bookid: 5, reviewtext: 'Jane Austen is a genius! This novel about love, pride and social prejudices is relevant even today.', reviewdate: new Date('2024-07-10T15:45:00Z') },
    ]
  });

  const tables = [
    { name: 'users', pk: 'userid' },
    { name: 'publisher', pk: 'publisherid' },
    { name: 'author', pk: 'authorid' },
    { name: 'genre', pk: 'genreid' },
    { name: 'book', pk: 'bookid' },
    { name: 'rating', pk: 'ratingid' },
    { name: 'review', pk: 'reviewid' },
  ];

  for (const table of tables) {
    await prisma.$executeRawUnsafe(
      `SELECT setval(pg_get_serial_sequence('"${table.name}"', '${table.pk}'), coalesce(max("${table.pk}")+1, 1), false) FROM "${table.name}";`
    );
  }

  console.log('Seeding finished successfully!');
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });