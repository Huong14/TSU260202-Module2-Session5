SELECT `Mã sinh viên`, UPPER(`Họ và tên`) AS full_name
FROM student_constrainter;

ALTER TABLE student_constrainter DROP COLUMN `Tuổi`;

SELECT `Họ và tên`, TIMESTAMPDIFF(YEAR, `Ngày sinh`, CURDATE()) AS age
FROM student_constrainter;

ALTER TABLE student_constrainter
ADD COLUMN score INT;

ALTER TABLE student_constrainter
MODIFY score DECIMAL(4,2);

UPDATE student_constrainter SET score = '8.52' WHERE `Mã sinh viên` = 'SV001';
UPDATE student_constrainter SET score = '5.55' WHERE `Mã sinh viên` = 'SV002';
UPDATE student_constrainter SET score = '9.57' WHERE `Mã sinh viên` = 'SV004';
UPDATE student_constrainter SET score = '7.77' WHERE `Mã sinh viên` = 'SV005';
UPDATE student_constrainter SET score = '8.69' WHERE `Mã sinh viên` = 'SV006';

SELECT `Họ và tên`, ROUND(score,1) AS score_round
FROM student_constrainter;

SELECT
      COUNT(*) AS total_stu,
      MAX(score) AS max_score,
      MIN(score) AS min_score
FROM student_constrainter;