DROP DATABASE IF EXISTS forest_resources_manage_application;
CREATE DATABASE forest_resources_manage_application;
USE forest_resources_manage_application;

-- -----------------------------------------------------
-- Table `administrative_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `administrative_levels`;
CREATE TABLE `administrative_levels` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL UNIQUE COMMENT 'tên các cấp độ hành chính',
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'cấp độ hành chính' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of `administrative_levels`
-- ----------------------------
INSERT INTO `administrative_levels`(`id`,`name`)
VALUES (1,'tỉnh'),
(2,'thành phố'),
(3,'huyện'),
(4,'phường'),
(5,'thị trấn'),
(6,'xã');


-- -----------------------------------------------------
-- Table `administratives`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `administratives`;
CREATE TABLE `administratives` (
    `code` VARCHAR(20) NOT NULL,
    `name` VARCHAR(100) NOT NULL UNIQUE,
    `subordinate` VARCHAR(20) NULL COMMENT 'trực thuộc',
    `id_administrative_level` INT NOT NULL,
    PRIMARY KEY (`code`),
    FOREIGN KEY (`id_administrative_level`)
        REFERENCES `administrative_levels` (`id`)
)  ENGINE=INNODB CHARACTER SET=UTF8MB4 COLLATE = UTF8MB4_BIN COMMENT='hành chính';

-- ----------------------------
-- Records of `administratives`
-- ----------------------------
INSERT INTO `administratives`(`code`,`name`,`subordinate`,`id_administrative_level`)
VALUES ('35','Hà Nam',NULL,1),

	 ('347','Phủ Lý','35',2),
	 ('349','Duy Tiên','35',3),
	 ('350','Kim Bảng','35',3),
	 ('351','Thanh Liêm','35',3),
	 ('352','Bình Lục','35',3),
	 ('353','Lý Nhân','35',3),
     
     ('13306','Phù Vân','347',6),
     ('13309','Liêm Chính','347',4),
	 ('13312','Liêm Chung','347',6),
	 ('13315','Thanh Châu','347',4),
	 ('13318','Châu Sơn','347',4),
	 ('13366','Tiên Tân','347',6),
	 ('13372','Tiên Hiệp','347',6),
	 ('13381','Tiên Hải','347',6),
	 ('13426','Kim Bình','347',6),
	 ('13444','Liêm Tuyền','347',6),
	 ('13447','Liêm Tiết','347',6),
	 ('13459','Thanh Tuyền','347',4),
	 ('13507','Đinh Xá','347',6),
	 ('13513','Trịnh Xá','347',6),
	 ('13321','Đồng Văn','349',4),
	 ('13324','Hòa Mạc','349',4),
	 ('13327','Mộc Bắc','349',6),
	 ('13330','Châu Giang','349',4),
	 ('13333','Bạch Thượng','349',4),
	 ('13336','Duy Minh','349',4),
	 ('13339','Mộc Nam','349',6),
	 ('13342','Duy Hải','349',4),
	 ('13345','Chuyên Ngoại','349',6),
	 ('13348','Yên Bắc','349',4),
	 ('13351','Trác Văn','349',6),
	 ('13354','Tiên Nội','349',4),
	 ('13357','Hoàng Đông','349',4),
	 ('13360','Yên Nam','349',6),
	 ('13363','Tiên Ngoại','349',6),
	 ('13369','Tiên Sơn','349',6),
	 ('13384','Quế','350',5),
	 ('13387','Nguyễn Úy','350',6),
	 ('13390','Đại Cương','350',6),
	 ('13393','Lê Hồ','350',6),
	 ('13396','Tượng Lĩnh','350',6),
	 ('13399','Nhật Tựu','350',6),
	 ('13402','Nhật Tân','350',6),
	 ('13405','Đồng Hóa','350',6),
	 ('13408','Hoàng Tây','350',6),
	 ('13411','Tân Sơn','350',6),
	 ('13414','Thụy Lôi','350',6),
	 ('13417','Văn Xá','350',6),
	 ('13420','Khả Phong','350',6),
	 ('13423','Ngọc Sơn','350',6),
	 ('13429','Ba Sao','350',5),
	 ('13432','Liên Sơn','350',6),
	 ('13435','Thi Sơn','350',6),
	 ('13438','Thanh Sơn','350',6),
	 ('13441','Kiện Khê','351',5),
	 ('13450','Liêm Phong','351',6),
	 ('13453','Thanh Hà','351',6),
	 ('13456','Liêm Cần','351',6),
	 ('13465','Liêm Thuận','351',6),
	 ('13468','Thanh Thủy','351',6),
	 ('13471','Thanh Phong','351',6),
	 ('13474','Tân Thanh','351',5),
	 ('13477','Thanh Tân','351',6),
	 ('13480','Liêm Túc','351',6),
	 ('13483','Liêm Sơn','351',6),
	 ('13486','Thanh Hương','351',6),
	 ('13489','Thanh Nghị','351',6),
	 ('13492','Thanh Tâm','351',6),
	 ('13495','Thanh Nguyên','351',6),
	 ('13498','Thanh Hải','351',6),
	 ('13501','Bình Mỹ','352',5),
	 ('13504','Bình Nghĩa','352',6),
	 ('13510','Tràng An','352',6),
	 ('13516','Đồng Du','352',6),
	 ('13519','Ngọc Lũ','352',6),
	 ('13522','Hưng Công','352',6),
	 ('13525','Đồn Xá','352',6),
	 ('13528','An Ninh','352',6),
	 ('13531','Bồ Đề','352',6),
	 ('13534','Bối Cầu','352',6),
	 ('13540','An Nội','352',6),
	 ('13543','Vũ Bản','352',6),
	 ('13546','Trung Lương','352',6),
	 ('13552','An Đổ','352',6),
	 ('13555','La Sơn','352',6),
	 ('13558','Tiêu Động','352',6),
	 ('13561','An Lão','352',6),
	 ('13567','Hợp Lý','353',6),
	 ('13570','Nguyên Lý','353',6),
	 ('13573','Chính Lý','353',6),
	 ('13576','Chân Lý','353',6),
	 ('13579','Đạo Lý','353',6),
	 ('13582','Công Lý','353',6),
	 ('13585','Văn Lý','353',6),
	 ('13588','Bắc Lý','353',6),
	 ('13591','Đức Lý','353',6),
	 ('13594','Trần Hưng Đạo','353',6),
	 ('13597','Vĩnh Trụ','353',5),
	 ('13600','Nhân Thịnh','353',6),
	 ('13606','Nhân Khang','353',6),
	 ('13609','Nhân Mỹ','353',6),
	 ('13612','Nhân Nghĩa','353',6),
	 ('13615','Nhân Chính','353',6),
	 ('13618','Nhân Bình','353',6),
	 ('13621','Phú Phúc','353',6),
	 ('13624','Xuân Khê','353',6),
	 ('13627','Tiến Thắng','353',6),
	 ('13630','Hòa Hậu','353',6);

	 


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
    `username` VARCHAR(100) NOT NULL,
    `password` VARCHAR(200) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `avatar` VARCHAR(150) NULL COMMENT 'ảnh đại diện',
    `birth_date` DATE NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `is_active` INT NOT NULL DEFAULT 1 COMMENT 'Trạng thái tài khoản : hoạt động = 1 , không hoạt động = 0 ',
    `role` VARCHAR(50) NOT NULL COMMENT 'Vai trò : admin , user',
    `administrative_code` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`username`),
    FOREIGN KEY (`administrative_code`)
        REFERENCES `administratives`(`code`)
)  ENGINE=INNODB CHARACTER SET=UTF8MB4 COLLATE = UTF8MB4_BIN COMMENT='người dùng';

-- ----------------------------
-- Records of `users`
-- ----------------------------
INSERT INTO `users` (`username`,`password`,`first_name`,`last_name`,`avatar`,`birth_date`,`address`,`is_active`,`role`,`administrative_code`)
VALUES ('admin','1','admin','admin','','2003-1-1','',1,'admin','35'),

('a','1','Nguyễn','A','','2003-1-1','',1,'user','347'),
('b','1','Nguyễn','B','','2003-1-1','',1,'user','347'),
('c','1','Nguyễn','C','','2003-1-1','',1,'user','347'),
('d','1','Nguyễn','D','','2003-1-1','',1,'user','347'),
('e','1','Nguyễn','E','','2003-1-1','',1,'user','347'),
('f','1','Nguyễn','F','','2003-1-1','',1,'user','347'),

('huy','1','Như','Huy','','2003-1-1','Bắc Ninh',1,'user','13306'),
('khang','1','Danh','Khang','','2003-1-1','Hà Nam',1,'user','13306'),
('hminh','1','Hiếu','Minh','','2003-1-1','Hà Nam',1,'user','13306'),
('truong','1','Đức','Trường','','2003-1-1','Hà Nam',1,'user','13306'),
('lminh','1','Lê','Minh','','2003-1-1','Hải Dương',1,'user','13306');
