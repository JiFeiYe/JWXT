/*
 Navicat Premium Data Transfer

 Source Server         : LL
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : jwxt

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 25/12/2023 21:30:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `classID` int(11) NOT NULL COMMENT '班号',
  `majorID` int(11) NULL DEFAULT NULL COMMENT '专业号',
  PRIMARY KEY (`classID`) USING BTREE,
  INDEX `fk_class_major`(`majorID`) USING BTREE,
  CONSTRAINT `fk_class_major` FOREIGN KEY (`majorID`) REFERENCES `major` (`majorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, 1);
INSERT INTO `class` VALUES (17, 2);
INSERT INTO `class` VALUES (10, 3);
INSERT INTO `class` VALUES (15, 3);
INSERT INTO `class` VALUES (19, 3);
INSERT INTO `class` VALUES (16, 4);
INSERT INTO `class` VALUES (2, 5);
INSERT INTO `class` VALUES (5, 5);
INSERT INTO `class` VALUES (11, 5);
INSERT INTO `class` VALUES (14, 5);
INSERT INTO `class` VALUES (20, 5);
INSERT INTO `class` VALUES (6, 6);
INSERT INTO `class` VALUES (7, 6);
INSERT INTO `class` VALUES (8, 6);
INSERT INTO `class` VALUES (13, 6);
INSERT INTO `class` VALUES (3, 7);
INSERT INTO `class` VALUES (4, 8);
INSERT INTO `class` VALUES (9, 8);
INSERT INTO `class` VALUES (12, 8);
INSERT INTO `class` VALUES (18, 8);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseID` int(11) NOT NULL COMMENT '课程号',
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `hours` int(11) NOT NULL COMMENT '学时',
  `credit` float NOT NULL COMMENT '学分',
  `teachID` int(11) NULL DEFAULT NULL COMMENT '职工号',
  PRIMARY KEY (`courseID`) USING BTREE,
  INDEX `fk_course_teacher`(`teachID`) USING BTREE,
  CONSTRAINT `fk_course_teacher` FOREIGN KEY (`teachID`) REFERENCES `teacher` (`teachID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '现代汉语', 90, 2.79, 20211110);
INSERT INTO `course` VALUES (2, '政治学原理', 90, 2.32, 20211117);
INSERT INTO `course` VALUES (3, '公共关系与媒体沟通', 90, 3.59, 20211119);
INSERT INTO `course` VALUES (4, '计算机图形学', 90, 1.06, 20211125);
INSERT INTO `course` VALUES (5, '经济计量学', 90, 3.63, 20211128);
INSERT INTO `course` VALUES (6, '篮球技术与战术', 90, 3.7, 20211122);
INSERT INTO `course` VALUES (7, '人工智能算法与应用', 90, 3.55, 20211113);
INSERT INTO `course` VALUES (8, '足球技术与战术', 90, 4.23, 20211121);
INSERT INTO `course` VALUES (9, '数据通信与网络安全', 90, 1.73, 20211115);
INSERT INTO `course` VALUES (10, '数据挖掘与分析', 90, 2.74, 20211111);
INSERT INTO `course` VALUES (11, '文化与社会变迁', 90, 3.41, 20211122);
INSERT INTO `course` VALUES (12, '统计学基础', 90, 4.07, 20211115);
INSERT INTO `course` VALUES (13, '大数据技术与应用', 90, 2.65, 20211113);
INSERT INTO `course` VALUES (14, '算法设计与分析', 90, 4.38, 20211118);
INSERT INTO `course` VALUES (15, '微积分', 90, 3.1, 20211120);
INSERT INTO `course` VALUES (16, '虚拟现实与增强现实', 90, 3.85, 20211117);
INSERT INTO `course` VALUES (17, '逻辑学基础', 90, 2.84, 20211128);
INSERT INTO `course` VALUES (18, '企业管理与领导力', 90, 2.7, 20211123);
INSERT INTO `course` VALUES (19, '发展心理学', 90, 3.83, 20211126);
INSERT INTO `course` VALUES (20, '微观经济学', 90, 3.51, 20211124);
INSERT INTO `course` VALUES (21, '金融投资与风险管理', 90, 2.28, 20211122);
INSERT INTO `course` VALUES (22, '政治学概论', 90, 4.14, 20211126);
INSERT INTO `course` VALUES (23, '离散数学', 90, 1.14, 20211123);
INSERT INTO `course` VALUES (24, '中国现当代文学', 90, 4.37, 20211115);
INSERT INTO `course` VALUES (25, '操作系统原理', 90, 1.64, 20211119);
INSERT INTO `course` VALUES (26, '健康教育与促进', 90, 1.69, 20211118);
INSERT INTO `course` VALUES (27, '历史文化与社会变迁', 90, 2.72, 20211117);
INSERT INTO `course` VALUES (28, '经济学与社会发展', 90, 3.92, 20211112);
INSERT INTO `course` VALUES (29, '编程语言原理', 90, 3.27, 20211112);
INSERT INTO `course` VALUES (30, '企业创新与创业', 90, 2.65, 20211115);
INSERT INTO `course` VALUES (31, '运动生理学', 90, 1.37, 20211120);
INSERT INTO `course` VALUES (32, '线性代数', 90, 4.41, 20211111);
INSERT INTO `course` VALUES (33, '数字信号处理', 90, 3.76, 20211123);
INSERT INTO `course` VALUES (34, '人格心理学', 90, 3.36, 20211119);
INSERT INTO `course` VALUES (35, '社会心理学研究方法', 90, 2.85, 20211112);
INSERT INTO `course` VALUES (36, '社会学原理', 90, 4.23, 20211126);
INSERT INTO `course` VALUES (37, '市场营销策划', 90, 1.33, 20211116);
INSERT INTO `course` VALUES (38, '色彩与造型设计', 90, 2.58, 20211110);
INSERT INTO `course` VALUES (39, '计算机网络', 90, 2.08, 20211124);
INSERT INTO `course` VALUES (40, '音乐欣赏与鉴赏', 90, 3.07, 20211124);
INSERT INTO `course` VALUES (41, '社会体育', 90, 2.54, 20211127);
INSERT INTO `course` VALUES (42, '国际商务与跨文化管理', 90, 2.33, 20211125);
INSERT INTO `course` VALUES (43, '西方文学导论', 90, 3.27, 20211115);
INSERT INTO `course` VALUES (44, '文化与传媒经济学', 90, 2.83, 20211122);
INSERT INTO `course` VALUES (45, '社会学理论', 90, 1.23, 20211128);
INSERT INTO `course` VALUES (46, '社交心理学', 90, 1.05, 20211116);
INSERT INTO `course` VALUES (47, '中国哲学史', 90, 1.08, 20211128);
INSERT INTO `course` VALUES (48, '摄影与视觉表达', 90, 4.35, 20211123);
INSERT INTO `course` VALUES (49, '物联网技术与应用', 90, 2.42, 20211125);
INSERT INTO `course` VALUES (50, '乒乓球技术与战术', 90, 2.04, 20211112);
INSERT INTO `course` VALUES (51, '社会心理学', 90, 2.34, 20211120);
INSERT INTO `course` VALUES (52, '公共关系学', 90, 1.7, 20211127);
INSERT INTO `course` VALUES (53, '写作与沟通技巧', 90, 4.03, 20211111);
INSERT INTO `course` VALUES (54, '艺术史与文化批评', 90, 1.27, 20211128);
INSERT INTO `course` VALUES (55, '计算机科学导论', 90, 3.14, 20211122);
INSERT INTO `course` VALUES (56, '市场调查与数据分析', 90, 2.62, 20211113);
INSERT INTO `course` VALUES (57, '网络与通信技术', 90, 4.13, 20211117);
INSERT INTO `course` VALUES (58, '市场营销策略', 90, 1.66, 20211120);
INSERT INTO `course` VALUES (59, '社会调查与数据分析', 90, 1.49, 20211129);
INSERT INTO `course` VALUES (60, '供应链管理与物流', 90, 2.88, 20211110);
INSERT INTO `course` VALUES (61, '社会调查方法与数据分析', 90, 4.3, 20211120);
INSERT INTO `course` VALUES (62, '体育与健康', 90, 3.28, 20211123);
INSERT INTO `course` VALUES (63, '经济学原理', 90, 1.2, 20211125);
INSERT INTO `course` VALUES (64, '财务会计原理', 90, 3.73, 20211113);
INSERT INTO `course` VALUES (65, '社会心理学前沿研究', 90, 2.4, 20211128);
INSERT INTO `course` VALUES (66, '数据库设计与管理', 90, 1.69, 20211120);
INSERT INTO `course` VALUES (67, '消费者行为学', 90, 3.54, 20211110);
INSERT INTO `course` VALUES (68, '心理学导论', 90, 2.11, 20211124);
INSERT INTO `course` VALUES (69, '软件测试与质量保证', 90, 3.8, 20211119);
INSERT INTO `course` VALUES (70, '体育心理学', 90, 1.01, 20211118);
INSERT INTO `course` VALUES (71, '机器学习与模式识别', 90, 2.42, 20211112);
INSERT INTO `course` VALUES (72, '财务管理', 90, 3.84, 20211119);
INSERT INTO `course` VALUES (73, '传媒与社会', 90, 2.11, 20211116);
INSERT INTO `course` VALUES (74, '国际关系学', 90, 2.49, 20211127);
INSERT INTO `course` VALUES (75, '社会变迁与社会问题', 90, 2.93, 20211111);
INSERT INTO `course` VALUES (76, '组织行为学', 90, 1.62, 20211112);
INSERT INTO `course` VALUES (77, '素描与绘画基础', 90, 1.42, 20211128);
INSERT INTO `course` VALUES (78, '排球技术与战术', 90, 3.36, 20211112);
INSERT INTO `course` VALUES (79, '数据库系统设计', 90, 4, 20211111);
INSERT INTO `course` VALUES (80, '国际贸易与经济法', 90, 2.51, 20211110);
INSERT INTO `course` VALUES (81, '软件工程原理', 90, 1.53, 20211123);
INSERT INTO `course` VALUES (82, '口才与演讲技巧', 90, 3.15, 20211112);
INSERT INTO `course` VALUES (83, '项目管理与实践', 90, 1.31, 20211113);
INSERT INTO `course` VALUES (84, '市场营销管理', 90, 3.92, 20211119);
INSERT INTO `course` VALUES (85, '西方哲学史', 90, 1.33, 20211114);
INSERT INTO `course` VALUES (86, '员工招聘与选拔', 90, 2.36, 20211121);
INSERT INTO `course` VALUES (87, '人工智能基础', 90, 1.94, 20211110);
INSERT INTO `course` VALUES (88, '移动应用开发', 90, 3.67, 20211126);
INSERT INTO `course` VALUES (89, '政府与公共事务管理', 90, 4.2, 20211125);
INSERT INTO `course` VALUES (90, '伦理学原理', 90, 3.78, 20211120);
INSERT INTO `course` VALUES (91, '人力资源开发与培训', 90, 1.45, 20211110);
INSERT INTO `course` VALUES (92, '人机交互设计', 90, 1.86, 20211124);
INSERT INTO `course` VALUES (93, '国际商务实务', 90, 1.65, 20211120);
INSERT INTO `course` VALUES (94, '人力资源管理', 90, 4.28, 20211118);
INSERT INTO `course` VALUES (95, '心理测量与评估', 90, 2.49, 20211118);
INSERT INTO `course` VALUES (96, '数据结构与算法', 90, 3.29, 20211113);
INSERT INTO `course` VALUES (97, '金融市场与投资分析', 90, 3.24, 20211115);
INSERT INTO `course` VALUES (98, '电影与电视制作', 90, 2.35, 20211118);
INSERT INTO `course` VALUES (99, '文化与传媒理论', 90, 2.99, 20211114);
INSERT INTO `course` VALUES (100, '公司财务与财务决策', 90, 2.01, 20211123);

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id` int(11) NOT NULL,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL COMMENT '学生1，老师2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (0, 'root', 'Mm123456', 3);
INSERT INTO `login` VALUES (1, '20210000', 'Mm123456', 1);
INSERT INTO `login` VALUES (2, '20210001', 'Mm123456', 1);
INSERT INTO `login` VALUES (3, '20210002', 'Mm123456', 1);
INSERT INTO `login` VALUES (4, '20210003', 'Mm123456', 1);
INSERT INTO `login` VALUES (5, '20210004', 'Mm123456', 1);
INSERT INTO `login` VALUES (6, '20210005', 'Mm123456', 1);
INSERT INTO `login` VALUES (7, '20210006', 'Mm123456', 1);
INSERT INTO `login` VALUES (8, '20210007', 'Mm123456', 1);
INSERT INTO `login` VALUES (9, '20210008', 'Mm123456', 1);
INSERT INTO `login` VALUES (10, '20210009', 'Mm123456', 1);
INSERT INTO `login` VALUES (11, '20210010', 'Mm123456', 1);
INSERT INTO `login` VALUES (12, '20210011', 'Mm123456', 1);
INSERT INTO `login` VALUES (13, '20210012', 'Mm123456', 1);
INSERT INTO `login` VALUES (14, '20210013', 'Mm123456', 1);
INSERT INTO `login` VALUES (15, '20210014', 'Mm123456', 1);
INSERT INTO `login` VALUES (16, '20210015', 'Mm123456', 1);
INSERT INTO `login` VALUES (17, '20210016', 'Mm123456', 1);
INSERT INTO `login` VALUES (18, '20210017', 'Mm123456', 1);
INSERT INTO `login` VALUES (19, '20210018', 'Mm123456', 1);
INSERT INTO `login` VALUES (20, '20210019', 'Mm123456', 1);
INSERT INTO `login` VALUES (21, '20210020', 'Mm123456', 1);
INSERT INTO `login` VALUES (22, '20210021', 'Mm123456', 1);
INSERT INTO `login` VALUES (23, '20210022', 'Mm123456', 1);
INSERT INTO `login` VALUES (24, '20210023', 'Mm123456', 1);
INSERT INTO `login` VALUES (25, '20210024', 'Mm123456', 1);
INSERT INTO `login` VALUES (26, '20210025', 'Mm123456', 1);
INSERT INTO `login` VALUES (27, '20210026', 'Mm123456', 1);
INSERT INTO `login` VALUES (28, '20210027', 'Mm123456', 1);
INSERT INTO `login` VALUES (29, '20210028', 'Mm123456', 1);
INSERT INTO `login` VALUES (30, '20210029', 'Mm123456', 1);
INSERT INTO `login` VALUES (31, '20211110', 'Mm123456', 2);
INSERT INTO `login` VALUES (32, '20211111', 'Mm123456', 2);
INSERT INTO `login` VALUES (33, '20211112', 'Mm123456', 2);
INSERT INTO `login` VALUES (34, '20211113', 'Mm123456', 2);
INSERT INTO `login` VALUES (35, '20211114', 'Mm123456', 2);
INSERT INTO `login` VALUES (36, '20211115', 'Mm123456', 2);
INSERT INTO `login` VALUES (37, '20211116', 'Mm123456', 2);
INSERT INTO `login` VALUES (38, '20211117', 'Mm123456', 2);
INSERT INTO `login` VALUES (39, '20211118', 'Mm123456', 2);
INSERT INTO `login` VALUES (40, '20211119', 'Mm123456', 2);
INSERT INTO `login` VALUES (41, '20211120', 'Mm123456', 2);
INSERT INTO `login` VALUES (42, '20211121', 'Mm123456', 2);
INSERT INTO `login` VALUES (43, '20211122', 'Mm123456', 2);
INSERT INTO `login` VALUES (44, '20211123', 'Mm123456', 2);
INSERT INTO `login` VALUES (45, '20211124', 'Mm123456', 2);
INSERT INTO `login` VALUES (46, '20211125', 'Mm123456', 2);
INSERT INTO `login` VALUES (47, '20211126', 'Mm123456', 2);
INSERT INTO `login` VALUES (48, '20211127', 'Mm123456', 2);
INSERT INTO `login` VALUES (49, '20211128', 'Mm123456', 2);
INSERT INTO `login` VALUES (50, '20211129', 'Mm123456', 2);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `majorID` int(11) NOT NULL COMMENT '专业号',
  `majorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名',
  PRIMARY KEY (`majorID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '计算机科学与技术');
INSERT INTO `major` VALUES (2, '信息技术');
INSERT INTO `major` VALUES (3, '电子信息工程');
INSERT INTO `major` VALUES (4, '临床医学');
INSERT INTO `major` VALUES (5, '口腔医学');
INSERT INTO `major` VALUES (6, '药学');
INSERT INTO `major` VALUES (7, '网络工程');
INSERT INTO `major` VALUES (8, '中医学');
INSERT INTO `major` VALUES (9, '软件工程');
INSERT INTO `major` VALUES (10, '数据科学');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `userID` int(11) NOT NULL COMMENT '学号',
  `courseID` int(11) NOT NULL COMMENT '课程号',
  `grade` int(11) NULL DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`userID`, `courseID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (20210000, 1, NULL);
INSERT INTO `sc` VALUES (20210001, 2, NULL);
INSERT INTO `sc` VALUES (20210002, 3, NULL);
INSERT INTO `sc` VALUES (20210003, 4, NULL);
INSERT INTO `sc` VALUES (20210004, 5, NULL);
INSERT INTO `sc` VALUES (20210005, 6, NULL);
INSERT INTO `sc` VALUES (20210006, 7, NULL);
INSERT INTO `sc` VALUES (20210007, 8, NULL);
INSERT INTO `sc` VALUES (20210008, 9, NULL);
INSERT INTO `sc` VALUES (20210009, 10, NULL);
INSERT INTO `sc` VALUES (20210010, 1, NULL);
INSERT INTO `sc` VALUES (20210011, 2, NULL);
INSERT INTO `sc` VALUES (20210012, 3, NULL);
INSERT INTO `sc` VALUES (20210013, 4, NULL);
INSERT INTO `sc` VALUES (20210014, 5, NULL);
INSERT INTO `sc` VALUES (20210015, 6, NULL);
INSERT INTO `sc` VALUES (20210016, 7, NULL);
INSERT INTO `sc` VALUES (20210017, 8, NULL);
INSERT INTO `sc` VALUES (20210018, 9, NULL);
INSERT INTO `sc` VALUES (20210019, 10, NULL);
INSERT INTO `sc` VALUES (20210020, 1, NULL);
INSERT INTO `sc` VALUES (20210021, 2, NULL);
INSERT INTO `sc` VALUES (20210022, 3, NULL);
INSERT INTO `sc` VALUES (20210023, 4, NULL);
INSERT INTO `sc` VALUES (20210024, 5, NULL);
INSERT INTO `sc` VALUES (20210025, 6, NULL);
INSERT INTO `sc` VALUES (20210026, 7, NULL);
INSERT INTO `sc` VALUES (20210027, 8, NULL);
INSERT INTO `sc` VALUES (20210028, 9, NULL);
INSERT INTO `sc` VALUES (20210029, 10, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `userID` int(11) NOT NULL COMMENT '学号',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `userSex` tinyint(1) NOT NULL COMMENT '性别',
  `userAge` tinyint(2) NOT NULL COMMENT '年龄',
  `markYear` year NOT NULL COMMENT '入学年份',
  `classID` int(11) NULL DEFAULT NULL COMMENT '班级号',
  `majorID` int(11) NULL DEFAULT NULL COMMENT '专业号',
  PRIMARY KEY (`userID`) USING BTREE,
  INDEX `fk_stu_class`(`classID`) USING BTREE,
  INDEX `fk_stu_major`(`majorID`) USING BTREE,
  CONSTRAINT `fk_stu_class` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stu_major` FOREIGN KEY (`majorID`) REFERENCES `major` (`majorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'Emily Hunter', 1, 39, 2003, NULL, NULL);
INSERT INTO `student` VALUES (5, 'Miura Mitsuki', 0, 36, 2020, NULL, NULL);
INSERT INTO `student` VALUES (12, 'ddd', 1, 12, 2011, 2, 3);
INSERT INTO `student` VALUES (20210000, '罗子异', 0, 23, 2022, 3, 7);
INSERT INTO `student` VALUES (20210001, '曹嘉伦', 0, 18, 2020, 1, 10);
INSERT INTO `student` VALUES (20210002, 'Amy Martin', 0, 18, 2022, 2, 9);
INSERT INTO `student` VALUES (20210003, '罗云熙', 1, 19, 2021, 2, 4);
INSERT INTO `student` VALUES (20210004, '毛云熙', 0, 20, 2020, 3, 9);
INSERT INTO `student` VALUES (20210005, 'Joshua Garcia', 1, 19, 2021, 3, 9);
INSERT INTO `student` VALUES (20210006, 'Judith Reyes', 1, 19, 2022, 2, 10);
INSERT INTO `student` VALUES (20210007, 'Herbert Stephens', 1, 16, 2020, 2, 3);
INSERT INTO `student` VALUES (20210008, 'Tina Stephens', 1, 20, 2021, 1, 9);
INSERT INTO `student` VALUES (20210009, '宋宇宁', 1, 20, 2021, 2, 2);
INSERT INTO `student` VALUES (20210010, '龙岚', 1, 17, 2021, 2, 8);
INSERT INTO `student` VALUES (20210011, 'Joel Williams', 1, 21, 2020, 1, 6);
INSERT INTO `student` VALUES (20210012, '龚子韬', 1, 17, 2020, 2, 6);
INSERT INTO `student` VALUES (20210013, '金云熙', 1, 18, 2021, 1, 5);
INSERT INTO `student` VALUES (20210014, '阎璐', 0, 21, 2022, 2, 6);
INSERT INTO `student` VALUES (20210015, '钱云熙', 1, 18, 2021, 2, 8);
INSERT INTO `student` VALUES (20210016, '孟杰宏', 1, 21, 2021, 2, 9);
INSERT INTO `student` VALUES (20210017, '邹杰宏', 0, 21, 2021, 2, 3);
INSERT INTO `student` VALUES (20210018, 'Luis Parker', 0, 17, 2022, 1, 2);
INSERT INTO `student` VALUES (20210019, '江云熙', 0, 20, 2021, 2, 10);
INSERT INTO `student` VALUES (20210020, 'Charlotte Rodriguez', 1, 18, 2021, 2, 1);
INSERT INTO `student` VALUES (20210021, '邵嘉伦', 0, 18, 2022, 2, 1);
INSERT INTO `student` VALUES (20210022, 'Judy Hicks', 0, 21, 2021, 3, 5);
INSERT INTO `student` VALUES (20210023, '邵秀英', 0, 21, 2021, 3, 6);
INSERT INTO `student` VALUES (20210024, 'Todd Kennedy', 0, 17, 2020, 2, 8);
INSERT INTO `student` VALUES (20210025, '罗杰宏', 1, 16, 2020, 2, 3);
INSERT INTO `student` VALUES (20210026, 'Mildred Ellis', 1, 18, 2020, 2, 2);
INSERT INTO `student` VALUES (20210027, '罗睿', 0, 21, 2022, 3, 8);
INSERT INTO `student` VALUES (20210028, '马睿', 0, 18, 2021, 1, 2);
INSERT INTO `student` VALUES (20210029, 'Mike', 1, 22, 2021, 2, 7);

-- ----------------------------
-- Table structure for teach_room
-- ----------------------------
DROP TABLE IF EXISTS `teach_room`;
CREATE TABLE `teach_room`  (
  `room_ID` int(11) NOT NULL COMMENT '教研室号',
  `roomName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教研室名',
  `majorID` int(11) NOT NULL COMMENT '专业号',
  PRIMARY KEY (`room_ID`) USING BTREE,
  INDEX `fk_room_major`(`majorID`) USING BTREE,
  CONSTRAINT `fk_room_major` FOREIGN KEY (`majorID`) REFERENCES `major` (`majorID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teach_room
-- ----------------------------
INSERT INTO `teach_room` VALUES (1, '计算机科学与技术', 1);
INSERT INTO `teach_room` VALUES (2, '信息技术', 2);
INSERT INTO `teach_room` VALUES (3, '电子信息工程', 3);
INSERT INTO `teach_room` VALUES (4, '临床医学', 4);
INSERT INTO `teach_room` VALUES (5, '口腔医学', 5);
INSERT INTO `teach_room` VALUES (6, '药学', 6);
INSERT INTO `teach_room` VALUES (7, '网络工程', 7);
INSERT INTO `teach_room` VALUES (8, '中医学', 8);
INSERT INTO `teach_room` VALUES (9, '软件工程', 9);
INSERT INTO `teach_room` VALUES (10, '数据科学', 10);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teachID` int(11) NOT NULL COMMENT '职工号',
  `teachName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `teachSex` tinyint(1) NOT NULL COMMENT '性别',
  `teachAge` tinyint(2) NOT NULL COMMENT '年龄',
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `teachYear` year NOT NULL COMMENT '入职时间',
  `roomID` int(11) NULL DEFAULT NULL COMMENT '办公室号',
  `classID` int(11) NULL DEFAULT NULL COMMENT '班级号',
  PRIMARY KEY (`teachID`) USING BTREE,
  INDEX `fk_teach_room`(`roomID`) USING BTREE,
  INDEX `fk_teach_class`(`classID`) USING BTREE,
  CONSTRAINT `fk_teach_class` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_teach_room` FOREIGN KEY (`roomID`) REFERENCES `teach_room` (`room_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2, 'Julia Perez', 1, 4, 'QLQYBrktgU', 'Miss.', 2018, NULL, NULL);
INSERT INTO `teacher` VALUES (3, 'Mui Chi Yuen', 0, 22, 'gQRjkRKpuv', 'Mrs.', 2019, NULL, NULL);
INSERT INTO `teacher` VALUES (5, 'Dai Yuning', 0, 14, 'drSx3GBoiW', 'Prof.', 2003, NULL, NULL);
INSERT INTO `teacher` VALUES (6, 'Fong Suk Yee', 0, 21, 'nF0n3SAn9m', 'Mr.', 2012, NULL, NULL);
INSERT INTO `teacher` VALUES (7, 'Kinoshita Hana', 0, 2, 'g51Ji4Q0WB', 'Mr.', 2002, NULL, NULL);
INSERT INTO `teacher` VALUES (8, 'Otsuka Yuito', 0, 5, 'lzSyTtDmhN', 'Mrs.', 2006, NULL, NULL);
INSERT INTO `teacher` VALUES (9, 'Doris Hicks', 1, 22, 'K8erd1uK3O', 'Ms.', 2017, NULL, NULL);
INSERT INTO `teacher` VALUES (10, 'Kimberly Harris', 0, 8, 'X0ZVUj2Xd2', 'Ms.', 2018, NULL, NULL);
INSERT INTO `teacher` VALUES (20211110, '楊安琪', 1, 47, '博士', '研究员', 2013, 6, 11);
INSERT INTO `teacher` VALUES (20211111, '董詩涵', 0, 27, '博士后', '助理研究员', 2017, 2, 3);
INSERT INTO `teacher` VALUES (20211112, '鐘詠詩', 1, 46, '学士', '教授', 2012, 5, 8);
INSERT INTO `teacher` VALUES (20211113, 'Eddie Thompson', 1, 28, '大专', '副教授', 2014, 9, 19);
INSERT INTO `teacher` VALUES (20211114, '戚裕玲', 0, 18, '学士', '副教授', 2017, 2, 7);
INSERT INTO `teacher` VALUES (20211115, 'Jeffery Sullivan', 0, 27, '硕士', '副教授', 2018, 2, 2);
INSERT INTO `teacher` VALUES (20211116, '藤裕玲', 0, 30, '学士', '教授', 2011, 3, 10);
INSERT INTO `teacher` VALUES (20211117, 'Emily Kennedy', 1, 47, '博士', '教授', 2013, 9, 4);
INSERT INTO `teacher` VALUES (20211118, 'Leonard Long', 1, 40, '本科', '副教授', 2015, 4, 6);
INSERT INTO `teacher` VALUES (20211119, 'Peter Jordan', 1, 49, '博士后', '助理研究员', 2018, 4, 5);
INSERT INTO `teacher` VALUES (20211120, '范璐', 0, 44, '博士', '助理研究员', 2011, 9, 20);
INSERT INTO `teacher` VALUES (20211121, '戚詠詩', 0, 31, '本科', '讲师', 2016, 6, 15);
INSERT INTO `teacher` VALUES (20211122, 'Theodore Phillips', 1, 45, '博士', '讲师', 2015, 2, 1);
INSERT INTO `teacher` VALUES (20211123, 'Ashley Gonzalez', 0, 54, '本科', '讲师', 2012, 4, 12);
INSERT INTO `teacher` VALUES (20211124, '宣青雲', 0, 49, '本科', '教授', 2016, 6, 9);
INSERT INTO `teacher` VALUES (20211125, '元國賢', 1, 21, '本科', '讲师', 2011, 5, 13);
INSERT INTO `teacher` VALUES (20211126, '伍榮發', 0, 41, '中专', '助理研究员', 2012, 10, 14);
INSERT INTO `teacher` VALUES (20211127, '江國權', 0, 45, '高中', '副研究员', 2016, 6, 16);
INSERT INTO `teacher` VALUES (20211128, '高天樂', 0, 40, '高中', '研究员', 2015, 4, 18);
INSERT INTO `teacher` VALUES (20211129, '冯子韬', 1, 29, '大专', '副教授', 2011, 6, 17);

SET FOREIGN_KEY_CHECKS = 1;
