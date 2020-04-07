USE "Group_1_Final";
GO

CREATE SCHEMA Person
GO

CREATE TABLE Person.Person
(
    PersonID INT IDENTITY NOT NULL PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    PersonType VARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    RegisterTime DATETIME default current_timestamp,
    LastLoginTime DATETIME,
    LastLogOutTime DATETIME
);

Insert Person.Person
VALUES('Jack', 'Richins', 'User', '7817839029', 'ewqJack@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('David', 'Johnson', 'User', '3256183548', 'weqavid@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Eric', 'Young', 'User', '3692287624', 'tgfdtGarrett@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Susan', 'Metters', 'User', '9865118896', 'ewqusan@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Jing', 'Yalovsky', 'User', '3256183548', 'testDavid@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Garrett', 'Young', 'User', '3692287624', 'testGarrett@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Susan', 'Metters', 'User', '9865118896', 'testSusan@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('David', 'Tian', 'User', '3256183548', 'testDavid@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Garrett', 'Young', 'User', '3692287624', 'tesgfdrett@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Susan', 'Metters', 'User', '9865118896', 'tegfdsan@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),

    ('George', 'Li', 'Contributor', '9912438143', 'tesgfdeorge@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('David', 'Yalovsky', 'Contributor', '5536914258', 'tegfdavid@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Marc', 'George', 'Contributor', '7365629519', 'testMarc@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('George', 'Marc', 'Contributor', '9912438143', 'testGeorge@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('David', 'Yalovsky', 'Contributor', '5536914258', 'testDavid@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Marc', 'Tian', 'Contributor', '7365629519', 'testMarc@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('George', 'Zhang', 'Contributor', '9912438143', 'tefdfgGeorge@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('David', 'Wang', 'Contributor', '5536914258', 'gfdstDavid@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Marc', 'Zui', 'Contributor', '7365629519', 'tesgfdc@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Eugene', 'Zabokritski', 'Contributor', '5536344258', 'tegfdgene@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),


    ('Benjamin', 'Martin', 'Adminstrator', '7371529519', 'tesjamin@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Reed', 'Koch', 'Adminstrator', '3692264824', 'tesed@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('David', 'Martin', 'Adminstrator', '7371529519', 'tenjamin@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Eric', 'Koch', 'Adminstrator', '3692264824', 'testReed@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Kai', 'Martin', 'Adminstrator', '7371529519', 'tenjamin@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Yang', 'Koch', 'Adminstrator', '3692264824', 'testRe@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Wei', 'Martin', 'Adminstrator', '7371529519', 'testBeffdsamin@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Bob', 'Koch', 'Adminstrator', '3692264824', 'testgfdgfdeed@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Mike', 'Martin', 'Adminstrator', '7371529519', 'testgfdnjamin@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00'),
    ('Spencer', 'Koch', 'Adminstrator', '3692264824', 'tegfded@gmail.com', '', '2020-01-01 00:00:00', '2020-01-02 00:00:00')

CREATE TABLE Person.[User]
(
    PersonID INT PRIMARY KEY,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(30) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State VARCHAR(30) NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person.Person(PersonID)
);

ALTER TABLE Person.[User]
ADD Age AS DATEDIFF(hour,DateOfBirth,GETDATE())/8766;


Insert Person.[User]
VALUES(1, '1991-02-14', 'male', 'Seattle', 'WA'),
    (2, '1991-02-01', 'male', 'Seattle', 'WA'),
    (3, '1995-03-01', 'male', 'San Jose', 'WA'),
    (4, '1985-01-21', 'female', 'Boston', 'MA'),
    (5, '1991-07-22', 'female', 'Redmond', 'WA'),
    (6, '1992-08-01', 'male', 'Taiyuan', 'Shanxi'),
    (7, '1997-11-16', 'female', 'Wuhan', 'Hubei'),
    (8, '1991-12-02', 'male', 'Luoyang', 'Henan'),
    (9, '1998-10-05', 'female', 'Seattle', 'WA'),
    (10, '1992-08-08', 'male', 'Seattle', 'WA')

CREATE TABLE Person.Contributor
(
    PersonID INT PRIMARY KEY,
    NewsPressName VARCHAR(30) NOT NULL,
    FOREIGN KEY (PersonID) REFERENCES Person.Person(PersonID)
);

Insert Person.Contributor
VALUES(11, 'xinhuashe'),
    (12, 'BBC'),
    (13, 'News'),
    (14, 'New York News'),
    (15, 'jinritoutiao'),
    (16, 'tengxunxinwen'),
    (17, 'baiduxinwen'),
    (18, 'xinlangxinwen'),
    (19, 'wangyixinwen'),
    (20, 'xinhuashe')

CREATE TABLE Person.Adminstrator
(
    PersonID INT PRIMARY KEY,
    PermissonType VARCHAR(10),
    FOREIGN KEY (PersonID) REFERENCES Person.Person(PersonID)
);
Insert Person.Adminstrator
VALUES(21, 'AdminA'),
    (22, 'AdminA'),
    (23, 'AdminA'),
    (24, 'AdminB'),
    (25, 'AdminB'),
    (26, 'AdminB'),
    (27, 'AdminB'),
    (28, 'AdminC'),
    (29, 'AdminC'),
    (30, 'AdminC')

CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Test_P@sswOrd';

CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'Group1 Test Certificate',
EXPIRY_DATE = '2026-10-31';

CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

CREATE TABLE Person.CreditCardDetail
(
    CardID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    AccountNumber VARBINARY(250),
    ExpireDate DATE,
    CVR VARBINARY(250),
    CardType VARCHAR(30),
    BillingAddress VARCHAR(255),
    City VARCHAR(30),
    State VARCHAR(30),
    Country VARCHAR(30),
    PostCode VARCHAR(10)
);

CREATE TABLE Person.PaymentMethod
(
    PaymentMethodID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    PersonID INT REFERENCES Person.[User](PersonID),
    CardID INT REFERENCES Person.CreditCardDetail(cardID)
);

CREATE TABLE Person.PaymentRecord
(
    PaymentRecordID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    NewsID INT REFERENCES News.News(NewsID),
    PaymentMethodID INT REFERENCES Person.PaymentMethod(paymentMethodID),
    PaymentDate DATETIME DEFAULT current_timestamp,
    Price money
);

INSERT Person.CreditCardDetail
VALUES('fn1', 'ln1', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000001')), '2021-4-1', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '123')), 'credit', '100 abc Rd.', 'seattle', 'wa', 'usa', '98100'),
    ('fn2', 'ln2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000002')), '2021-4-2', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'abc')), 'credit', '123 dc Rd.', 'seattle', 'wa', 'usa', '98100'),
    ('fn3', 'ln3', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000003')), '2021-4-3', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'asd')), 'debit', '5th Ave.', 'New York', 'NY', 'usa', '12345'),
    ('fn4', 'ln4', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000004')), '2021-4-4', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'zxc')), 'credit', '500 dc St.', 'Santa Clara', 'CA', 'usa', '58100'),
    ('fn5', 'ln5', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000005')), '2021-5-5', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '14d')), 'debit', '700 dc Rd.', 'Washington DC.', 'DC.', 'usa', '10021'),
    ('fn6', 'ln6', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000006')), '2023-6-6', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'adb')), 'credit', '12331 dc Rd.', 'seattle', 'wa', 'usa', '98500'),
    ('fn7', 'ln7', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '00000002')), '2027-7-7', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'abc')), 'credit', '123 dc Rd.', 'seattle', 'wa', 'usa', '98100'),
    ('fn8', 'ln8', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '88888888')), '2021-8-8', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '888')), 'credit', 'Duolun Rd.', 'Shanghai', 'Shanghai', 'China', '200072'),
    ('fn9', 'ln9', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '0000999999')), '2023-9-9', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'asd')), 'credit', 'NanJing Rd.', 'Shanghai', 'Shanghai', 'China', '200000'),
    ('fn10', 'ln10', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, '10101010101010')), '2027-10-10', EncryptByKey(Key_GUID(N'TestSymmetricKey'), convert(varbinary, 'w2t')), 'debit', 'ChangAn Ave.', 'BeiJing', 'BeiJing', 'China', '100010');


INSERT Person.PaymentMethod
    (PersonID, cardID)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (4, 4),
    (5, 5),
    (6, 7),
    (6, 1),
    (7, 4),
    (1, 5),
    (10, 10);

INSERT Person.PaymentRecord
    (newsID, paymentMethodID, price)
VALUES
    (1, 1, 13.7),
    (2, 1, 22),
    (1, 3, 33.2),
    (4, 4, 13),
    (2, 5, 5.2),
    (6, 6, 16.0),
    (4, 7, 27),
    (3, 7, 15),
    (1, 10, 0.5),
    (7, 9, 13);

GO
