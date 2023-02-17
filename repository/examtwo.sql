CREATE or REPLACE VIEW TrainerJonesDogs AS
SELECT DISTINCT Dog.name
FROM Dog
JOIN Dog_trainer
ON Dog_trainer.trainer_id=Dog.trainer_id
WHERE Dog_trainer.last_name='Jones';


delimiter //
CREATE TRIGGER update_annual_dog_fee
AFTER INSERT ON Training 
FOR EACH ROW
BEGIN
UPDATE Owner
SET annual_dog_fee = annual_dog_fee + 2530;
WHERE Training.dog_id=Dog.dog_id AND Owner.owner_id = Dog.owner_id;
END; 
//


SELECT max(cost) from Dog;

CREATE PROCEDURE increase_annual_income
BEGIN
UPDATE Owner
SET annual_income = annual_income * 1.01;
END


SELECT Dog.name, Owner.first_name, Owner.last_name
FROM Dog
JOIN Owner
ON Dog.owner_id=Owner.owner_id
ORDER BY Dog.name;


SELECT count(*), Owner.state
FROM Dog
NATURAL JOIN Owner
ON Dog.Owner=Owner.Owner_id
group by Owner.state;

SELECT
    max(cost) as Maxcost, 
    avg(cost) as Avgcost, 
    min(cost) as Mincost
from Dog;
group by dog_id;

SELECT Breed.breed_name,
    max(weight) as Maxweight, 
    avg(weight) as Avgweight, 
    min(weight) as Minweight
from Dog;
JOIN Breed 
ON Breed.breed_id=Dog.breed_id
group by Breed.breed_name;


SELECT count(*), Dog_trainer.first_name
FROM Breed
NATURAL JOIN Dog
ON Dog.breed_id=Breed.breed_id
NATURAL JOIN Dog_trainer
ON Dog.trainer_id=Dog_trainer.trainer_id
group by Dog_trainer.first_name;


SELECT Obstacle.obstacle, Dog.name,Dog.weight
FROM Obstacle 
NATURAL JOIN Training 
ON Training.obstacle_id=Obstacle.obstacle_id
NATURAL JOIN Dog 
ON Training.dog_id=Dog.dog_id
NATURAL JOIN Owner
ON Dog.owner_id=Owner.owner_id AND Owner.city = 'Bemidji MN';

SELECT Obstacle.obstacle 
FROM Obstacle
WHERE ;

