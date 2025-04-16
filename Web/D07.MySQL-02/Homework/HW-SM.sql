/*Tạo các bảng*/
CREATE TABLE LOP
(
    Lop VARCHAR(10) PRIMARY KEY,
    gvcn VARCHAR(100)
);

CREATE TABLE DSHS
(
    MaHS INT PRIMARY KEY auto_increment,
    Ho VARCHAR(50),
    Ten VARCHAR(25),
    Nu BOOLEAN,
    NgaySinh DATETIME,
    Lop VARCHAR(10),
    GhiChu TEXT,
    FOREIGN KEY (Lop) REFERENCES LOP(Lop)
);

CREATE TABLE DIEM
(
    MaHS INT,
    Toan DECIMAL(4,2),
    Ly DECIMAL(4,2),
    Hoa DECIMAL(4,2),
    Van DECIMAL(4,2),
    DTB DECIMAL(4,2),
    XepLoai VARCHAR(20),
    FOREIGN KEY (MaHS) REFERENCES DSHS(MaHS)
);

/*Thêm dữ liệu vào bảng*/
INSERT INTO LOP (Lop, gvcn) VALUES
('10A1', 'Nguyễn Văn A'),
('10A2', 'Trần Thị B'),
('11B1', 'Lê Văn C'),
('12C1', 'Phạm Thị D');

INSERT INTO DSHS (Ho, Ten, Nu, NgaySinh, Lop, GhiChu) VALUES
('Nguyễn Minh', 'Anh', TRUE, '2008-05-10', '10A1', 'Học giỏi'),
('Trần Thành', 'Công', FALSE, '2007-09-15', '10A2', 'Chăm chỉ'),
('Lê Thảo', 'Nguyên', TRUE, '2006-12-20', '11B1', 'Học sinh xuất sắc'),
('Phạm Huy', 'Hoàng', FALSE, '2005-03-05', '12C1', 'Thích thể thao'),
('Chào Ánh', 'Nguyệt', TRUE, '1999-09-06', '11B1', 'Ánh trăng sáng');

INSERT INTO DIEM (MaHS, Toan, Ly, Hoa, Van, DTB, XepLoai) VALUES
(16, 9.0, 8.5, 9.2, 7.8, 8.63, 'Giỏi'),
(17, 7.5, 6.8, 7.0, 8.0, 7.33, 'Khá'),
(18, 9.5, 9.0, 8.8, 9.2, 9.13, 'Xuất sắc'),
(19, 6.0, 5.5, 6.2, 7.0, 6.18, 'Trung bình'),
(20, 9.5, 9.0, 8.8, 9.2, 9.13, 'Xuất sắc');

-- 1.	danh sách sinh viên: mã hs, họ và tên (là 1 cột), ngày sinh.
SELECT MaHS, CONCAT(Ho, ' ', Ten) as HoTen, NgaySinh
FROM DSHS;

-- 2.	Hiện danh sách sinh viên: mã hs, họ và tên (là 1 cột), sinh ngày 20
SELECT MaHS, CONCAT(Ho, ' ', Ten) as HoTen, NgaySinh
FROM DSHS
WHERE DAY(NgaySinh) = 20;

-- 3.	Hiện danh sách sinh viên: mã hs, họ và tên (là 1 cột), ngày sinh là 6/9/1999
SELECT MaHS, CONCAT(Ho, ' ', Ten) as HoTen, NgaySinh
FROM DSHS
WHERe NgaySinh = '1999-9-6';

-- 4.	Hiện danh sách sinh viên: mã hs, họ và tên (là 1 cột), tên là NA
SELECT MaHS, CONCAT(Ho, ' ', Ten) as HoTen, NgaySinh
FROM DSHS
WHERe Ten = "Công";

-- 5.	Hiện danh sách sinh viên: mã hs, họ và tên (là 1 cột), tên bắt đầu bằng chữ N
SELECT MaHS, CONCAT(Ho, ' ', Ten) as HoTen, NgaySinh
FROM DSHS
WHERE Ten LIKE 'N%';

-- 6.	Hiện danh sách sinh viên: mã hs, họ và tên (là 1 cột), trong tên có NA
SELECT MaHS, CONCAT(Ho, ' ', Ten) as HoTen, NgaySinh
FROM DSHS
WHERE Ho LIKE '%NG%' OR Ten LIKE '%NG%';

-- 7.	Đếm số sinh viên tên bắt đầu bằng chữ N
SELECT COUNT(*) AS SoHocSinh
FROM DSHS
WHERE Ten LIKE 'N%';

-- 8.	Hiện danh sách sinh viên: họ và tên (là 1 cột), ngày sinh, tên lớp, tên GVCN.
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) as HoTen, d.NgaySinh, l.Lop, l.Gvcn
FROM DSHS d
JOIN LOP l 
ON d.Lop = l.Lop;

-- 9.	Hiện danh sách sinh viên: họ và tên (là 1 cột), ngày sinh, điểm trung bình, xếp loại
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) as HoTen, m.dtb, m.xeploai
FROM DSHS d
JOIN diem m
ON d.mahs = m.mahs;

-- 10.	Đếm số học sinh của mỗi lớp
SELECT Lop, COUNT(*) AS SoHocSinh
FROM DSHS
GROUP BY Lop;

-- 11.	Hiện ra lớp có số lượng sinh viên > 1
SELECT Lop, COUNT(MaHS) AS SoHocSinh
FROM DSHS
GROUP BY Lop 
HAVING SoHocSinh > 1;

-- 12.	Hiện thông lớp có số lượng sinh viên nhiều nhất
SELECT Lop, COUNT(*) AS SoHocSinh
FROM DSHS
GROUP BY Lop
HAVING SoHocSinh = (SELECT MAX(SoHocSinh) FROM (SELECT COUNT(*) AS SoHocSinh FROM DSHS GROUP BY Lop) AS Subquery)
ORDER BY SoHocSinh DESC;

-- 13.	Tìm học sinh có điểm lớn nhất
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) AS HoTen, m.DTB
FROM DSHS d
JOIN DIEM m
ON d.MaHS = m.MaHS
WHERE m.DTB = (SELECT MAX(DTB) FROM DIEM);

-- 14.	Hiện ra danh sách các học sinh có điểm tb > 8
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) AS HoTen, m.DTB
FROM DSHS d
JOIN DIEM m
ON d.MaHS = m.MaHS
WHERE m.DTB > 8;

-- 15.	Tổng điểm tb của các bạn có tên bắt đầu bằng chữ NA
SELECT d.Ten, SUM(m.DTB) AS TongDTB
FROM DSHS d
JOIN Diem m
ON d.MaHS = m.MaHS
WHERE d.Ten Like "N%"
GROUP By d.Ten;

-- 16.	Hiện ra danh sách các học sinh có điểm tb > 5 và điểm toán > 8
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) as HoTen, m.Toan, m.DTB
FROM DSHS d
JOIN DIEM m
ON d.MaHS = m.MaHs
WHERE m.DTB > 5 AND m.Toan > 8;

-- 17.	Hiện ra danh sách các học sinh có xếp loại là giỏi
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) as HoTen, m.XepLoai
FROM DSHS d
JOIN DIEM m
ON d.MaHS = m.MaHs
WHERE m.XepLoai = 'Giỏi';

-- 18.	Đếm số lượng học sinh giỏi
SELECT COUNT(*) AS SoLuongGioi
FROM DIEM
WHERE XepLoai = "Giỏi";

-- 19.	Đếm số lượng học sinh giỏi của từng lớp
SELECT d.Lop, COUNT(m.MaHS) AS SoLuongGioi
FROM DSHS d
LEFT JOIN DIEM m -- Lấy tất cả các lớp từ bảng DSHS
ON d.MaHS = m.MaHS
Where m.XepLoai = 'Giỏi'
GROUP BY d.Lop;

-- 20.	In ra các học sinh chưa tham gia thi
SELECT d.MaHS, CONCAT(d.Ho, ' ', d.Ten) AS HoTen
FROM DSHS d
LEFT JOIN DIEM m 
ON d.MaHS = m.MaHS
WHERE d.MaHS not in (select m.MaHS from DIEM group by MaHS);

-- 21.	In ra học sinh có điểm trung bình lớn nhất của từng lớp
SELECT d.Lop, CONCAT(d.Ho, ' ', d.Ten) AS HoTen, MAX(m.DTB) AS MaxDTB
FROM DSHS d
JOIN DIEM m
ON d.MaHS = m.MaHS
GROUP BY d.Lop, HoTen
ORDER BY MaxDTB ASC;

SELECT d.Lop, CONCAT(d.Ho, ' ', d.Ten) AS HoTen, MAX(m.DTB) AS MaxDTB
FROM DSHS d
JOIN DIEM m
ON d.MaHS = m.MaHS
WHERE m.DTB IN (
	SELECT MAX(m.DTB)
    FROM DIEM
    join dshs
    on diem.mahs = dshs.mahs
    Group by dshs.lop
 )
GROUP BY d.lop, HoTen
ORDER BY d.lop ASC
