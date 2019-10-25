-- Modified by Sanjeev Dasari on 10-25-19
--Exercise 8.1 Single-Table Queries in PostgreSQL

--(a)
-- SELECT * 
-- FROM Game
-- ORDER BY time ASC;

--(b)
-- SELECT * 
-- FROM Game
-- WHERE time > '2019-10-25 15:03';

--(c)
-- SELECT * 
-- FROM Player
-- WHERE name IS NOT NULL;

--(d)
-- SELECT playerID 
-- FROM PlayerGame
-- score > 2000;

--(e)
-- SELECT * 
-- FROM Player
-- WHERE emailAddress LIKE '%@gmail.com%';

--Exercise 8.2 Multiple-Table Queries in PostgreSQL
 
--(a)
-- SELECT PlayerGame.score
-- FROM PlayerGame, Player
-- WHERE PlayerGame.playerID = Player.ID
-- AND Player.name LIKE '%The King%'
-- ORDER BY PlayerGame.score DESC;

--(b)
-- SELECT Player.name
-- FROM PlayerGame, Player, Game
-- WHERE PlayerGame.playerID = Player.ID
-- AND PlayerGame.gameID = Game.ID
-- AND Game.time = '2006-06-28 13:20:00'
-- ORDER BY PlayerGame.score DESC
-- LIMIT 1;

--(c)
-- It makes sure that the player id's of the two compared (P1.ID < P2.ID) entries are not the same. 
-- In other words, making sure they are different players, not just players with the same name.

--(d)
-- In our example, we could join a table to itself to find all games which were played 
-- in a series of 2 or more (by comparing the dates and seeing if they are the same).