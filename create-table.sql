CREATE DATABASE IF NOT EXISTS test;
USE test;
CREATE TABLE USER
  (
     id          INT(8) PRIMARY KEY AUTO_INCREMENT,
     name        VARCHAR(25),
     age         INT,
     isAdmin     BIT,
     createdDate TIMESTAMP DEFAULT NOW()
  );
