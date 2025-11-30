BEGIN;

ALTER TABLE Author 
ADD COLUMN FirstName VARCHAR(50),
ADD COLUMN MiddleName VARCHAR(50),
ADD COLUMN LastName VARCHAR(50);

COMMENT ON COLUMN Author.FirstName IS 'Атомарний атрибут: Ім''я автора.';
COMMENT ON COLUMN Author.MiddleName IS 'Атомарний атрибут: По батькові / Середнє ім''я (опціонально).';
COMMENT ON COLUMN Author.LastName IS 'Атомарний атрибут: Прізвище автора.';


UPDATE Author SET FirstName = 'George', LastName = 'Orwell' WHERE FullName = 'George Orwell';
UPDATE Author SET FirstName = 'Joanne', MiddleName = 'Kathleen', LastName = 'Rowling' WHERE FullName = 'J.K. Rowling';
UPDATE Author SET FirstName = 'Harper', LastName = 'Lee' WHERE FullName = 'Harper Lee';
UPDATE Author SET FirstName = 'Francis', MiddleName = 'Scott', LastName = 'Fitzgerald' WHERE FullName = 'F. Scott Fitzgerald';
UPDATE Author SET FirstName = 'Jane', LastName = 'Austen' WHERE FullName = 'Jane Austen';

ALTER TABLE Author 
ALTER COLUMN FirstName SET NOT NULL,
ALTER COLUMN LastName SET NOT NULL;


ALTER TABLE Author DROP COLUMN FullName;



COMMIT;

-- ROLLBACK;

