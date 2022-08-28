# USE 사용 후 불러오기
USE pokemon;
SELECT * FROM myoldpokemon;
# USE 사용 안할 시
SELECT * FROM pokemon.myoldpokemon;

# ALIAS - AS[컴럼별명]형식으로 컬럼명 지정
# 테이블상의 실제컬럼은 바뀌지않음
SELECT number as national_number
FROM pokemon.mypokemon;