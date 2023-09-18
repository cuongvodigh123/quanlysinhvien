-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: databaseapp
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sinh_vien`
--

DROP TABLE IF EXISTS `sinh_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinh_vien` (
  `maSV` char(15) NOT NULL,
  `tenSV` varchar(45) NOT NULL,
  `lopSV` char(15) NOT NULL,
  `gioiTinh` smallint NOT NULL,
  `ngaySinh` date NOT NULL,
  `soDienThoai` char(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `diaChi` varchar(45) DEFAULT NULL,
  `ghiChu` longtext,
  `avatar` blob,
  PRIMARY KEY (`maSV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinh_vien`
--

LOCK TABLES `sinh_vien` WRITE;
/*!40000 ALTER TABLE `sinh_vien` DISABLE KEYS */;
INSERT INTO `sinh_vien` VALUES ('B20DCAT002','Nguyễn Ngọc Quân','D20CQAT02-B',1,'2002-02-05','0970474030','nnq.b20dcat002@stu.ptit.edu.vn',NULL,NULL,NULL),('B20DCAT006','Ngô Anh Ngọc Anh','D20CQAT02-B',1,'2002-04-24','0989893340',NULL,NULL,NULL,NULL),('B20DCAT010','Nguyễn Việt Anh','D20CQAT02-B',1,'2002-10-12','0968367553',NULL,NULL,NULL,NULL),('B20DCAT014','Đào Trọng Bách','D20CQAT02-B',1,'2002-08-27','0962444318',NULL,NULL,NULL,NULL),('B20DCAT018','Lều Mạc Cương','D20CQAT02-B',1,'2002-12-30','0982760256',NULL,NULL,NULL,NULL),('B20DCAT022','Lê Mạnh Cường','D20CQAT02-B',1,'2002-04-29','0993245845',NULL,NULL,NULL,NULL),('B20DCAT026','Ngô Việt Chinh','D20CQAT02-B',1,'2002-12-31','0966324034',NULL,NULL,NULL,NULL),('B20DCAT030','Nguyễn Quang Dũng','D20CQAT02-B',1,'2002-11-28','0982675359',NULL,NULL,NULL,NULL),('B20DCAT034','Nguyễn Quý Dương','D20CQAT02-B',1,'2002-08-13','0937353520',NULL,NULL,NULL,NULL),('B20DCAT038','Nguyễn Tiến Đạt','D20CQAT02-B',1,'2002-09-30','0941002447',NULL,NULL,NULL,NULL),('B20DCAT042','Lương Ngọc Đức','D20CQAT02-B',1,'2002-09-10','0963064352',NULL,NULL,NULL,NULL),('B20DCAT046','Ngô Văn Đức','D20CQAT02-B',1,'2000-11-17','0944782290',NULL,NULL,NULL,NULL),('B20DCAT050','Vũ Nhật Minh Đức','D20CQAT02-B',1,'2002-02-16','0920028498',NULL,NULL,NULL,NULL),('B20DCAT054','Nguyễn Minh Hiển','D20CQAT02-B',1,'2002-08-23','0966596507',NULL,NULL,NULL,NULL),('B20DCAT058','Mỵ Phạm Trung Hiếu','D20CQAT02-B',1,'2002-12-18','0945953643',NULL,NULL,NULL,NULL),('B20DCAT062','Phùng Minh Hiếu','D20CQAT02-B',1,'2002-02-08','0921703360',NULL,NULL,NULL,NULL),('B20DCAT066','Phạm Xuân Hinh','D20CQAT02-B',1,'2002-12-07','0998045475',NULL,NULL,NULL,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0\�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\������������\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R�br\�\n$4\�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������\�\0\0\0?\0�K�\�M�N�?��SݧS\�D�c�U\�}OAOa\�\���\��l��So\'3�J\�E\'�ʼ��*:gU�HS��\�\�\�\�W7۩\�M1\�~C\'��&	�\�^\'�)۟�\�ݰ��L\\�B�ű���1\�$Q����\�\\�\�\���A٤��\�s�5zG@\�u\�HK���*��\�\�d��\�UdmhJ�L\�!Q+�{\�M|󊫢 �ጘGe©\��U�\�}h{�h�|�\�QӚ\�\���+(��&Z\�\0\�z�i9y=)\�\�ǥ+��b�ޓ\ZC��\�\�K�Ό}j23\�=8d\�cQ#H\�t\�>QN\�M��\\�z��u2F��SOZ��\�j���)�\�픍�K1����\����q8F\��\0\�\n>��!\��\����)�\0Ў?��\�T�\0Ql�{4��?��\"JQ\�\�\\��<�3��\�0�c��\'u�ߧ�g\\\\Iq:,�4�?*��\���\�3 H�58?�\�\���\"9^\0��)$?ޙ�?\��&�I#n<�\�e�қeS��c\�6/�\'��/!Wʪ�\��M\\I���DR輠�W\�\��o�[�\�\�Pѐ��K( v�����w�zOq|:\�~�\\�\0���\�ڷ\�K[jD\�1֤A\�Oj2C�4��\�\�I�*X!3\�Sy{׆\�\�U\�\�\�\�\�\�Q=�)\�*M�\�G�\�\���Xr\�54zΨ�\��\�yG�����0���i��ҥI�\�Qa|C\0�\0_iy�\�o�f�C�铰T��q�}��<\�~rrj7T�HuV�dS\�\'�\�0� �cF\�\\�\�-�\�3	����	(I��\�/\0��?�^\�#<�\��G��\�|1\�\��\�\��)�%�\�\�%�\�;���V\�\�p@���U�\�M�8�\�3\�\�݁v��\����w7�E\�p�<$*��ƯGi!�I\�\��zJB)�O_¨\�q�_*��<0����?\�r8\'�%\�\�9�)�>�x$�2/\�;L\�݅p��\��\0\n�#�ە~���	#��O�p�\�܀n?�\�O\�5�,�$\�q\���#��\0�TI�{GF��g��\�\�ۡ?Zӿ�՗���9%bʽ���|>jLE�\�\�=��\�s��\0��G�tg��\�@*Q�?J�\Z$p��qHdl{\�L��<��Vt��f\�\�:�1\�\0�e\��:V��o�F��m\��K\�|G���le �\� �\�Mhi�\\\�)w\ni�c\�\0��X\�H$����\�\�z<0\"����\0�Kt\�-2�083���\��(\�n\��ծD�\��UAN¹\�k�R,��o\�\�\�6..Q1�1�N?Z�%\�\�\�\�+2�\�H0���)\�\�\�3p\�n=�\��9�\�\�{�p�[Z`�ĳ�\��~F����*��\�Tp�$/\�\�\n�\�{�\�+h��\�>d\��(���\��:[4�\�l$������\�E�#NRب�E\n��tR?�/��N\�T%u\��&�\�\�\�c�\�is�\�w��:�Sn��\��xr�Gۿ�Z��\�X�!$��&�qE\��}k_/�k;L�\�8\��@m�\\{\'��\0\�V�\�3�o8T��.X݉�]Ef�\�3m@�jK\�Z۸	u#�Y\Z�G�H8b\�<\�}|�@�5fs\�\�\0S���\�D@�be�2gI\�U\�\�CQ��~[c,\�\�鐽\�\���\Z�\�\��\�~�\�\�T\�%-u=V\�F�ݛvpk2h\�=i��l��8�և�cit\�����U�1\�!n\�&�\Z\�\�a-P\�Ύ���+O>aVU\�9��Xd+1�#�+zĐ�O��\�!����s�E�DH�7XȆ��{��4k�C\�\�&�\�?�\��\�\��`��k��S�5\�ケ}\��\0y�\�R���-�T�J:�x\���v�x��X-ᴅa��\"�z*\ns0U\�8��DH�\"(UA<\�Yn��G\��\�\\�rI\'\�P\�$R�<�\�\\+\�d=DC�[��\�K	^/9��#�\0-%m��3\��)~\�\�\��1Dǟ1���\��\�\�\���w\�\�����Սv4q�\�0�9A�S#�\�p?�M\�$������i��\��C�a\�>\�sQi�8J��dm\�;A��{\�(�]6�\��\�9�\�|���sBF��E&�^�\�8\�+]I\�\�3)�y�r`8?�ts�\'\�G�\nA2��NG\�Ӹ�?��\�\�s�6��`*��s\��?�v:]�2\�9w\�\��\�W�W|�{t��Y-\�O\Z2�	yb9|��u~�Da�6\�a���+��{�il��˟�18\n~�\�}0A���,a9?�Z�EJ�kcS�>c�\�\�.�/3*.x&��n�&�\�$t\n:�\\���&��\�Fȱ\��.FqN:+�\�]�-�ȟ4���v�\�2����b�Y.�mrV\��H\�\0\nܼ\�_Z�0y\nq��\�R�t-x&+�yd\�\�\�#x\'ڷ/-�\�@�\�	957vZ[\�\�M:F\�7�c�͎�y�O\\Զ\�]�-�R-��\��h W;I`���X1S)\�냞j[*+Sv\�\�\�\�.\��O\'�>��&��=I�\�u(9l}\�֪\�,\�\0d\�_\�\�\�#u\�3^���J�\�\�9����5c\�)������٢�@p��\�M\��A�z��NM;p�(�T��\�~\�\�%s�d�n��^��i���RO�\�1^\�¿\�S�{;E$�n�?t�+��\���׺\�5V[t\�O\�+���P�\r�#J?i��);\�1�\��rrz~U�4�n�\��h����Dޢ�t\�G\�4=A�\�&c!X�<���ܢXx\��\�e�P�6р�z���4��\�NV\����K\�\��.O\�EX�\�\�\�&H��x,i&���f\\d8+\�*X�\�\0F�s�˙�5V:+HD��Ei$8\�I?Z쯼3-��g3+��rX�	�{�n7\"���+�\�n\�\�S{`ߺ�cִIrݐ\�\�\�G\�\�5F�PDQ�ܞ�\�U��\���\�\�\�y\�����\�\�]�\�\��loyP\��\�^Mr��bʾr0zV�JP�\�&\�3ڮ���\�P��\�A\�\�#��Z|򭻖\�5,X/\n���\���/�<	�\�\\\�A��\�I\"Op2���\r��\0:\�\�\�+��Ck{\"Iy{4�%V\�9��	c�p\rG\�\�r\�g\��\�g^�\��Fn$vU���\0��\�^\�\�K�\�Vw\���o���z�T��۹\�z�\�]K}�\�\�\"x����\0\�:ub�}J^��N�?\"�L�u��\n.q�}?LVd�Q\�\�\�w(�jF:\�݀��;\�$q\�\���l\0\�d�\'�&��nu\�]\�d\�ݭ\�\��m��e�e��St�&��>\��=��\�pdX����\�\�\�Ҷ��\�sN6v5�9\�7�h]g��}�z��qӽ9\"^�ڣ�\Zܳ\����.\���\�.i�nz�ΎT<̥��yMԽ\�\�ջ�_\\\\I\�۪��Ǘ\�穥��\�^�V\�<��I�z\n\��\�.���p۬�\�\�Trrk\�H󗙩,_پ�ٸ�\�ą}t�xSW}^�PO�\�$�\�MT\�o\r���tO��\�GJ�ń\�ޓvwEZ\�\��=s��j\Z̗v�\"E0\�A�\�P\'ë�����\�\�]\�{���\�\��\�\ns\�V\�+�\�\�\�`\�Ihr\��\�\�5\��L\�ې*��yn�\�Z\�g����פ��\�/��\�G�����\�u���F��\�\�d~+�]_C��\�cރ\�W��:\�\�.\�n�\"\r=��\\)S�GC\�5뛖)�pC\0y��xW�!}Ǘ\�d\�\��\�T\����\�E=b\�_2�56�V���Yi:\�&��|�\�\�rw\'?N8\�qʲ\��W�+ZWi\�4�]�%�\�\Z��@���-Nj�S��V+����\�:\�\0\�c�}�a�\'W��\�I��aK{�wD�\ZA꣨�x\�c�\�8\�u����w\�,����\'\�JV��\�fj𛋟�ŵ��;-�\�\���\�J\�\�\�\�,\'X7��!��\n��p\0\�x��Y�F��\�ع��0\�\�$����\��\�\���\�a6\\In\��\�2G$�\�s�W�\�\�#�����5%�\�� 3�\�!2\��̜\�=$\�ڠP\�1\�i�\�%�ԯ`�\�p9O��nt=�\\��֥���\�\�r+ƭ���*\��GG4�kt&6ri|\�9�g:��\��?ʹ\��l\n1\�R\n^(\�\�)ϗq!R(�3}\0�j\��)v\�Q\�H�܁�\�\�\�&\Zt_*v\�ܖ=knU�þHN׽�a,ۏ*���k\�Mu��?\�z\��[̏�\"�2�m��ڴ$\�c�͚�{����?ηk��[n��c��EtU\��S��W��\�\�\�z\�W�b)\��\�W�V7��\�\�4yb o_���F�*��#��h��\�\�\�y\�\�?]����햟fs~Ib%-����\�H�ʻe�渿�&V�F�axX�\0��ҹ0��\�u\�!jg�\�\'\�_��u4\�\�1��\�8v��]\�F\�R\�q]�5\���Ha�CY\�8�g?\�\�9\�\�=��O��`�3�\��\�\�c\�-tܛG��@\�\�;)�Pz\�s�i�H+����w�h�gm)wL�*�\\�~`ï\�Һ)�dW�\�\��\0~���i�\\l�q��7Y��o�\�Q\�E��5ꐚ��F06�r5�9�J\�\�RL\�[�׾c��\�d�1#F�yl�02q\�\�ޫ\�\�\�\�!�-�\�\�\�\�?\�\�ޫ\�z�\�\�t���Af!��$ciϠ\��wtn\�ݳ���S�%\�cHԅ[5X�*\�~u <Sp\0\�nNr@��fh?\�$`~t�\nvi]�\��\�ku���J(\��\��u�y\��S�W(��p+c@ִ�#\"\�E$A\�1�2�D�\�Լ�G�\�47���	\����EzJ\��\�4\�\�\�Tֻ�:\�eD͟A\\��|=}/�,\��\�\�\"2\��1_J\�iV�q�AU\Z|\�ʧ**�^\�K\r8\�]�Ib=3[T��\\\�JVV9���S]C!��QLG�jv�\�R��9���?\�=����\�Fd��w��?�zO�\�\�K��S�)�\�+\�mK\�:�����$2\���*te\Z����h�I=\�\�Tnf灁S����+���\�8I�ؼ+�\�O�iz�����Ó\��~��\�+0y�5\�\�״x3p�f�9\�\�\��\�5r\�ݡtt\�U\�o��yo\�J��94\�P*P+ι\�\0��]�z�\�8�C��j\�\�j~&�H<\�pH��M; �4ǀ\� R\�B�\�����\��\nTP9<�\�\�\�:\�\Z�lP\0\�\�j\�\�\�\��=e��\'�ljg\�$�Gl\��\n��l��\��mOP֙纕\�I �\�j�t@+��qnDp�1o»���(���yu�sv\ZA\�*�)r)\n\�\�u\�Ի��9\�h\�Z�\���\�Y>��F�L�\�nY���Hˡ\��⾳��\�X�/\'@d�Tu���g���<���\�$\�S��B���^�\�1�\��\�\\;2\�\�\�\�\�I��W���l��\�[lb�2\�A\�\�I;<lW��܊��\�[�s��PT�sQ\�\�7+�|�Fǆ>^j6�}\�\�ڣ\�E\�\����u~\nw]\0\�\�\�Oc<�H=��k��\�\�\�\�>؛\�i\�3�y\�\�u�*~�\��o\\}f�V\�\�\�ݦ�(��1T`O^�\�X�nG\�m�\�R\�\�0��Ƣ,\�����i�n\�\n�\nG��6\�x���N��.�\�ӕ�}*\�(�v[�\�Jn@�\�SԹ�\�j��\�VE�\�g�\�J\�s\�\��		��z\�,s���օż�Hw��b1V�dv\�GĻ�2\�;y,\�e�p8�\��+P\�3�x\�3^q$_-Igz�`�S��\�tƴ����Gt��\�\�ZЉ��03�r�^?�\Z\�|�JBb6M`\\ۘ⍆\��+<Z�\�\�\�Vkf��\�ٲ�Ʒ<���ާ�f�}#\�O%��ܖ\��i�J\�D��\�b�����\r\�l���\�\�^ǰ\�]�GR!$T\�H\�E �\�+�Aus�\��O\�\�h\�S\�ʻ�\�\�RYٝ�rj��C\� \�k(�&S�;�cX\�\\\�D���qt5-��+�\�k|�g�v�\�2sX�6j���q\�]\n\���N�Y;� �8\�mZ\�\�ip\�\Z�q�*�����sC���cQKdKSRn\n=�T\n䐊2}�\�G��\�zԌQa�\�\�Rm\�JQOS\�@\\��ޟ\0y_\�Qթ�[h��\�\�\�T*���Mf�*ԜUb@�\�\�\�`8k\�\�lՏ�8 �\�g\n?�3�s�T�.70�wERI\�Rŧ\�.!\�V\�S��>�\�`\�(���`\�\��yvB�*�Q��\�J7\�\�hcZof\�\�&\�M�xV@3� �/\�D\�\�\�>��D\�\�\��\�1\�K����L��\�5zPϴd\�\\	\0��4��\�\��TP��\�S\�֮/ȻS�L	��bL(��ZZ�K\�[�\�����\�:��uXL��?s�\�\�\�H�(tG��D�\\T��\�ץNYq�\�r\�\0Tk�9?���@\�V8\�^9\�֝�^���\�\ZN:\�&S!!z�$�*��0,\"\�S�qMO�)\n�E8�\�-1~��\�\�ֳ\0Q�\� \�M�\�i0!f9�(\�|��\�)�x���\�\�րT\0\0�i���J\0�\'�����xAڞ�\0}l\�?\��S\��\"�\�\�!��Iڐ\r�_�\�S�\�l�_OJ�?ן�YZ\n&^:ԁ��\��\�'),('B20DCAT070','Nguyễn Huy Hoàng','D20CQAT02-B',1,'2002-08-11','0981227092',NULL,NULL,NULL,NULL),('B20DCAT074','Hoàng Thạch Hùng','D20CQAT02-B',1,'2002-09-20','0950831392',NULL,NULL,NULL,NULL),('B20DCAT078','Nguyễn Quang Huy','D20CQAT02-B',1,'2002-12-01','0959687102',NULL,NULL,NULL,NULL),('B20DCAT082','Nguyễn Viết Hoàng Huy','D20CQAT02-B',1,'2002-01-24','0990104122',NULL,NULL,NULL,NULL),('B20DCAT094','Ninh Chí Hướng','D20CQAT02-B',1,'2002-05-19','0929929709',NULL,NULL,NULL,NULL),('B20DCAT098','Hoàng Trung Kiên','D20CQAT02-B',1,'2002-08-07','0977596523',NULL,NULL,NULL,NULL),('B20DCAT106','Cao Vũ Tùng Lâm','D20CQAT02-B',1,'2002-07-30','0923832618',NULL,NULL,NULL,NULL),('B20DCAT110','Bùi Đoan Long','D20CQAT02-B',1,'2002-12-11','0950207006',NULL,NULL,NULL,NULL),('B20DCAT111','Ngô Anh Ngọc Anh','D20CQAT02-B',1,'2002-04-24','0925289731',NULL,'Bac Ninh',NULL,NULL),('B20DCAT114','Đỗ Thành Luân','D20CQAT02-B',1,'2002-03-05','0978231706',NULL,NULL,NULL,NULL),('B20DCAT118','Chu Thảo Mai','D20CQAT02-B',0,'2002-07-09','0937059798',NULL,NULL,NULL,NULL),('B20DCAT119','Nguyễn Thị Ngọc Mai','D20CQAT03-B',0,'2002-08-07','0948134869',NULL,NULL,NULL,NULL),('B20DCAT122','Hoàng Tuấn Minh','D20CQAT02-B',1,'2002-12-29','0969566012',NULL,NULL,NULL,NULL),('B20DCAT126','Nguyễn Trần Minh','D20CQAT02-B',1,'2002-03-13','0964456895',NULL,NULL,NULL,NULL),('B20DCAT130','Phạm Văn Nghĩa','D20CQAT02-B',1,'1999-03-25','0926380667',NULL,NULL,NULL,NULL),('B20DCAT134','Vũ Thị Nguyệt','D20CQAT02-B',0,'2002-11-21','0973144982',NULL,NULL,NULL,NULL),('B20DCAT138','Phạm Khắc Phong','D20CQAT02-B',1,'2002-04-01','0936928662',NULL,NULL,NULL,NULL),('B20DCAT141','Trần Huy Phúc','D20CQAT01-B',1,'2002-08-17','0934854903',NULL,NULL,NULL,NULL),('B20DCAT142','Vũ Ngọc Phương','D20CQAT02-B',1,'2002-03-01','0953261606',NULL,NULL,NULL,NULL),('B20DCAT146','Lê Đình Quân','D20CQAT02-B',1,'2002-01-17','0995745256',NULL,NULL,NULL,NULL),('B20DCAT150','Nguyễn Tiến Quân','D20CQAT02-B',1,'2002-07-17','0964631138',NULL,NULL,NULL,NULL),('B20DCAT154','Đỗ Ngọc Sơn','D20CQAT02-B',1,'2002-10-21','0975514562',NULL,NULL,NULL,NULL),('B20DCAT158','Phan Minh Tiến','D20CQAT02-B',1,'2002-10-01','0917756314',NULL,NULL,NULL,NULL),('B20DCAT162','Tạ Quang Toàn','D20CQAT02-B',1,'2002-06-10','0924008505',NULL,NULL,NULL,NULL),('B20DCAT166','Ngô Sỹ Tuấn','D20CQAT02-B',1,'2002-10-15','0984419118',NULL,NULL,NULL,NULL),('B20DCAT170','Nguyễn Lê Thanh Tùng','D20CQAT02-B',1,'2002-05-15','0943255927',NULL,NULL,NULL,NULL),('B20DCAT174','Nguyễn Hữu Thanh','D20CQAT02-B',1,'2002-12-09','0938451729',NULL,NULL,NULL,NULL),('B20DCAT178','Đào Thị Thảo','D20CQAT02-B',0,'2002-08-16','0961442651',NULL,NULL,NULL,NULL),('B20DCAT182','Trần Như Thắng','D20CQAT02-B',1,'2001-05-03','0971608368',NULL,NULL,NULL,NULL),('B20DCAT186','Trần Đăng Thức','D20CQAT02-B',1,'2002-01-28','0914307740',NULL,NULL,NULL,NULL),('B20DCAT190','Lê Văn Tráng','D20CQAT02-B',1,'2002-02-20','0998460703',NULL,NULL,NULL,NULL),('B20DCAT198','Nguyễn Công Văn','D20CQAT02-B',1,'2002-02-10','0937108782',NULL,NULL,NULL,NULL),('B20DCAT202','Nguyễn Đức Vinh','D20CQAT02-B',1,'2002-06-24','0943709801',NULL,NULL,NULL,NULL),('B20DCAT206','Nguyễn Việt Đông','D20CQAT02-B',1,'2002-05-10','0913018198',NULL,NULL,NULL,NULL),('B20DCCN009','Bùi Hoàng Cường','D20CQCN07-B',1,'2002-05-12','0984261176',NULL,NULL,NULL,NULL),('B20DCCN070','Phạm Đắc Anh','D20CQCN10-B',1,'2002-11-03','0918174055',NULL,NULL,NULL,NULL),('B20DCCN075','Trần Vân Anh','D20CQCN03-B',0,'2002-04-07','0990625913',NULL,NULL,NULL,NULL),('B20DCCN079','Vũ Hoàng Anh','D20CQCN07-B',1,'2002-12-22','0990615127',NULL,NULL,NULL,NULL),('B20DCCN102','Nguyễn Mạnh Cường','D20CQCN06-B',1,'2002-07-02','0984936796',NULL,NULL,NULL,NULL),('B20DCCN112','Trịnh Phúc Chiến','D20CQCN04-B',1,'2002-01-21','0932877427',NULL,NULL,NULL,NULL),('B20DCCN129','Chu Tiến Dũng','D20CQCN09-B',1,'2002-01-07','0931086662',NULL,NULL,NULL,NULL),('B20DCCN130','Đàm Tuấn Dũng','D20CQCN10-B',1,'2002-04-13','0936919715',NULL,NULL,NULL,NULL),('B20DCCN159','Lê Thị Thùy Dương','D20CQCN03-B',0,'2002-03-24','0991330914',NULL,NULL,NULL,NULL),('B20DCCN189','Bùi Văn Đô','D20CQCN09-B',1,'2002-03-06','0958340238',NULL,NULL,NULL,NULL),('B20DCCN190','Nguyễn Văn Đô','D20CQCN10-B',1,'2002-02-10','0915396984',NULL,NULL,NULL,NULL),('B20DCCN191','Bùi Anh Độ','D20CQCN11-B',1,'2002-09-01','0967949195',NULL,NULL,NULL,NULL),('B20DCCN207','Phạm Hương Giang','D20CQCN03-B',0,'2002-06-18','0979414936',NULL,NULL,NULL,NULL),('B20DCCN211','Đàm Trọng Ngọc Hà','D20CQCN07-B',1,'2002-11-26','0972854922',NULL,NULL,NULL,NULL),('B20DCCN219','Cao Thanh Hải','D20CQCN03-B',1,'2002-04-20','0928059511',NULL,NULL,NULL,NULL),('B20DCCN265','Nguyễn Thái Hòa','D20CQCN01-B',1,'2002-02-17','0934536793',NULL,NULL,NULL,NULL),('B20DCCN292','Bùi Mạnh Hùng','D20CQCN04-B',1,'2002-06-13','0974585134',NULL,NULL,NULL,NULL),('B20DCCN389','Hoàng Trọng Lâm','D20CQCN05-B',1,'2002-03-14','0998165639',NULL,NULL,NULL,NULL),('B20DCCN409','Viên Đình Long','D20CQCN01-B',1,'2002-12-19','0930245938',NULL,NULL,NULL,NULL),('B20DCCN442','Trần Giang Minh','D20CQCN10-B',1,'2002-09-04','0946372657',NULL,NULL,NULL,NULL),('B20DCCN486','Đỗ Ngọc Nhi','D20CQCN06-B',0,'2002-12-19','0952917801',NULL,NULL,NULL,NULL),('B20DCCN495','Nguyễn Hải Phong','D20CQCN03-B',1,'2002-12-27','0936632280',NULL,NULL,NULL,NULL),('B20DCCN498','Tạ Văn Phong','D20CQCN06-B',1,'2002-12-05','0918009319',NULL,NULL,NULL,NULL),('B20DCCN533','Nguyễn Đức Minh Quang','D20CQCN05-B',1,'2002-05-20','0953291119',NULL,NULL,NULL,NULL),('B20DCCN648','Mai Văn Thành','D20CQCN12-B',1,'2002-09-26','0981522652',NULL,NULL,NULL,NULL),('B20DCCN682','Cao Quang Thức','D20CQCN10-B',1,'2002-12-20','0962158419',NULL,NULL,NULL,NULL),('B20DCCN713','Thăng Văn Trường','D20CQCN05-B',1,'2002-06-11','0942042364',NULL,NULL,NULL,NULL),('B20DCCN740','Vũ Quang Vinh','D20CQCN08-B',1,'2002-01-05','0967945699',NULL,NULL,NULL,NULL),('B20DCCN745','Nguyễn Lê Vũ','D20CQCN01-B',1,'2002-01-11','0922596898',NULL,NULL,NULL,NULL),('B20DCCN751','Nguyễn Quốc Vương','D20CQCN07-B',1,'2002-10-26','0929037369',NULL,NULL,NULL,NULL),('B22DCCN013','Đỗ Nhật Anh','D22CQCN01-B',1,'2004-05-17','0125678944','nams0129@stu.ptit.edu.vn','Hưng Yên','BCVT10',NULL),('B22DCCN037','Nguyễn Việt Anh','D22CQCN01-B',1,'2004-01-24','0145674948','nams0129@stu.ptit.edu.vn','Thanh Hóa','BCVT10',NULL),('B22DCCN073','Bùi Công Bắc','D22CQCN01-B',1,'2004-08-25','0165670952','nams0129@stu.ptit.edu.vn','Bắc Ninh','BCVT10',NULL),('B22DCCN085','Ngô Văn Bộ','D22CQCN01-B',1,'2004-07-28','0185666956','nams0129@stu.ptit.edu.vn','Phú Thọ','BCVT10',NULL),('B22DCCN097','Nguyễn Đức Cường','D22CQCN01-B',1,'2004-08-17','0205662960','nams0129@stu.ptit.edu.vn','Thái Nguyên','BCVT10',NULL),('B22DCCN109','Tạ Quang Chiến','D22CQCN01-B',1,'2004-07-14','0225658964','nams0129@stu.ptit.edu.vn','Vĩnh Phúc','BCVT10',NULL),('B22DCCN121','Bùi Mạnh Dũng','D22CQCN01-B',1,'2004-10-27','0245654968','nams0129@stu.ptit.edu.vn','Lạng Sơn','BCVT10',NULL),('B22DCCN133','Nguyễn Quang Dũng','D22CQCN01-B',1,'2004-12-18','0265650972','nams0129@stu.ptit.edu.vn','Hải Phòng','BCVT10',NULL),('B22DCCN145','Đào Đức Duy','D22CQCN01-B',1,'2004-10-22','0285646976','nams0129@stu.ptit.edu.vn','Hà Nội','BCVT10',NULL),('B22DCCN169','Phạm Hải Dương','D22CQCN01-B',1,'2004-10-17','0305642980','nams0129@stu.ptit.edu.vn','Hà Nội','BCVT10',NULL),('B22DCCN181','Cung Quốc Đạt','D22CQCN01-B',1,'2004-03-31','0325638984','nams0129@stu.ptit.edu.vn','Hà Nội','BCVT10',NULL),('B22DCCN217','Nông Nhật Đông','D22CQCN01-B',1,'2004-01-29','0345634988','nams0129@stu.ptit.edu.vn','Đắk Lắk','BCVT10',NULL);
/*!40000 ALTER TABLE `sinh_vien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 21:56:28