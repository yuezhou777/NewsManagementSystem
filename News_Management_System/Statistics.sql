USE "Group_1_Final";
GO

CREATE SCHEMA [STATISTICS];
GO

CREATE TABLE [STATISTICS].UserVolume
(
    VolumeDate DATE NOT NULL PRIMARY KEY,
    Volume INT
);

CREATE TABLE [STATISTICS].NewsVolume
(
    VolumeDate DATE NOT NULL PRIMARY KEY,
    NewsID INT REFERENCES News.News(NewsID),
    Volume INT
);

GO

CREATE TRIGGER TR_CheckNewsReleaseDate
ON [STATISTICS].NewsVolume
AFTER INSERT AS 
BEGIN
    DECLARE @ReleaseDate DATE;
    SELECT @ReleaseDate = PublishingTime
    FROM News.News
    WHERE NewsID = (SELECT NewsID
    FROM Inserted)
    IF @ReleaseDate > (SELECT VolumeDate
    FROM Inserted) 
      BEGIN
        Rollback;
    END
END;
GO

CREATE TABLE [STATISTICS].Advertisement
(
    AdvertisementID INT IDENTITY NOT NULL PRIMARY KEY,
    CategoryID INT NOT NULL REFERENCES News.NewsCategory(CategoryID),
    AdContent VARCHAR(255) NOT NULL,
    AdStartTime DATE NOT NULL,
    AdEndTime DATE NOT NULL
);

CREATE TABLE [STATISTICS].AdvertisementStatistics
(
    VolumeDate DATE NOT NULL PRIMARY KEY,
    AdvertisementID INT REFERENCES [STATISTICS].Advertisement(AdvertisementID),
    ViewTimes INT
);


ALTER TABLE [STATISTICS].Advertisement 
	ADD CONSTRAINT check_AdDate CHECK (AdStartTime <= AdEndTime);


GO
CREATE PROCEDURE AddUserVolume
AS
BEGIN
    DECLARE @startDate DATE
    SET @startDate = '12-01-2019'
    WHILE @startDate < '04-01-2020'
	BEGIN
        INSERT [STATISTICS].UserVolume
            (VolumeDate, Volume)
        VALUES(@startDate, CAST(CEILING(RAND() * 1000) AS INT))
        SET @startDate = DATEADD(day,1,@startDate);
    END
END
GO


CREATE PROCEDURE AddNewsVolume
AS
BEGIN
    DECLARE @startDate DATE
    SET @startDate = '12-01-2019'
    WHILE @startDate < '04-01-2020'
	BEGIN
        INSERT [STATISTICS].NewsVolume
            (VolumeDate, NewsID, Volume)
        VALUES(@startDate, CAST(CEILING(RAND() * 10) AS INT), CAST(CEILING(RAND() * 1000) AS INT))
        SET @startDate = DATEADD(day,1,@startDate);
    END
END;
GO

CREATE PROCEDURE AddAdvertiseViewTimes
AS
BEGIN
    DECLARE @startDate DATE
    SET @startDate = '12-01-2019'
    WHILE @startDate < '04-01-2020'
	BEGIN
        INSERT [STATISTICS].AdvertisementStatistics
            (VolumeDate, AdvertisementID, ViewTimes)
        VALUES(@startDate, CAST(CEILING(RAND() * 10) AS INT), CAST(CEILING(RAND() * 1000) AS INT))
        SET @startDate = DATEADD(day,1,@startDate);
    END
END

EXEC AddUserVolume;
EXEC AddNewsVolume;
EXEC AddAdvertiseViewTimes;


INSERT [STATISTICS].Advertisement
    (CategoryID, AdContent, AdStartTime, AdEndTime)
VALUES(1, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad1_WoodstockPizza_03252020.txt', '01-01-2020', '05-31-2020'),
    (3, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad2_MintMobile_03252020.txt', '03-01-2020', '05-01-2020'),
    (2, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad3_LauraSmith_04022020.txt', '02-01-2020', '04-24-2020'),
    (6, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad4_FreeIcons_03272020.txt', '04-01-2020', '05-31-2020'),
    (4, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad5_FrenchFries_03282020.txt', '02-01-2020', '03-31-2020'),
    (5, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad6_ FruitCrisps_03292020.txt', '01-01-2020', '12-31-2020'),
    (10, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad7_Negroni_03302020.txt.txt', '10-01-2019', '05-31-2020'),
    (9, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad8_DutchCaptain_03312020.txt.txt', '12-01-2019', '12-31-2020'),
    (8, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad9_ButterLondon_04012020.txt', '12-31-2019', '06-01-2020'),
    (7, '/Users/yuezhou/Code/NEU/6210/Project/Advertisement/Ad10_Gilt_04022020.txt', '01-01-2020', '01-31-2020')

GO
CREATE VIEW UserVolume_vw
AS
    SELECT DATEPART(mm,VolumeDate) AS [month], DATEPART(yy,VolumeDate) AS [year], SUM(Volume) AS volume
    FROM [STATISTICS].UserVolume
    group by DATEPART(mm,VolumeDate), DATEPART(yy,VolumeDate);
GO


CREATE VIEW NewsVolume_vw
AS
    SELECT CategoryID, DATEPART(mm,VolumeDate) AS [month], DATEPART(yy,VolumeDate) AS [year], SUM(Volume) AS volume
    FROM [STATISTICS].NewsVolume nv
        JOIN News.News nn
        ON nn.NewsID = nv.NewsID
    group by DATEPART(mm,VolumeDate), DATEPART(yy,VolumeDate), CategoryID;
GO

CREATE VIEW HighQualityNews_vw
AS
    SELECT PublishingTime, NewsID, Likes, HeadLine, RANK() OVER(PARTITION BY PublishingTime ORDER by Likes DESC) AS newsRank
    FROM News.News n
    WHERE Likes > 100;
GO

CREATE VIEW userStatisticsBasedOnAge
AS
    SELECT SUM (CASE WHEN Age < 12 THEN 1 else 0 END) AS child,
        SUM (CASE WHEN Age >= 12 and Age < 19 THEN 1 else 0 END) AS teenage,
        SUM (CASE WHEN Age >= 19 AND Age < 26 THEN 1 else 0 END) AS [young adult],
        SUM (CASE WHEN Age >= 26 AND Age < 40 THEN 1 else 0 END) AS adult,
        SUM (CASE WHEN Age >= 40 AND Age < 60 THEN 1 else 0 END) AS [middle aged person],
        SUM (CASE WHEN Age >= 60 THEN 1 else 0 END) AS [old person]
    FROM Person.[User]
GO


CREATE VIEW subscribeStatistics
AS
    SELECT nc.CategoryID, nc.CategoryName, COUNT(DISTINCT s.PersonID) AS [Number]
    FROM News.Subscribe s
        JOIN News.NewsCategory nc
        ON s.CategoryID = nc.CategoryID
    GROUP BY nc.CategoryID, nc.CategoryName
    ORDER BY nc.CategoryID
GO
