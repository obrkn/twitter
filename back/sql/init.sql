CREATE DATABASE IF NOT EXISTS twitter character SET utf8mb4 collate utf8mb4_bin;

USE twitter;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  failed_attempts INT NOT NULL DEFAULT 0,
  locked_at DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) character SET utf8mb4 collate utf8mb4_bin;

DROP TABLE IF EXISTS tweets;

CREATE TABLE IF NOT EXISTS tweets (
  id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
  user_id INT UNSIGNED NOT NULL,
  message VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
) character SET utf8mb4 collate utf8mb4_bin;

SET FOREIGN_KEY_CHECKS=1;