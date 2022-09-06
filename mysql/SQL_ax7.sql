DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
number int,
name varchar(20),
type varchar(10),
height float,
weight float
);
INSERT INTO mypokemon (number, name, type, height, weight)
VALUES (10, 'caterpie', 'bug', 0.3, 2.9),
(25, 'pikachu', 'electric', 0.4, 6),
(26, 'raichu', 'electric', 0.8, 30),
(125, 'electabuzz', 'electric', 1.1, 30),
(133, 'eevee', 'normal', 0.3, 6.5),
(137, 'porygon', 'normal', 0.8, 36.5),
(152, 'chikoirita', 'grass', 0.9, 6.4),
(153, 'bayleef', 'grass', 1.2, 15.8),
(172, 'pichu', 'electric', 0.3, 2),
(470, 'leafeon', 'grass', 1, 25.5); 

SELECT * FROM mypokemon;

-- 포켓몬 타입 별 키의 평균을 가져와 주세요
SELECT type,AVG(height) FROM mypokemon GROUP BY type;

--  포켓몬의 타입 별 몸무게의 평균을 가져와 주세요

SELECT type, AVG(weight) FROM mypokemon GROUP BY type;

-- 포켓몬의 타입 별 키의 평균과 몸무게의 평균을 함께 가져와 주세요

SELECT type, AVG(height), AVG(weight) FROM mypokemon GROUP BY type;

-- 키의 평균이 0.5 이상인 포켓몬의 타입을 가져와 주세요

SELECT type 
FROM mypokemon
GROUP BY type
HAVING AVG(height)>=0.5;

-- 몸무게의 평균이 20 이상인 포켓몬의 타입을 가져와 주세요
SELECT type
FROM mypokemon
GROUP BY type
HAVING AVG(weight)>=20;

-- 포켓몬의 type 별 번호(number)의 합을 가져와 주세요 

SELECT type, sum(number)
FROM mypokemon
GROUP BY type;

-- 키가 0.5 이상인 포켓몬이 포켓몬의 type 별로 몇 개씩 있는지 가져와 주세요

SELECT type, count(1)
FROM mypokemon
WHERE height >= 0.5
GROUP BY type;

-- 포켓몬 타입 별 키의 최솟값을 가져와 주세요 

SELECT type, MIN(height)
FROM mypokemon
GROUP BY type;

-- 포켓몬 타입 별 몸무게의 최댓값을 가져와 주세요.

SELECT type, MAX(weight)
FROM mypokemon
GROUP BY type;

--  키의 최솟값이 0.5보다 크고 몸무게의 최댓값이 30보다 작은 포켓몬 타입을 가져와 주세요.
SELECT type
FROM mypokemon
GROUP BY type
HAVING MIN(height)>0.5 AND MAX(weight)<30;

