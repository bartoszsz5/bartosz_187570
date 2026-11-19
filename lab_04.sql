ALTER TABLE zadanie
DROP FOREIGN KEY fk_zadanie_pracownik;

ALTER TABLE projekt
DROP FOREIGN KEY fk_projekt_menadzer;

ALTER TABLE pracownik
MODIFY COLUMN id_pracownika INT NOT NULL,
DROP PRIMARY KEY;

ALTER TABLE pracownik
ADD PRIMARY KEY (id_pracownika),
MODIFY COLUMN id_pracownika INT NOT NULL AUTO_INCREMENT;

ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_pracownik
    FOREIGN KEY (pracownik)
    REFERENCES pracownik(id_pracownika)
    ON DELETE SET NULL;

ALTER TABLE projekt
ADD CONSTRAINT fk_projekt_menadzer
    FOREIGN KEY (menadzer_projektu)
    REFERENCES pracownik(id_pracownika);

ALTER TABLE zadanie
ADD COLUMN godziny_szacowane INTEGER DEFAULT 8;

UPDATE zadanie SET godziny_szacowane = 4 WHERE id_zadania = 1;
UPDATE zadanie SET godziny_szacowane = 12 WHERE id_zadania = 2;
UPDATE zadanie SET godziny_szacowane = 16 WHERE id_zadania = 3;

ALTER TABLE zadanie
ALTER COLUMN godziny_szacowane SET DEFAULT 6;

INSERT INTO zadanie (nazwa_zadania, priorytet, opis, pracownik)
VALUES ('Weryfikacja domyślnych godzin', 'normalny', 'Zadanie testowe', 1);

SELECT * FROM zadanie
WHERE nazwa_zadania = 'Weryfikacja domyślnych godzin';

DELETE FROM zadanie
WHERE nazwa_zadania = 'Weryfikacja domyślnych godzin';

ALTER TABLE projekt
ADD COLUMN opis_kratki VARCHAR(50) NULL;

ALTER TABLE projekt
MODIFY COLUMN opis_kratki VARCHAR(200) NULL;

UPDATE projekt SET opis_kratki = 'MVP' WHERE id_projektu = 1;
UPDATE projekt SET opis_kratki = 'pilne wdrożenie' WHERE id_projektu = 2;

ALTER TABLE projekt
DROP COLUMN opis_kratki;

ALTER TABLE zadanie
DROP FOREIGN KEY fk_zadanie_projekt;

ALTER TABLE zadanie
ADD CONSTRAINT fk_zadanie_projekt
    FOREIGN KEY (projekt)
    REFERENCES projekt(id_projektu)
    ON DELETE SET NULL;

DELETE FROM projekt
WHERE id_projektu = 1;

SELECT * FROM zadanie
WHERE projekt IS NULL;