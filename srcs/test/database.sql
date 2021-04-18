CREATE DATABASE wordpress;
CREATE USER 'agigi'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'agigi'@'localhost';
FLUSH PRIVILEGES;