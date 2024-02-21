-- Drop existing tables if they exist
DROP TABLE IF EXISTS User;
DROP TABLE  BillingInfo;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS UserSubscription;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Watches;
DROP TABLE IF EXISTS RateMovies;
DROP TABLE IF EXISTS MovieRate;

--  User table
CREATE TABLE User (
    UserID VARCHAR(255) PRIMARY KEY,
    Email VARCHAR(255),
    Password VARCHAR(255),
    Name VARCHAR(255),
    BirthDate DATE,
    Phone VARCHAR(20)
);

--  Subscription table
CREATE TABLE Subscription (
    SubscriptionID VARCHAR(255) PRIMARY KEY,
    StartDate DATE,
    SubscriptionType VARCHAR(255),
    Price DECIMAL(5,2),
    UserID VARCHAR(255), UNIQUE
    FOREIGN KEY (UserID) REFERENCES User(UserID) 
);

--  BillingInfo table 
CREATE TABLE BillingInfo (
    BillingID VARCHAR(255) PRIMARY KEY,
    UserID VARCHAR(255),UNIQUE
    CardholderName VARCHAR(255),
    BillingAddress VARCHAR(255),
    CardNumber VARCHAR(16),
    CVV INT,
    ExpirationDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);



-- Create Movies table
CREATE TABLE Movies (
    MovieID VARCHAR(255) PRIMARY KEY,
    Title VARCHAR(255),
    Rating VARCHAR(10),
    Year INT,
    Genre VARCHAR(255)
);

-- Create Watches table with corrected foreign key
CREATE TABLE Watches (
    UserID VARCHAR(255),
    MovieID VARCHAR(255),
    WatchDate DATE,
    PRIMARY KEY (UserID, MovieID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Create RateMovies table
CREATE TABLE RateMovies (
    RateID VARCHAR(255) PRIMARY KEY,
    Stars INT,
    Review VARCHAR(255),
    UserID VARCHAR(255),
    MovieID VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);


