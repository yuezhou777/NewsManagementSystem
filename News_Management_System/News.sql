USE "Group_1_Final";
GO

CREATE TABLE News.NewsCategory
(
    CategoryID INT IDENTITY NOT NULL PRIMARY KEY,
    CategoryName VARCHAR(30)
);
CREATE TABLE News.News
(
    NewsID INT IDENTITY NOT NULL PRIMARY KEY,
    ContributorID INT NOT NULL REFERENCES Person.Contributor(PersonID),
    CategoryID INT NOT NULL REFERENCES News.NewsCategory(CategoryID),
    Headline VARCHAR(255) NOT NULL,
    PublishingTime DATE DEFAULT GETDATE(),
    NewsContent VARCHAR(255) NOT NULL,
    NewsContentType VARCHAR(10) NOT NULL,
    Likes INT,
    IsChargeable VARCHAR(10) NOT NULL
);

CREATE FUNCTION News.fn_EvaluateNews(@Newsid INT)
RETURNS VARCHAR (10)
AS
    BEGIN
    DECLARE @evaluation VARCHAR (10) =
    CASE
    WHEN(
    SELECT Likes
    FROM News.News
    WHERE NewsID =@Newsid) > 100 THEN 'high'
    WHEN(SELECT Likes
    FROM News.News
    WHERE NewsID =@Newsid) < -20 THEN 'low'
    ELSE 'normal'
    END
    RETURN @evaluation;
END


ALTER TABLE News.News
ADD Evaluation AS (News.fn_EvaluateNews(NewsID));

CREATE TABLE News.ChargeableNews
(
    NewsID INT NOT NULL PRIMARY KEY REFERENCES News.News(NewsID),
    Price Money NOT NULL
);

CREATE TABLE News.Subscribe
(
    SubscribeID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    PersonID INT REFERENCES Person.[user](PersonID),
    CategoryID INT REFERENCES News.NewsCategory(CategoryID)
);

INSERT News.Subscribe
VALUES(1, 2),
    (1, 3),
    (1, 5),
    (2, 1),
    (2, 6),
    (7, 5),
    (2, 8),
    (7, 9),
    (10, 1),
    (2, 5);

CREATE TABLE News.Comment
(
    CommentID INT IDENTITY NOT NULL PRIMARY KEY,
    PersonID INT NOT NULL REFERENCES Person.[User](PersonID),
    NewsID INT NOT NULL REFERENCES News.News(NewsID),
    CommentContent VARCHAR(255) NOT NULL,
    CommentTime DATETIME DEFAULT Current_Timestamp
);


INSERT News.NewsCategory
VALUES('Politics'),
    ('World'),
    ('Business'),
    ('Technology'),
    ('Health'),
    ('Entertainment'),
    ('Science'),
    ('Sports'),
    ('Movies'),
    ('Music');

INSERT News.News
    (ContributorID, CategoryID, HeadLine, NewsContent, NewsContentType, Likes, IsChargeable)
VALUES(11, 1, 'Congress Is at a Loss', '/Users/chendanni/Desktop/file/Congress Is at a Loss.txt ', 'text', 0, 'false'),
    (12, 2, 'Brazil Favelas Brace for the Coronavirus', '/Users/chendanni/Desktop/file/Brazil Favelas Brace for the Coronavirus.txt', 'text', 5, 'true'),
    (12, 3, 'Paying Rent in a Crisis', '/Users/chendanni/Desktop/file/Paying Rent in a Crisis.mp3', 'audio', 0, 'true'),
    (13, 4, 'Tired of Seeing Your Own Face on Zoom? Hide It.', '/Users/chendanni/Desktop/file/Tired of Seeing Your Own Face on Zoom? Hide It.txt', 'text', 4, 'true'),
    (11, 5, 'My Anxiety About COVID-19 Is Through the Roof', '/Users/chendanni/Desktop/file/My Anxiety About COVID-19 Is Through the Roof.txt', 'text', 113, 'false'),
    (14, 1, 'The Battle for New York', '/Users/chendanni/Desktop/file/The Battle for New York.txt', 'text', 6, 'true'),
    (15, 6, 'The Pandemic Is Disrupting Years of Field', '/Users/chendanni/Desktop/file/The Pandemic Is Disrupting Years of Field Science.txt', 'text', -22, 'true'),
    (12, 8, 'Did NFL Players Get a Good Deal?', '/Users/chendanni/Desktop/file/Did NFL Players Get a Good Deal?.txt', 'text', 9, 'false'),
    (11, 9, 'How Working With Rock Stars Prepared Autumn de Wilde to Direct Emma', '/Users/chendanni/Desktop/file/How Working With Rock Stars Prepared Autumn de Wilde to Direct Emma.jpeg', 'image', 11, 'true'),
    (12, 10, 'Country Most Potent Songwriter Is Back With Her Most Personal Album Yet', '/Users/chendanni/Desktop/file/Country Most Potent Songwriter Is Back With Her.txt', 'text', 229, 'false'),
    (11, 5, 'Jerry Falwell Jr. vs. the Coronavirus', '/Users/chendanni/Desktop/file/Jerry Falwell Jr. vs. the Coronavirus.mp3', 'audio', 10, 'true'),
    (16, 10, 'That Girl Was Ahead of Its Time. This Episode Shows Just How Far Ahead.', '/Users/chendanni/Desktop/file/That Girl Was Ahead of Its Time. This Episode Show.txt', 'text', 116, 'false'),
    (16, 4, 'The Internet Archive Started an mergency Online Library. Authors Are Furious.', '/Users/chendanni/Desktop/file/The Internet Archive Started an mergency Online.txt', 'text', 19, 'true'),
    (13, 5, 'Coronavirus Diaries: My Husband Was Among the First Documented Cases of the Coronavirus in the U.S.', '/Users/chendanni/Desktop/file/Coronavirus Diaries/ My Husband Was Among the Firs.txt', 'text', 1, 'true'),
    (12, 9, 'The Best Simpsons Episode for Viewers Who鈥檝e Somehow Never Watched This Show', '/Users/chendanni/Desktop/file/The Best Simpsons Episode for Viewers Whoe Somehow Never Watched This Show.jpeg', 'image', 4, 'false'),
    (19, 7, 'Do You Really Need to Stay 6 Feet Away From Others While Running?', '/Users/chendanni/Desktop/file/Do You Really Need to Stay 6 Feet Away From Others.txt', 'text', 27, 'true'),
    (17, 5, 'Our Health Insurance System Was Not Built for a Plague', '/Users/chendanni/Desktop/file/Our Health Insurance System Was Not Built for a Pl.txt', 'text', 143, 'true');


INSERT News.ChargeableNews
VALUES(3, 3.99),
    (4, 2.99),
    (6, 1.99),
    (7, 1.99),
    (9, 0.99),
    (11, 2.99),
    (13, 1.5),
    (14, 2.99),
    (16, 1.99),
    (17, 2.98);

INSERT News.Comment
    (PersonID, NewsID, CommentContent)
VALUES(1, 3, 'I missed Kushner speaking.  Did he solve the crisis, and more importantly, did he sound like Gilbert Gottfried?'),
    (1, 3, 'I hope this whole mess brings Mitch and his cronies down. They are weaponized uselessness.'),
    (1, 6, 'Part 3 of Slates 10 part series on governments they dislike who are mishandling the Corona Virus. Do not plan to see Germany, Sweden, or France in this series. '),
    (4, 8, 'I put on a wig and some neon green glasses and tell everybody I enabled the filter option in Zoom.  Then I pretend not to be able to understand why they cant find the option on their end.'),
    (3, 9, 'You should probably just get Covid and get it over with. Its the waiting that gets you.'),
    (6, 10, 'What they are really saying is they cant distribute the physical copies of the games to their satisfaction. Otherwise there is no reason for this type of delay.'),
    (2, 17, 'My colleague in the Bay Area said the highways are barren and the usual afternoon northward grind from San Jose to San Fran is a cakewalk.'),
    (8, 8, 'Yeah, maybe because at a time when the other two major sports leagues in America are stopped right now, they figured doing the same over money would be a colossal bad look?'),
    (6, 9, 'What a gorgeous exchange about the films soundtrack. Shes so right about Peter and the Wolf, it is one the most evocative pieces of music in history for how it so clearly assigns character to its parts. '),
    (7, 10, 'Not only true, but actually the opposite. Most aspiring and fledgling songwriters start out writing about themselves. Some never stop. There are excellent personal songs of course, especially when they reach for universal theme'),
    (7, 12, 'I was always a little surprised Marlo Thomas didn have a much bigger film/movie career after That Girl. At the time of the series she really was the  Girlof television. '),
    (7, 14, 'I know of two people that most likely had it back in January / Feb. They had bad flu / phenomena like symptoms and the tests came back negative. At that point they did not suspect corona or have the tests yet. They have both recovered. '),
    (2, 16, 'Wear a mask. You would not believe how much distance people give me when I wear my mask into a store.'),
    (3, 17, 'Medical providers? So you mean Dr salaries? If so, theye a drop in the stupid big trough with a whole bunch of bigger mouths stuffed in');
