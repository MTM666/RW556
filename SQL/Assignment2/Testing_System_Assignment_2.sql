-- Xóa database nếu đã tồn tại
DROP DATABASE IF EXISTS asm1;

-- Tạo database mới
CREATE DATABASE asm1;

-- Gọi database để dùng
USE asm1;

-- Xóa bảng department nếu đã tồn tại
DROP TABLE IF EXISTS department;
-- Tạo bảng department
CREATE TABLE department (
	department_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	department_name		VARCHAR(100) NOT NULL UNIQUE
);

-- Thêm dữ liệu vào bảng department
INSERT INTO department (department_name)
VALUES				   ('Marketing'),
					   ('Sale'),
                       ('Bảo vệ'),
                       ('Nhân sự'),
                       ('Tài chính');

-- Xóa bảng possition nếu đã tồn tại
DROP TABLE IF EXISTS possition;
-- Tạo bảng possition
CREATE TABLE possition (
	possition_id		SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    possition_name		ENUM('Dev', 'Test', 'Scum Master', 'PM') NOT NULL UNIQUE
);

-- Thêm dữ liệu vào bảng possition
INSERT INTO possition (possition_name)
VALUES				  ('Dev'),	
					  ('Test'),	
                      ('Scum Master'),	
                      ('PM');
                      
-- Xóa bảng accounts nếu đã tồn tại
DROP TABLE IF EXISTS accounts;
-- Tạo bảng accounts
CREATE TABLE accounts (
	account_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email				VARCHAR(255) NOT NULL UNIQUE DEFAULT 'Null',
    username			VARCHAR(255) NOT NULL UNIQUE,
    fullname			VARCHAR(255) NOT NULL DEFAULT 'Null',
    department_id		SMALLINT UNSIGNED NOT NULL,
    possition_id		SMALLINT UNSIGNED NOT NULL,
    create_date			DATETIME DEFAULT NOW(),
    CONSTRAINT fk_accounts_department FOREIGN KEY (department_id) REFERENCES department (department_id),
    CONSTRAINT fk_accounts_possition FOREIGN KEY (possition_id) REFERENCES possition (possition_id)
);

-- Thêm dữ liệu vào bảng accounts
INSERT INTO accounts (email, 							username, 					fullname, 				department_id, 		possition_id)
VALUES				('bao.nguyenvan@vti.com.vn',		'bao.nguyenvan', 			'Nguyễn Văn Bảo',				1,					2),
					('nghia.vungoc@vti.com.vn',			'nghia.vungoc', 			'Vũ Ngọc Nghĩa',				1,					3),
					('be.nguyendinh@vti.com.vn',		'be.nguyendinh', 			'Nguyễn Đình Bé',				5,					3),
					('xuan.nguyenthithanh@vti.com.vn',	'xuan.nguyenthithanh', 		'NGuyễn Thị Thanh Xuân',		2,					1),
					('phuong.nguyenthi@vti.com.vn',		'phuong.nguyenthi', 		'Nguyễn Thị Phượng',			2,					4),
					('hoang.doxuan@vti.com.vn',			'hoang.doxuan', 			'Đỗ Xuân Hoàng',				4,					4),
					('hieu.nguyenduc@vti.com.vn',		'hieu.nguyenduc', 			'Nguyễn Đức Hiếu',				3,					1),
					('thu.nguyenthingoc@vti.com.vn',	'thu.nguyenthingoc', 		'Nguyễn Thị Ngọc Thư',			4,					4),
					('chanh.nguyenvan@vti.com.vn',		'chanh.nguyenvan', 			'Nguyễn Văn Chanh',				3,					2),
					('cong.tranminh@vti.com.vn',		'cong.tranminh', 			'Trần Minh Công',				1,					2),
					('tay.tranminh@vti.com.vn',			'tay.tranminh', 			'Trần Minh Tây',				4,					1),
					('cuong.laivan@vti.com.vn',			'cuong.laivan', 			'Lại Văn Cường',				4,					3),
					('nam.nguyenhai@vti.com.vn',		'nam.nguyenhai', 			'Nguyễn Hải Nam',				5,					4),
					('yen.nguyenngoc@vti.com.vn',		'yen.nguyenngoc', 			'Nguyễn Ngọc Yến',				1,					4);

-- Xóa bảng accounts nếu đã tồn tại
DROP TABLE IF EXISTS `groups`;
-- Tạo bảng groups
CREATE TABLE `groups` (
	group_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	group_name			VARCHAR(100) NOT NULL UNIQUE DEFAULT 'Group chờ',
    creator_id			SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    create_date			DATETIME DEFAULT NOW(),
    CONSTRAINT fk_groups_accounts FOREIGN KEY (creator_id) REFERENCES accounts (account_id)
);

-- Thêm dữ liệu vào bảng groups
INSERT INTO `groups`(group_name, 				creator_id)
VALUES				('Group1_Marketing',			1),
					('Group2_Marketing',			2),
					('Group3_Marketing',			10),
					('Group1_Sale',					5),
					('Group1_Bảo vệ',				7),
					('Group1_Nhân sự',				6),
					('Group2_Nhân sự',				8),
					('Group3_Nhân sự',				11),
					('Group1_Tài chính',			3);	
                    
-- Xóa bảng group_account nếu đã tồn tại
DROP TABLE IF EXISTS group_account;
-- Tạo bảng group_account
CREATE TABLE group_account (
	group_id			TINYINT UNSIGNED NOT NULL,
    account_id			SMALLINT UNSIGNED NOT NULL,
    join_date			DATETIME DEFAULT NOW(),
    PRIMARY KEY (group_id, account_id),
    CONSTRAINT fk_groupaccount_groups FOREIGN KEY (group_id) REFERENCES `groups` (group_id),
    CONSTRAINT fk_groupaccount_accounts FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

-- Thêm dữ liệu vào bảng group_account
INSERT INTO group_account	(group_id, account_id)
VALUES						(	1,				1),
							(	1,				2),
							(	1,				14),
							(	2,				2),
							(	2,				1),
							(	2,				10),
							(	3,				10),
							(	3,				14),
							(	3,				2),
							(	4,				5),
							(	4,				4),
							(	5,				7),
							(	5,				9),
							(	6,				6),
							(	6,				8),
							(	6,				11),
							(	7,				8),
							(	7,				11),
							(	7,				12),
							(	8,				11),
							(	8,				6),
							(	8,				12),
							(	9,				3),
							(	9,				13);	
                            
-- Xóa bảng type_question nếu đã tồn tại
DROP TABLE IF EXISTS type_question;
-- Tạo bảng type_question
CREATE TABLE type_question (
	type_id				SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    type_name			ENUM('ESSAY', 'MULTYPLE-CHOICE') NOT NULL DEFAULT 'ESSAY'
);

-- Thêm dữ liệu vào bảng type_question
INSERT INTO type_question 	(type_name)
VALUES						('ESSAY'),
							('MULTYPLE-CHOICE');

-- Xóa bảng category_question nếu đã tồn tại
DROP TABLE IF EXISTS category_question;
-- Tạo bảng category_question
CREATE TABLE category_question (
	category_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    category_name		VARCHAR(50) NOT NULL UNIQUE	
);

-- Thêm dữ liệu vào bảng category_question
INSERT INTO category_question 	(category_name)
VALUES							('My SQL'),
								('Basic Java'),
                                ('Basic Frontend'),
                                ('Spring Boot'),
                                ('React Js');

DROP TABLE IF EXISTS question;
CREATE TABLE question (
	question_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content				VARCHAR(500) NOT NULL UNIQUE,
    category_id			SMALLINT UNSIGNED NOT NULL,
    type_id				SMALLINT UNSIGNED NOT NULL,
    creator_id			SMALLINT UNSIGNED NOT NULL,
    create_date			DATETIME DEFAULT NOW(),
    CONSTRAINT fk_question_categoryquestion FOREIGN KEY (category_id) REFERENCES category_question (category_id),
    CONSTRAINT fk_categoryquestion_typequestion FOREIGN KEY (type_id) REFERENCES type_question (type_id),
    CONSTRAINT fk_categoryquestion_accounts FOREIGN KEY (creator_id) REFERENCES accounts (account_id)
);

INSERT INTO question 	(content, 																category_id, 	type_id, 	creator_id)
VALUES					('SQL là gì?',																1,				1,			2	),		
						('Định nghĩa JOIN?',														1,				1,			10	),
                        ('NOMALIZATION – Chuẩn hóa là gì?',											1,				1,			4	),
                        ('Cú pháp SQL nào được dùng để trả về những giá trị khác nhau?',			1,				2,			2	),
                        ('Câu lệnh SQL nào sau đây được dùng để xóa các dòng dữ liệu khỏi bảng?',	1,				2,			9	),
                        ('Tại sao Java là độc lập cấu trúc?',										2,				1,			9	),
                        ('Class có thể chứa những kiểu biến nào?',									2,				1,			1	),
                        ('Bạn hiểu gì về Access Modifier?',											2,				1,			5	),
                        ('File chứa mã nguồn java sau khi được biên dịch có đuôi là gì?',			2,				2,			8	),
                        ('Một lớp trong Java có bao nhiêu lớp con?',								2,				2,			1	),
                        ('Làm thế nào bạn có thể tạo public key trong html?',						3,				1,			2	),
                        ('Câu hỏi thứ 2 của phần Basic Frontend',									3,				1,			8	),
                        ('Câu hỏi thứ 3 của phần Basic Frontend',									3,				1,			6	),
                        ('Câu hỏi thứ 4 của phần Basic Frontend',									3,				2,			9	),
                        ('Câu hỏi thứ 5 của phần Basic Frontend',									3,				2,			11	),
                        ('Câu hỏi thứ 1 của phần Spring Boot',										4,				2,			1	),
                        ('Câu hỏi thứ 2 của phần Spring Boot',										4,				2,			4	),
                        ('Câu hỏi thứ 3 của phần Spring Boot',										4,				2,			2	),
                        ('Câu hỏi thứ 4 của phần Spring Boot',										4,				2,			1	),
                        ('Câu hỏi thứ 5 của phần Spring Boot',										4,				2,			3	),
                        ('Câu hỏi thứ 1 của phần React Js',											5,				1,			10	),
                        ('Câu hỏi thứ 2 của phần React Js',											5,				1,			9	),
                        ('Câu hỏi thứ 3 của phần React Js',											5,				1,			8	),
                        ('Câu hỏi thứ 4 của phần React Js',											5,				2,			7	),
                        ('Câu hỏi thứ 5 của phần React Js',											5,				2,			6	);

DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
	answer_id			SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    content				VARCHAR(500) NOT NULL UNIQUE,
    question_id			SMALLINT UNSIGNED NOT NULL,
    is_correct			ENUM('TRUE', 'FALSE') NOT NULL,
    CONSTRAINT fk_answer_question FOREIGN KEY (question_id) REFERENCES question (question_id)
);
-- 1 chủ đề có 5 câu hỏi. 1 câu hỏi có 11 câu trả lời (3 câu hỏi tự luận mỗi câu 1 câu trả lời, 2 câu hỏi trắc nghiệm mỗi câu 4 câu trả lời)
INSERT INTO answer 		(content, 																			question_id, 		is_correct)
VALUES 					('SQL là ngôn ngữ máy tính dùng để quản lý dữ liệu',									1,					'TRUE'),
						('Từ khóa JOIN được dùng để nạp dữ liệu từ 2 hay nhiều bảng liên quan',					2,					'TRUE'),
						('Quá trình thiết kế bảng để tăng số liệu được gọi là chuẩn hóa',						3,					'TRUE'), -- Quá trình thiết kế bảng để giảm thiểu sự thừa số liệu được gọi là chuẩn hóa (True)
						('SELECT DISTINCT',																		4,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 4..',												4,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 4..',												4,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 4..',												4,					'FALSE'),
                        ('DELETE',																				5,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 5..',												5,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 5..',												5,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 5..',												5,					'FALSE'),
						('Trình biên dịch của nó tạo ra một định dạng file độc lập cấu trúc...',				6,					'TRUE'),
                        ('Một lớp có thể gồm biến local, biến instance, và biến lớp',							7,					'TRUE'),
                        ('Java cung cấp một số Access Modifier để thiết lập mức độ truy cập cho các lớp..',		8,					'TRUE'),
						('.jav',																				9,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 9..',												9,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 9..',												9,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 9..',												9,					'FALSE'),
                        ('Vô số',																				10,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 10..',												10,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 10..',												10,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 10..',												10,					'FALSE'),
                        ('Câu trả lời đúng cho câu hỏi 11',														11,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 12',														12,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 13',														13,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 14',														14,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 14..',												14,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 14..',												14,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 14.',												14,					'FALSE'),
						('Câu trả lời đúng cho câu hỏi 15',														15,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 15..',												15,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 15..',												15,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 15.',												15,					'FALSE'),
                        ('Câu trả lời đúng cho câu hỏi 16',														16,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 17',														17,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 18',														18,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 19',														19,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 19..',												19,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 19..',												19,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 19.',												19,					'FALSE'),
                        ('Câu trả lời đúng cho câu hỏi 20',														20,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 20..',												20,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 20..',												20,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 20.',												20,					'FALSE'),
                        ('Câu trả lời đúng cho câu hỏi 21',														21,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 22',														22,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 23',														23,					'TRUE'),
                        ('Câu trả lời đúng cho câu hỏi 24',														24,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 24..',												24,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 24..',												24,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 24.',												24,					'FALSE'),
                        ('Câu trả lời đúng cho câu hỏi 25',														25,					'TRUE'),
                        ('Câu trả lời sai thứ 1 cho câu hỏi 25..',												25,					'FALSE'),
                        ('Câu trả lời sai thứ 2 cho câu hỏi 25..',												25,					'FALSE'),
                        ('Câu trả lời sai thứ 3 cho câu hỏi 25.',												25,					'FALSE');

DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
	exam_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `code`				VARCHAR(50) NOT NULL UNIQUE,
    title				VARCHAR(200) NOT NULL UNIQUE,
    category_id			SMALLINT UNSIGNED NOT NULL,
    duration			TINYINT UNSIGNED NOT NULL,
    creator_id			SMALLINT UNSIGNED NOT NULL,
    create_date			DATETIME DEFAULT NOW(),
    CONSTRAINT fk_exam_categoryquestion FOREIGN KEY (category_id) REFERENCES category_question (category_id),
	CONSTRAINT fk_exam_accounts FOREIGN KEY (creator_id) REFERENCES accounts (account_id)
);

INSERT INTO exam 	(code, 							title, 									category_id, 	duration, 	creator_id)
VALUES				('MySQL-01',				'Đề thi MySQL01',								1,				15,			2),
					('MySQL-02',				'Đề thi MySQL02',								1,				30,			4),
					('Java-01',					'Đề thi Java01',								2,				15,			6),
					('Java-02',					'Đề thi Java02',								2,				30,			6),
                    ('BasicFrontend-01',		'Đề thi BasicFrontend01',						3,				15,			2),
					('Basic Frontend-02',		'Đề thi BasicFrontend02',						3,				30,			4),
                    ('SpringBoot-01',			'Đề thi SpringBoot01',							4,				30,			6),
					('SpringBoot-02',			'Đề thi SpringBoot02',							4,				30,			6),
                    ('ReactJs-01',				'Đề thi ReactJst01',							5,				30,			6),
					('ReactJs-02',				'Đề thi ReactJs02',								5,				30,			6);
                    
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
	exam_id				TINYINT UNSIGNED NOT NULL,
    question_id			SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_examquestion_exam FOREIGN KEY (exam_id) REFERENCES exam (exam_id),
    CONSTRAINT fk_examquestion_question FOREIGN KEY (question_id) REFERENCES question (question_id)
);

-- Mỗi đề thì có 3 câu hỏi. Câu hỏi trong đề thi có nội dung trùng với chủ đề thi
INSERT INTO exam_question 	(exam_id, 	question_id)
 VALUES						(	1,			1),
							(	1,			2),
							(	1,			3),
							(	2,			3),
							(	2,			1),
							(	2,			5),
                            (	3,			6),
                            (	3,			7),
                            (	3,			8),
                            (	4,			10),
                            (	4,			9),
                            (	4,			6),
							(	5,			11),
							(	5,			12),
							(	5,			13),
							(	6,			14),
							(	6,			15),
							(	6,			11),
							(	7,			16),
                            (	7,			17),
                            (	7,			18),
                            (	8,			19),
                            (	8,			20),
                            (	8,			17),
                            (	9,			22),
                            (	9,			24),
                            (	9,			25),
                            (	10,			21),
                            (	10,			23),
                            (	10,			25);