﻿-- LE TIEN DUNG --- 
CREATE DATABASE QLSV2
CREATE TABLE SINHVIEN
(
	MSSV CHAR(6) PRIMARY KEY,
	TENSV VARCHAR(30) NOT NULL,
	SODT VARCHAR(10),
	LOP CHAR(6) NOT NULL,
	DIACHI CHAR(50) NOT NULL
)
GO
CREATE TABLE DETAI
(
	MSDT CHAR(6) PRIMARY KEY,
	TENDT VARCHAR(30) NOT NULL
)
GO
CREATE TABLE SV_DETAI 
(
	MSSV CHAR(6) NOT NULL, 
	MSDT CHAR(6) NOT NULL
	CONSTRAINT PK_SV_DETAI PRIMARY KEY (MSSV, MSDT) 
)
ALTER TABLE SV_DETAI ADD CONSTRAINT FK_MSSV FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV)
ALTER TABLE SV_DETAI ADD CONSTRAINT FK_MSDT FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
GO
CREATE TABLE HOCHAM
(
	MSHH SMALLINT PRIMARY KEY,
	TENHH VARCHAR(20)
)
GO
CREATE TABLE GIAO_VIEN 
(
MSGV SMALLINT PRIMARY KEY,
TENGV VARCHAR(30),
DIACHI VARCHAR(50),
SODTH VARCHAR(10),
MSHHAM SMALLINT ,
NAMHH SMALLDATETIME NOT NULL
)
ALTER TABLE GIAO_VIEN ADD CONSTRAINT FK_MSHHAM FOREIGN KEY (MSHHAM) REFERENCES HOCHAM(MSHH)
GO
CREATE TABLE HOCVI 
(
 MSHV SMALLINT PRIMARY KEY ,
 TENHV VARCHAR(10)
)
GO 
CREATE TABLE CHUYENNGANH 
(
	MSCN SMALLINT PRIMARY KEY,
	TENCN VARCHAR(30)

)
DROP TABLE CHUYENNGANH
GO 
CREATE TABLE GV_HV_CN
(
	MSGV SMALLINT NOT NULL,
	MSHV SMALLINT NOT NULL,
	MSCN SMALLINT NOT NULL,
	NAM SMALLDATETIME NOT NULL
	CONSTRAINT PK_GV_HV_CN PRIMARY KEY (MSGV,MSHV,MSCN)
)
ALTER TABLE GV_HV_CN ADD CONSTRAINT FK_MSGV FOREIGN KEY (MSGV) REFERENCES GIAO_VIEN (MSGV)
ALTER TABLE GV_HV_CN ADD CONSTRAINT FK_MSHV FOREIGN KEY (MSHV) REFERENCES HOCVI (MSHV)
ALTER TABLE GV_HV_CN ADD CONSTRAINT FK_MSCN FOREIGN KEY (MSCN) REFERENCES CHUYENNGANH (MSCN)
GO 
CREATE TABLE GV_HDDTN
(
	MSGV SMALLINT NOT NULL, 
	MSDT CHAR(6) NOT NULL,
	DIEM FLOAT NOT NULL,
	CONSTRAINT PK_GV_HDDTN PRIMARY KEY (MSGV,MSDT)
)
ALTER TABLE GV_HDDTN ADD CONSTRAINT FK_MSGV2 FOREIGN KEY (MSGV) REFERENCES GIAO_VIEN (MSGV)
ALTER TABLE GV_HDDTN ADD CONSTRAINT FK_MSDT2 FOREIGN KEY (MSDT) REFERENCES DETAI (MSDT)
GO
CREATE TABLE GV_PBDT
(
	MSGV SMALLINT NOT NULL,
	MSDT CHAR(6) NOT NULL,
	DIEM FLOAT NOT NULL,
	CONSTRAINT PK_GV_PBDT PRIMARY KEY (MSGV, MSDT) 
)
ALTER TABLE GV_PBDT ADD CONSTRAINT FK_MSGV3 FOREIGN KEY (MSGV) REFERENCES GIAO_VIEN (MSGV)
ALTER TABLE GV_PBDT ADD CONSTRAINT FK_MSDT3 FOREIGN KEY (MSDT) REFERENCES DETAI (MSDT)
GO
CREATE TABLE GV_UVDT 
(
	MSGV SMALLINT NOT NULL,
	MSDT CHAR(6) NOT NULL,
	DIEM FLOAT NOT NULL,
	CONSTRAINT PK_GV_UVDT PRIMARY KEY (MSGV,MSDT)
)
ALTER TABLE GV_UVDT ADD CONSTRAINT FK_MSGV4 FOREIGN KEY (MSGV) REFERENCES GIAO_VIEN (MSGV)
ALTER TABLE GV_UVDT ADD CONSTRAINT FK_MSDT4 FOREIGN KEY (MSDT) REFERENCES DETAI (MSDT)
GO 
CREATE TABLE HOIDONG
(
	MSHD SMALLINT PRIMARY KEY,
	PHONG SMALLINT ,
	TGBD SMALLDATETIME ,
	NGAYHD SMALLDATETIME NOT NULL,
	TINHTRANG VARCHAR(30) NOT NULL,
	MSGVCTHD SMALLINT 
)
GO 
CREATE TABLE HOIDONG_GV 
(
	MSHD SMALLINT NOT NULL,
	MSGV SMALLINT NOT NULL
	CONSTRAINT PK_HOIDONG_GV PRIMARY KEY (MSHD,MSGV)
)
ALTER TABLE HOIDONG_GV ADD CONSTRAINT FK_MSHD4 FOREIGN KEY (MSHD) REFERENCES HOIDONG (MSHD)
ALTER TABLE HOIDONG_GV ADD CONSTRAINT FK_MSGV5 FOREIGN KEY (MSGV) REFERENCES GIAO_VIEN (MSGV)
GO
CREATE TABLE HOIDONG_DT 
(
	MSHD SMALLINT NOT NULL,
	MSDT CHAR(6) NOT NULL,
	QUYETDINH CHAR(10) ,
	CONSTRAINT PK_HOIDONG_DT PRIMARY KEY (MSHD,MSDT)
)
ALTER TABLE HOIDONG_DT ADD CONSTRAINT FK_MSHD5 FOREIGN KEY (MSHD) REFERENCES HOIDONG (MSHD)
ALTER TABLE HOIDONG_DT  ADD CONSTRAINT FK_MSDT5 FOREIGN KEY (MSHD) REFERENCES HOIDONG (MSHD)
SET DATEFORMAT DMY

INSERT INTO SINHVIEN VALUES ('97TH91', 'Nguyễn Văn A','9688543', '97TH01', '12 NTMK' );
INSERT INTO SINHVIEN VALUES ('97TH02', 'Nguyễn Văn A','9688543', '97TH01', '12 NTMK' );
INSERT INTO SINHVIEN VALUES ('97TH03', 'Nguyễn Văn A','9688543', '97TH01', '12 NTMK' );
INSERT INTO SINHVIEN VALUES ('97TH04', 'Nguyễn Văn A','9688543', '97TH01', '12 NTMK' );
INSERT INTO SINHVIEN VALUES ('97TH05', 'Nguyễn Văn A','9688543', '97TH01', '12 NTMK' );
INSERT INTO SINHVIEN VALUES ('97TH06', 'Nguyễn Văn A','9688543', '97TH01', '12 NTMK' );

INSERT INTO DETAI VALUES ('97001', 'Quản lý thư viện');
INSERT INTO DETAI VALUES ('97002', 'Nhận dạng vân tay');
INSERT INTO DETAI VALUES ('97003', 'Bán đấu gía trên mạng');
INSERT INTO DETAI VALUES ('97004', 'Quản lí siêu thị');
INSERT INTO DETAI VALUES ('97005', 'Xử lí ảnh');

INSERT INTO SV_DETAI VALUES ('97TH01', '97004');
INSERT INTO SV_DETAI VALUES ('97TH02', '97005');
INSERT INTO SV_DETAI VALUES ('97TH03', '97001');
INSERT INTO SV_DETAI VALUES ('97TH04', '97002');
INSERT INTO SV_DETAI VALUES ('97TH05', '97003');
INSERT INTO SV_DETAI VALUES ('97TH06', '97005');

INSERT INTO HOCHAM VALUES ('1', 'Phó giáo sư');
INSERT INTO HOCHAM VALUES ('2', 'Giáo sư');

INSERT INTO GIAO_VIEN VALUES ('1', 'Trần Văn A', '11 NVĐ', '8754321', '1', '1996')
INSERT INTO GIAO_VIEN VALUES ('2', 'Trần Thu Trang', '56 XVNT', '8964334', '1', '1996')
INSERT INTO GIAO_VIEN VALUES ('3', 'Lê Trung', '11 NVĐ', '8903561', '1', '1996')
INSERT INTO GIAO_VIEN VALUES ('4', 'Nguyễn Thị Loan', '321 BTX', '8012864', '2', '1997')
INSERT INTO GIAO_VIEN VALUES ('5', 'Chu V Tien', '1/60 TVĐ', '8157906', '2', '1997')

INSERT INTO HOCVI VALUES ('1', 'KS');
INSERT INTO HOCVI VALUES ('2', 'CN');
INSERT INTO HOCVI VALUES ('3', 'Th.S');
INSERT INTO HOCVI VALUES ('4', 'TS');
INSERT INTO HOCVI VALUES ('5', 'TSKH');

INSERT INTO CHUYENNGANH VALUES ('1', 'Hệ Thống Thông Tin');
INSERT INTO CHUYENNGANH VALUES ('2', 'Mạng');
INSERT INTO CHUYENNGANH VALUES ('3', 'Đồ Họa');
INSERT INTO CHUYENNGANH VALUES ('4', 'Công Nghệ Phần Mềm');

INSERT INTO GV_HV_CN VALUES ('1', '1','1', '1999' );
INSERT INTO GV_HV_CN VALUES ('1', '1','2', '1999' );
INSERT INTO GV_HV_CN VALUES ('1', '2','1', '1998' );
INSERT INTO GV_HV_CN VALUES ('2', '3','2', '1997' );
INSERT INTO GV_HV_CN VALUES ('3', '2','4', '1997' );
INSERT INTO GV_HV_CN VALUES ('4', '3','2', '1996' );

INSERT INTO GV_HDDTN VALUES ('1', '97001','7');
INSERT INTO GV_HDDTN VALUES ('2', '97002','8');
--INSERT INTO GV_HDDTN VALUES ('5', '97330','9');
INSERT INTO GV_HDDTN VALUES ('4', '97004','8.5');
INSERT INTO GV_HDDTN VALUES ('3', '97005','7');

INSERT INTO GV_PBDT VALUES ('1', '97005','1');
INSERT INTO GV_PBDT VALUES ('2', '97001','7');
INSERT INTO GV_PBDT VALUES ('3', '97004','6');
INSERT INTO GV_PBDT VALUES ('4', '97003','8.5');
INSERT INTO GV_PBDT VALUES ('5', '97002','8');
INSERT INTO GV_PBDT VALUES ('6', '97006','9');

INSERT INTO GV_UVDT VALUES ('5', '97005','6');
INSERT INTO GV_UVDT VALUES ('2', '97005','5');
INSERT INTO GV_UVDT VALUES ('4', '97005','5');
INSERT INTO GV_UVDT VALUES ('3', '97001','7');
INSERT INTO GV_UVDT VALUES ('4', '97001','7');
INSERT INTO GV_UVDT VALUES ('5', '97001','8');
INSERT INTO GV_UVDT VALUES ('3', '97003','10');
INSERT INTO GV_UVDT VALUES ('1', '97003','7');
INSERT INTO GV_UVDT VALUES ('2', '97003','7');
INSERT INTO GV_UVDT VALUES ('1', '97004','8');
INSERT INTO GV_UVDT VALUES ('2', '97004','9');
INSERT INTO GV_UVDT VALUES ('3', '97004','5');
INSERT INTO GV_UVDT VALUES ('1', '97002','9');
INSERT INTO GV_UVDT VALUES ('4', '97002','9');
INSERT INTO GV_UVDT VALUES ('5', '97002','6');
INSERT INTO GV_UVDT VALUES ('1', '97006','7');
INSERT INTO GV_UVDT VALUES ('2', '97006','7');
INSERT INTO GV_UVDT VALUES ('4', '97006','7');
--
INSERT INTO HOIDONG VALUES ('1', '002', '7:00', '30/10/2001 ', 'Thật', '1')
INSERT INTO HOIDONG VALUES ('2', '102', '7:00', '30/10/2001', 'Thử', '2')
INSERT INTO HOIDONG VALUES ('3', '003', '8:00', '31/10/2001','' , '3')

INSERT INTO HOIDONG_GV VALUES ('1', '1');
INSERT INTO HOIDONG_GV VALUES ('1', '2');
INSERT INTO HOIDONG_GV VALUES ('1', '3');
INSERT INTO HOIDONG_GV VALUES ('1', '4');
INSERT INTO HOIDONG_GV VALUES ('2', '3');
INSERT INTO HOIDONG_GV VALUES ('2', '2');
INSERT INTO HOIDONG_GV VALUES ('2', '5');
INSERT INTO HOIDONG_GV VALUES ('2', '4');
INSERT INTO HOIDONG_GV VALUES ('3', '1');
INSERT INTO HOIDONG_GV VALUES ('3', '2');
INSERT INTO HOIDONG_GV VALUES ('3', '3');
INSERT INTO HOIDONG_GV VALUES ('3', '4');
INSERT INTO HOIDONG_GV VALUES ('4', '3');
INSERT INTO HOIDONG_GV VALUES ('4', '2');
INSERT INTO HOIDONG_GV VALUES ('4', '5');
INSERT INTO HOIDONG_GV VALUES ('4', '4');

INSERT INTO HOIDONG_DT VALUES ('1', '97001','Được');
INSERT INTO HOIDONG_DT VALUES ('1', '97002','Được');
INSERT INTO HOIDONG_DT VALUES ('2', '97003','Không');
INSERT INTO HOIDONG_DT VALUES ('2', '97004','Không');
INSERT INTO HOIDONG_DT VALUES ('1', '97005','Được');
INSERT INTO HOIDONG_DT VALUES ('3', '97001','Không');
INSERT INTO HOIDONG_DT VALUES ('3', '97002','Được');
INSERT INTO HOIDONG_DT VALUES ('3', '97004','Không');
INSERT INTO HOIDONG_DT VALUES ('4', '97003','Không');
INSERT INTO HOIDONG_DT VALUES ('4', '97005','Không');
INSERT INTO HOIDONG_DT VALUES ('4', '97006','Được');

--
A. STORED PROCEDUREDS VỚI THAM SỐ VÀO

-- 1. Tham số đưa vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHH. Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table HOCHAM chưa, nếu chưa trả ra giá trị 0.

CREATE PROC SP_CAU1_QLSV
(
	@MSGV SMALLINT, 
	@TENGV VARCHAR(30),
	@SODTH VARCHAR(10),
	@DIACHI VARCHAR(50), 
	@MSHH SMALLINT,
	@NAMHH SMALLDATETIME
) 
AS
IF EXISTS (SELECT MSHH FROM HOCHAM WHERE MSHH =@MSHH)
BEGIN
	INSERT INTO GIAO_VIEN VALUES (@MSGV, @TENGV, @DIACHI, @SODTH, @MSHH, @NAMHH)
	PRINT 'BAN DA THEM DU LIEU THANH CONG'
END
ELSE
	PRINT 'MA HOC HAM KHONG TON TAI TRONG BANG HOC  HAM'
-- THUC THI
EXEC SP_CAU1_QLSV '10', 'LE THI QUYNH NHU', '11/3 SUOI SON', '8912367', '1', '1976'


-- 2. Tham số đưa vào là MSGV, TENGV, SODT, DIACHI, MSHH, NAMHΗ Trước khi chèn dữ liệu cần kiểm tra MSGV có trùng không, nếu trùng trả về giá trị 0.

CREATE PROC SP_CAU2_QLSV
(
	@MSGV SMALLINT, 
	@TENGV VARCHAR(30),
	@SODTH VARCHAR(10),
	@DIACHI VARCHAR(50), 
	@MSHH SMALLINT,
	@NAMHH SMALLDATETIME
) 
AS
IF NOT EXISTS (SELECT MSGV FROM GIAO_VIEN WHERE MSGV =@MSGV)
BEGIN
	INSERT INTO GIAO_VIEN VALUES (@MSGV, @TENGV, @DIACHI, @SODTH, @MSHH, @NAMHH)
	PRINT 'BAN DA THEM DU LIEU THANH CONG'
END
ELSE
	PRINT 'MA GIAO VIEN DA TRUNG'
-- THUC THI
EXEC SP_CAU2_QLSV '11', 'LE THI QUYNH NHU', '11/3 SUOI SON', '8912367', '1', '1997'

-- 3. Giống câu 1 & 2, là kiểm tra xem MSGV có trùng không. MSHH tổn tại chưa Nếu MSGV trùng trả về 0. Nếu MSHH chưa tồn tại trả về 1, ngược lại cho insert dữ liệu.

ALTER PROC SP_CAU3_QLSV
(
	@MSGV SMALLINT, 
	@TENGV VARCHAR(30),
	@SODTH VARCHAR(10),
	@DIACHI VARCHAR(50), 
	@MSHH SMALLINT,
	@NAMHH SMALLDATETIME
) 
AS
IF NOT EXISTS (SELECT MSGV FROM GIAO_VIEN WHERE MSGV = @MSGV)
BEGIN
	IF EXISTS (SELECT MSHH FROM HOCHAM WHERE MSHH =@MSHH)
	BEGIN
		INSERT INTO GIAO_VIEN VALUES (@MSGV, @TENGV, @DIACHI, @SODTH, @MSHH, @NAMHH)
		RETURN 1
	END
	ELSE 
	BEGIN
		PRINT 'MA HOC HAM KHONG TON TAI TRONG BANG HOC HAM'
	END
END
ELSE
	PRINT 'MSGV TRUNG'
	RETURN 0
EXECUTE SP_CAU3_QLSV '11', 'LE THI QUYNH NHU', '11/3 SUOI SON', '8912367', '1', '1997'

-- 4. Đưa vào MSDT cũ, TENDETAI mới Hãy cập nhật TENDETAI mới với MSDT cũ không đổi nếu không tìm thấy trả về 0 ngược lại cập nhật và trà về 1.
CREATE PROC SP_CAU4_QLSV
(
	@MSDT CHAR(6),
	@TENDT_MOI VARCHAR(30)
)
AS
	IF EXISTS (SELECT MSDT FROM DETAI WHERE MSDT = @MSDT)
	BEGIN
		UPDATE DETAI
		SET TENDT = @TENDT_MOI
		WHERE MSDT = @MSDT
		PRINT 'CAP NHAT THANH CONG'
		RETURN 1
	END
	ELSE
		PRINT 'BAN CAP NHAT KHONG THANH CONG'
		RETURN 0
EXECUTE SP_CAU4_QLSV '97002', 'NHAN DANG KHUON MAT'

-- 5. Tham số đưa vào MSSV, TENSV mới, DIACHI mới Thủ tục dùng để cập nhật sinh viên trên. Nếu không tìm thấy trả về 0, ngược lại cập nhật và trả về 1.

CREATE PROC SP_CAU5_QLSV
(
	@MSSV CHAR(6), 
	@TENSV VARCHAR(30),
	@DIACHI CHAR(50)
)
AS
IF EXISTS (SELECT MSSV, TENSV, DIACHI FROM SINHVIEN WHERE MSSV = @MSSV AND TENSV = @TENSV AND DIACHI = @DIACHI) 
BEGIN
	RETURN 1
END
RETURN 0

-- 6. Đưa vào MSDT hãy chuyển đổi sao cho với đề tài đó GVHD -> GVPB. GVPB -> GVHD. Nếu không tìm thấy trả về giá trị 0.
ALTER PROC SP_CAU6_QLSV (@MSDT CHAR(6))
AS
DECLARE @GVHD SMALLINT, @GVPB SMALLINT 
SET @GVHD = (SELECT MSGV FROM GV_HDDTN WHERE MSDT=@MSDT)
SET @GVPB = (SELECT MSGV FROM GV_PBDT WHERE MSDT=@MSDT)

UPDATE GV_HDDTN
SET MSGV = @GVHD
WHERE MSDT = @MSDT

UPDATE GV_PBDT
SET MSGV= @GVPB
WHERE MSDT =@MSDT

EXEC SP_CAU6_QLSV '97002'

-- cau 1 nhap vao mssv, hay cho biet thong tin cua sinh vien do
ALTER PROC NEW_SP_CAU1_QLSV
(
	@MSSV CHAR(6)
)
AS
BEGIN
	IF EXISTS (SELECT MSSV FROM SINHVIEN WHERE MSSV = @MSSV)
BEGIN
	DECLARE @TENSV NVARCHAR(255)
	DECLARE @SODT NVARCHAR(20)
	DECLARE @LOP NVARCHAR(255)
	DECLARE @DIACHI NVARCHAR(255)

	SELECT @TENSV = TENSV, @SODT = SODT, @LOP = LOP, @DIACHI = DIACHI
	FROM SINHVIEN
	WHERE MSSV = @MSSV

	PRINT 'TEN SV: ' + @TENSV
	PRINT 'SODT: ' + @SODT
	PRINT 'LOP: ' + @LOP
	PRINT 'DIACHI: ' + @DIACHI
END
	ELSE 
	PRINT 'KHONG THAY MA SO SINH VIEN'
END
EXECUTE NEW_SP_CAU1_QLSV '123'

-- cau 2 nhap vao ma so sinh vien, cho biet ten de tai sinh vien tham gia 
ALTER PROC NEW_SP_CAU2_QLSV
(
	@MSSV CHAR(6)
)
AS
BEGIN
	DECLARE @TENDT VARCHAR(30)
	SET @TENDT = (SELECT DETAI.TENDT FROM DETAI INNER JOIN SV_DETAI ON DETAI.MSDT = SV_DETAI.MSDT WHERE SV_DETAI.MSSV = @MSSV)
	PRINT @TENDT
END
EXECUTE NEW_SP_CAU2_QLSV '97TH02'

CREATE PROC CAU3
( @MSGV SMALLINT)
AS
BEGIN
	DECLARE @MSDT CHAR(6)
	SET @MSDT = (SELECT MSDT FROM GV_HDDT WHERE MSGV = @MSGV)
	SELECT * FROM DETAI WHERE MADT = @MSDT
END
EXEC CAU3 '3'
--nhập vào MSGV, cho biết thông tin đề tài giảng viên phản biện
CREATE PROC CAU4
(@MSGV SMALLINT)
AS
BEGIN
	DECLARE @MSDT CHAR(6)
	SET @MSDT = (SELECT MSDT FROM GV_PBDT WHERE MSGV = @MSGV)
	SELECT * FROM DETAI WHERE MADT = @MSDT
END
EXEC CAU4 '3'

7. Đưa vào TENGV, TENSV. Hãy6y chuyển để tài của sinh viên đó cho giáo viên mới hướng dẫn với TENGV là tham số vào. Nếu không tìm thấy, hoặc tìm thấy nhưng không duy nhất thì trả về 0, 1.

8. Đưa vào TENSV nếu không vi phạm ràng buộc toàn vẹn về khóa ngoại thì xóa. Ngược lại trả về 0.

B. STORED PROCEDUREDS VỚI THAM SỐ VÀO VÀ RA

1. Đưa vào TENHV Trả ra : Số GV thỏa học vị, nếu không tìm thấy trả về 0

2. Đưa vào MSDT Cho biết: Điểm trung bình của đề tài, nếu không tìm thấy trả về 0

3. Đưa vào TENGV Trả ra : Số điện thoại của giáo viên, nếu không tìm thấy trả về 0

4. Đưa vào MSHD Trả ra : tên chủ tịch hội đồng và số điện thoại, nếu không tìm thấy trả về 0

5. Đưa vào TENHV Cho biết : Số đề tài hướng dẫn, số đề tài phản biện do giáo viên đó phụ trách