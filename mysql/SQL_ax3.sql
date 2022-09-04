DROP DATABASE IF EXiSTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon(
	number int,
	name varchar(20),
	type varchar(20),
	height float,
	weight float,
	attack float,
	defense float,
	speed float
    );
    
SELECT * FROM mypokemon;

INSERT INTO mypokemon(number,name,type,height,weight,attack,defense,speed)
VALUES (10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
(25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
(152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);

SELECT * FROM mypokemon;

SELECT 123*456;
SELECT 2310/30;
SELECT * FROM mypokemon;
SELECT '피카츄' AS '포켓몬';
SELECT name,height,weight FROM mypokemon;
SELECT DISTINCT height FROM mypokemon;
SELECT name,attack*2 AS attack2 FROM mypokemon;
SELECT name AS '이름' FROM mypokemon;
SELECT attack AS 공격력, defense AS 방어력 FROM mypokemon;
SELECT height*100 AS "height(cm)" FROM mypokemon;
SELECT * FROM mypokemon LIMIT 1;
SELECT name AS 이름, height AS "키(cm)", weight AS "몸무게(kg)" FROM mypokemon LIMIT 2;
SELECT name, attack+defense+speed AS total
FROM mypokemon;

SELECT name, weight/height^2 AS BMI FROM mypokemon;