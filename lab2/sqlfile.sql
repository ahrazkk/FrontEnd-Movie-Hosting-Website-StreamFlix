CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Email VARCHAR(255),
    Password VARCHAR(255),
    Name VARCHAR(255),
    BirthDate DATE,
    Phone VARCHAR(20)
);

CREATE TABLE BillingInfo (
    UserID INT PRIMARY KEY,
    CardholderName VARCHAR(255),
    BillingAddress VARCHAR(255),
    CardNumber VARCHAR(16),
    CVV INT,
    ExpirationDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Subscription (
    SubscriptionID INT PRIMARY KEY,
    StartDate DATE,
    SubscriptionType VARCHAR(255),
    Price DECIMAL(5,2)
);

CREATE TABLE UserSubscription (
    UserID INT,
    SubscriptionID INT,
    PRIMARY KEY (UserID, SubscriptionID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID)
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    Rating DECIMAL(3,1), -- Assuming the rating is out of 10, for example
    Year INT,
    Genre VARCHAR(255)
);

CREATE TABLE Watches (
    UserID INT,
    MovieID INT,
    WatchDate DATE,
    PRIMARY KEY (UserID, MovieID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

CREATE TABLE RateMovies (
    RateID INT PRIMARY KEY,
    Stars INT, -- Number of stars given
    Review TEXT, -- Review text
    UserID INT,
    MovieID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

CREATE TABLE MovieRate (
    MovieID INT,
    RateID INT,
    PRIMARY KEY (MovieID, RateID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (RateID) REFERENCES RateMovies(RateID)
);
