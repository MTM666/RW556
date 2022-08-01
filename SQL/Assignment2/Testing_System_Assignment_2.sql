DROP DATABASE IF EXISTS asm1;
CREATE DATABASE asm1;
USE asm1;

CREATE TABLE department (
	department_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	department_name		VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE possition (
	possition_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    possition_name		VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE accounts (
	account_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email			VARCHAR(100) NOT NULL UNIQUE DEFAULT 'Null',
    username		VARCHAR(100) NOT NULL UNIQUE,
    fullname		VARCHAR(255) NOT NULL DEFAULT 'Null',
    department_id	SMALLINT UNSIGNED,
    possition_id	SMALLINT UNSIGNED,
    create_date		DATETIME DEFAULT NOW(),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department (department_id),
    CONSTRAINT fk_possition FOREIGN KEY (possition_id) REFERENCES possition (possition_id)
);

CREATE TABLE `groups` (
	group_id		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	group_name		VARCHAR(100) NOT NULL UNIQUE DEFAULT 'Group chờ',
    creator_id		SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    create_date		DATETIME DEFAULT NOW(),
    CONSTRAINT fk_accounts FOREIGN KEY (creator_id) REFERENCES accounts (account_id)
);

CREATE TABLE group_account (
	group_id		TINYINT UNSIGNED NOT NULL,
    account_id		SMALLINT UNSIGNED NOT NULL,
    join_date		DATETIME DEFAULT NOW(),
    PRIMARY KEY (group_id, account_id),
    CONSTRAINT fk_groups FOREIGN KEY (group_id) REFERENCES `groups` (group_id),
    CONSTRAINT fk_accounts1 FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

CREATE TABLE type_question (
	type_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name		ENUM('ESSAY', 'MULTYPLE-CHOICE') NOT NULL DEFAULT 'Essay'
);

CREATE TABLE category_question (
	category_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name	VARCHAR(50) NOT NULL UNIQUE	
);

CREATE TABLE question (
	question_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(500) NOT NULL UNIQUE,
    category_id		SMALLINT UNSIGNED NOT NULL,
    type_id			SMALLINT UNSIGNED NOT NULL,
    creator_id		SMALLINT UNSIGNED NOT NULL,
    create_date		DATETIME DEFAULT NOW(),
    CONSTRAINT fk_category_question FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    CONSTRAINT fk_type_question FOREIGN KEY (type_id) REFERENCES type_question (type_id),
    CONSTRAINT fk_accounts2 FOREIGN KEY (creator_id) REFERENCES accounts (account_id)
);

CREATE TABLE answer (
	answer_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content			VARCHAR(500) NOT NULL UNIQUE,
    question_id		SMALLINT UNSIGNED NOT NULL,
    is_correct		ENUM('TRUE', 'FALSE') NOT NULL,
    CONSTRAINT fk_question FOREIGN KEY (question_id) REFERENCES question (question_id)
);

CREATE TABLE exam (
	exam_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`			VARCHAR(50) NOT NULL UNIQUE,
    title			VARCHAR(200) NOT NULL UNIQUE,
    category_id		SMALLINT UNSIGNED NOT NULL,
    duration		TINYINT UNSIGNED NOT NULL,
    creator_id		SMALLINT UNSIGNED NOT NULL,
    create_date		DATETIME DEFAULT NOW(),
    CONSTRAINT fk_category_question1 FOREIGN KEY (category_id) REFERENCES category_question (category_id),
	CONSTRAINT fk_question3 FOREIGN KEY (creator_id) REFERENCES accounts (account_id)
);

CREATE TABLE exam_question (
	exam_id			TINYINT UNSIGNED NOT NULL,
    question_id		SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_exam FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    CONSTRAINT fk_question2 FOREIGN KEY (question_id) REFERENCES question (question_id)
);