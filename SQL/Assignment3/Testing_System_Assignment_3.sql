USE asm1;

-- Question 2: lấy ra tất cả các phòng ban
SELECT *
FROM department;

-- Question 3: lấy ra id của phòng ban "Sale"
SELECT department_id
FROM department
WHERE department_name = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *, length(fullname)
FROM accounts
WHERE length(fullname) = (SELECT max(length(fullname))
						  FROM accounts);
                          
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *, length(fullname)
FROM accounts
WHERE length(fullname) = (SELECT max(length(fullname))
						  FROM accounts
						  WHERE department_id = 3);
                          
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT group_name
FROM `groups`
WHERE create_date < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT question_id
FROM answer
GROUP BY question_id -- Nhóm lại rồi đếm
HAVING count(answer_id) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 20 phút và được tạo trước ngày 09/08/2022
SELECT `code`
FROM exam
WHERE duration >= 20 AND create_date < '2022-08-09';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `groups`
ORDER BY create_date DESC -- Sắp xếp từ lớn đến nhỏ
LIMIT 5; -- lấy 5 record từ trên xuống

-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT count(account_id) AS 'Số lượng nhân viên phòng Sale'
FROM accounts
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "N" và kết thúc bằng chữ "o"
SELECT *
FROM accounts
WHERE fullname LIKE 'N%o'; 

-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM exam_question
WHERE exam_id IN (SELECT exam_id
				  FROM exam
                  WHERE create_date < '2019-12-20');
                  
SET SQL_SAFE_UPDATES = 0; -- k tắt chế độ cập nhật an toàn sẽ báo lỗi 1175
DELETE FROM exam
WHERE create_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "SQL"
-- Phải xóa các bảng có chứa khóa ngoại liên quan trước
DELETE FROM answer
WHERE question_id = (SELECT question_id
					 FROM question
                     WHERE content LIKE ('SQL%'));
                     
DELETE FROM exam_question
WHERE question_id = (SELECT question_id
					 FROM question
                     WHERE content LIKE ('SQL%'));
                     
DELETE FROM question
WHERE content LIKE ('SQL%');

-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và 
-- email thành loc.nguyenba@vti.com.vn
UPDATE accounts
SET fullname = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com.vn', username = 'loc.nguyenba'
WHERE account_id = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE group_account
SET group_id = 1
WHERE account_id = 5;