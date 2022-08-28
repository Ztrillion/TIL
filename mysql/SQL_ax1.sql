CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon(
		number INT,
        name VARCHAR(20),
        type VARCHAR(10));
        
INSERT INTO mypokemon(number, name, type)
VALUES (10,"caterpie","bug"),
	   (25,"pikachu","electric"),
       (133, "eevee","normal");

SELECT * FROM mypokemon;

CREATE TABLE mynewpokemon(
		number INT,
        name VARCHAR(20),
        type VARCHAR(10));
        
INSERT INTO mynewpokemon(number, name, type)
VALUES (77,"포니타","불꽃"),
	   (132,"메타몽","노말"),
       (151,"뮤","에스퍼");
       
SELECT * FROM mynewpokemon;

ALTER TABLE mypokemon RENAME myoldpokemon;

ALTER TABLE myoldpokemon
CHANGE COLUMN name eng_name VARCHAR(20);

ALTER TABLE mynewpokemon
CHANGE COLUMN name kor_name VARCHAR(20);

SELECT * FROM myoldpokemon;
SELECT * FROM mynewpokemon;

DROP TABLE mynewpokemon;
TRUNCATE TABLE myoldpokemon;

SELECT * FROM mynewpokemon;