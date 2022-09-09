DROP DATABASE IF EXISTS pokemon
;
CREATE DATABASE pokemon
;
USE pokemon
;
CREATE TABLE mypokemon
(
number INT,
name VARCHAR(20),
type VARCHAR(10)
);
INSERT INTO mypokemon (number, name, type)
VALUES (10, 'caterpie', 'bug'),
(25, 'pikachu', 'electric'),
(26, 'raichu', 'electric'),
(133, 'eevee', 'normal'),
(152, 'chikoirita', 'grass');
CREATE TABLE ability (
number INT,
height FLOAT,
weight FLOAT,
attack INT,
defense INT,
speed int
);
INSERT INTO ability (number, height, weight, attack, defense, speed)
VALUES (10, 0.3, 2.9, 30, 35, 45),
(25, 0.4, 6, 55, 40, 90),
(26, 0.8, 30, 90, 55, 110),
(133, 0.3, 6.5, 55, 50, 55),
(137, 0.8, 36.5, 60, 70, 40),
(152, 0.9, 6.4, 49, 65, 45),
(153, 1.2, 15.8, 62, 80, 60),
(172, 0.3, 2, 40, 15, 60),
(470, 1, 25.5, 110, 130, 95);

-- 포켓몬 테이블과 능력치 테이블을 합쳐서 포켓몬 이름, 공격력, 방어력을 한번에 가져와 주세요.
-- 이 때,포켓몬 테이블에 있는 모든 포켓몬의 데이터를 가져와 주세요. 만약, 포켓몬의 능력치 데이터를 구할 수 없다면, NULL을 가져와도 좋습니다

SELECT name, attack, defense
FROM mypokemon
LEFT JOIN ability
ON mypokemon.number = ability.number;

SELECT ability.number, name
FROM mypokemon
RIGHT JOIN ability
ON mypokemon.number = ability.number;

SELECT type,AVG(height)
FROM mypokemon
INNER JOIN ability
ON mypokemon.number=ability.number
GROUP BY type;

SELECT type, AVG(Weight)
FROM mypokemon
LEFT JOIN ability
ON mypokemon.number = ability.number
GROUP BY type;