-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2019 at 07:36 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rblms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `position`, `section`, `username`, `password`, `userImage`) VALUES
(1, '0', '0', '0', 'admin', '21232f297a57a5a743894a0e4a801fc3', ''),
(2, 'Steven Laurence Ballerda', 'OIC', 'General', 'mysteryslb', '1ab0b3b7266f3dbbde9cdc0d28e78f3f', '045da9165e98a6006722968a676315a7.png'),
(4, 'Emmanuel Sobrevega', 'OIC', 'General', 'emman', '350c9d901b7f1c73a481e240ec1b7c0b', 'download.png');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(20) NOT NULL,
  `content` varchar(300) NOT NULL,
  `attachment` varchar(50) NOT NULL,
  `dateTime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `content`, `attachment`, `dateTime`) VALUES
(1, 'HELLO', '0f6f05ceafa5552d197537e9e9a2ba23.jpg', 'Thursday 11:41 AM January 24, 2019'),
(2, 'This is a new announcement. Please Read.', '6346b980ffc2eb5c90c46b167fb9a459.png', 'Thursday 11:45 AM January 24, 2019'),
(3, 'PLEASE READ', '331b172a46707f9f44a86915248b785c.gif', 'Thursday 11:48 AM January 24, 2019'),
(4, 'NO PICTURE', '', 'Thursday 11:50 AM January 24, 2019'),
(5, 'Hello\r\nThis is a test', 'f370db1a5f2d7a4bec0904c1f4463611.jpg', 'Saturday 4:39 PM February 2, 2019');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `available` int(20) NOT NULL,
  `bookAuthor` varchar(50) NOT NULL,
  `bookTitle` varchar(100) NOT NULL,
  `callNumber` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `publishDate` varchar(50) NOT NULL,
  `series` varchar(50) NOT NULL,
  `uniqueId` varchar(50) NOT NULL,
  `shelfPosition` varchar(255) NOT NULL,
  `shelfLayer` varchar(255) NOT NULL,
  `EPC` varchar(255) NOT NULL,
  `missing` varchar(3) NOT NULL,
  `detected` varchar(3) NOT NULL,
  `borrowed` varchar(3) NOT NULL,
  `bookNumber` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`available`, `bookAuthor`, `bookTitle`, `callNumber`, `location`, `publishDate`, `series`, `uniqueId`, `shelfPosition`, `shelfLayer`, `EPC`, `missing`, `detected`, `borrowed`, `bookNumber`) VALUES
(1, 'Harry Turtledove', 'After the Downfall', '2017', '8', '813', 'NA', '55b16482b6c2bf73480f00e06a5f6984.jpg', '', '', '033F4F00821702690870F0BF', '', 'no', '', 0),
(1, 'Stanley J. Grenz', '20th Century theology : God & the world in a trans', '230', '2', '1992', 'NA', 'da4ec285b3efda9f335172411c72b38d.jpg', '', '', 'E20000167406007615507C3B', '', 'no', '', 0),
(1, 'Emilie Barnes', '15 Minutes Alone With God', '242', '2', '1994', 'NA', 'b1296a5d2a67998120f98f22e7447330.jpg', '', '', 'E20000167406009415407E9C', '', 'no', '', 0),
(1, 'Kathie Reimer', '1001 Ways to Help your Child Walk With God', '248.8', '2', '1994', 'NA', '1d7667e1b3163e16d01da3ac3ded44dc.jpg', '', '', 'E20000167406006915407E73', '', 'no', '', 0),
(1, 'Clarence Summy', 'According to the Pattern', '270.8', '2', '1992', 'NA', '8904ddc4cd588d3a12d4e1e79fe9a5e8.jpg', '', '', 'E2000016740600141560798F', '', 'no', '', 0),
(1, 'Steve Fuller', 'The Governance of Science : Ideology and the Futur', '303.48', '3', '2000', 'Issues in society', 'b3a1fabbf060cb703aba81326e51f6f9.jpg', '', '', 'E20000167406002115507BD3', '', 'no', '', 0),
(1, 'Pepper Schwartz', '50 great myths of Human Sexuality', '306', '3', '2015', 'NA', '9fd492daffba0599c7add98b87065516.jpg', '', '', 'E2000167406013715407F01', '', 'no', '', 0),
(1, 'K. M. De Silva', 'Sri Lanka, Problems of governance', '320.95', '3', '1993', 'Governing South Asia', '8a2184f7cd3be9c70bc13a44cb6d1ceb.jpg', '', '', 'E2 00 00 16 74 06 00 91 15 50 7C 62', '', 'no', '', 0),
(1, 'Adam S. Iqbal', 'Volatility : Practical Options Theory', '332.64', '3', '2018', 'NA', 'd475441da21d3fafda3672bdda8c440f.jpg', '', '', '', '', 'no', '', 0),
(1, 'KT Waxman', 'A Practical Guide to Finance and Budgeting : Skill', '362.17', '3', '2008', 'NA', 'f9d7ba0a600b6444ba63a16ed8899ad2.jpg', '', '', '', '', 'no', '', 0),
(1, 'Charles M. Wynn', 'Natural science : Bridging the Gaps', '500', '5', '1998', 'NA', 'bc87d99f4347c7906c4e08be1f936f57.jpg', '', '', '', '', 'no', '', 0),
(1, 'Daniel T. Sigley', 'Solid Geometry and Mensuration', '513.3', '5', '1942', 'The Dryden press mathematics publications. General', '2b0adaac9f83541ba58434fd589b4625.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Celia, Michael Anthony.', 'Numerical methods for differential equations : fun', '515/.35', '5', '1992', 'NA', '0eec693f454ad323de893a1dfb29add8.png', '', '0', '', '', 'no', '', 0),
(1, 'Earl D. Rainville', 'Elementary Differential Equations', '517/.38', '5', '1969', 'NA', '048b56da59cc3def6586827ed4333af3.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Martin Lunn', 'Earth and Space', '520', '5', '1997', 'BBC Fact Finders', 'ffc48294937a6464413a22d493b45ed0.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Ronald L. Snell', 'Fundamentals of Radio Astronomy:Astrophysics', '522/.682', '5', '2015', 'Series in astronomy and astrophysics', 'e1a9ec364475c57dec868482c7c772d4.jpeg', '', '0', '', '', 'no', '', 0),
(1, 'Neil deGrasse Tyson', 'Astrophysics for People in a Hurry', '523.01', '5', '2017', 'NA', '01686e8f9b812a4954fde454d944e27a.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Harold Allen', 'Cosmic Perspective', '523.1', '5', '198', 'NA', '3f88462ea901f7c43d613eee71c26ce6.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Mike Guidry', 'Stars and Stellar Processes', '523.8/6', '5', '2018', 'NA', '49d99b40f7c8417df943164fbf3e50ac.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Paul A. Tipler', 'Physics for Scientists and Engineers', '530', '5', '1999', 'NA', '72310e745ff77bb73564b4aebb54b61d.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Heinz R. Pagels', 'The Cosmic Code : Quantum Physics as the Language ', '530.1/2', '5', '1982', 'NA', '6d4cfb56b2f3c5f8d8cbd23b861251e2.jpg', '', '0', 'E20000167406022115407FA3', '', 'no', '', 0),
(1, 'L. Fonda ', 'Symmetry Principles in Quantum Physics', '530.12', '5', '1970', 'Theoretical Physics', '808fa062a765d8b26920af2fef83ea4a.png', '', '0', '', '', 'no', '', 0),
(1, 'Reuben M. Olson', 'Essentials of Engineering Fluid Mechanics', '532', '5', '1996', 'NA', 'c659b7e3ee0e1d9a8c2c649fdf5bcd9f.jpg', '', '0', '', '', 'no', '', 0),
(0, 'J. M. Honig', 'Thermodynamics', '541.3/69', '5', '1999', 'NA', '583ab69a934491cb3e0582d41cf1e055.jpg', 'A', 'upper', '69 D9 30 00 E2 00 00 16 74 06 02 68 15 40 7F FB ', '', 'no', 'yes', 0),
(1, 'William Brown', 'Introduction to Organic Chemistry', '547', '5', '2000', 'Saunders golden sunburst series', '452d50fce9f1b680b52a4a977ec1ff6e.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Ernest Huntress', 'Problems in Organic Chemistry', '547.0761', '5', '1938', 'International chemical series', '2d6e2a694b725f6f37bb8d5158b3e698.jpg', '', '0', '', '', 'no', '', 0),
(1, 'D. C. Firth', 'A Practical Organic Chemistry', '547/.0028', '5', '1966', 'NA', '5876e51e51371203dcab6cdb4bc00b1a.jpg', '', '0', '', '', 'no', '', 0),
(1, 'H. Stephen Stoker', 'Organic and Biological Chemistry', '572', '5', '1998', 'NA', '9b390041c8784a0d22515c4880891162.jpg', '', '0', '', '', 'no', '', 0),
(1, 'F. R. Jevons ', 'The Biochemical Approach to Life', '574.1/92', '5', '1968', 'NA', '2d9e17b377e37a5e940877684499084a.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Henry B. Bull', 'An Introduction to Physical Biochemistry', '574.19', '5', '1964', 'NA', 'ca5906302d431fa0904e9a6c5e05e890.png', '', '0', '', '', 'no', '', 0),
(1, 'Peter W. Price', 'Biological Evolution', '576.8', '5', '1996', 'NA', 'd4598cab77cc62ee9785911154ece564.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Marten Scheffer', 'Ecology of Shallow Lakes', '577.63', '5', '1998', 'Population and community biology series', '55cfb34d528ec922e158c3bb0f7d372d.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Peter Killips', 'A Guide to the Flora and Fauna of Goa', '578/.0954/799', '5', '1998', 'NA', '61001eef62f2c9d0642e3037e0bdb601.jpg', '', '0', '', '', 'no', '', 0),
(1, 'H. M. Burkhill', 'The Useful Plants of West Tropical Africa', '581.6/3/0966', '5', '1985', 'NA', '22c7ac3fb0c6b48c3fba64cd64260027.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Reid Moran', 'The Flora of Guadalupe Island, Mexico', '581.972/2', '5', '1996', 'Memoirs of the California Academy of Sciences', '84aba137935e98d7e353f6a70ba8fda8.jpg', '', '0', '', '', 'no', '', 0),
(1, 'M. Demerec', 'Biology of Drosophila', '595.77', '5', '1994', 'NA', 'de407aa46a5a2b7c58fce14d2522d65f.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Mark Swartz', 'Textbook of Physical Diagnosis', '616', '6', '2006', 'NA', '4ee37b83378cbd8917e561b52d3bbdda.jpg', '', '', '', '', 'no', '', 0),
(1, 'James L. Meriam', 'Statics', '620.1/03', '6', '2015', 'Engineering Mechanics', '2b538072037a7e7ed7985e7f80849267.png', '', '0', '', '', 'no', '', 0),
(0, 'R. C. Hibbeler', 'Engineering Mechanics. Dynamics', '620.1/04', '6', '1974', 'NA', '245718fc49f6c5721af551dfc4af2a04.jpg', '', '0', '', '', 'no', 'yes', 0),
(1, 'David Egerton', 'Strength of materials : a problem approach', '620.1/12', '6', '1980', 'NA', '6a5e235b08dfb750c38aa43f947a9327.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Peter P. Benham', 'Mechanics of Solids and Structures', '620.1/123', '6', '1973', 'NA', 'ebae78dbc64fd7979d0ca1e0b9d6d4ec.jpg', '', '0', '', '', 'no', '', 0),
(1, 'David Bell', 'Fundamentals of Electric Circuits', '621.319/2', '6', '2009', 'NA', '3a50fb98c4083b64315bd151e7791dea.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Albert Malvino', 'Electronic Principles', '621.381', '6', '1993', 'NA', '49a7676cbb3c9846f2cfe42f8398402c.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Michael D. Ciletti', 'Introduction to circuit analysis and design', '621.381/042', '6', '1988', 'HRW series in computer engineering', '1514dd19edff3b6ac19a11eeca8e44e3.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Albert Malvino', 'Digital Principles and Applications', '621.3815', '6', '1981', 'NA', 'e771226ae77bec05d8d34d15860f2d39.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Charles H. Roth', 'Fundamentals of Logic Design', '621.395', '6', '2014', 'NA', '6f40fc654d6d745046e039d825d9ce5c.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Joseph Edward Shigley', 'Theory of Machines and Mechanisms', '621.8', '6', '1995', 'McGraw-Hill series in mechanical engineering', 'fb7700a322d46ab8ea8a66728367a1dd.jpg', '', '0', '', '', 'no', '', 0),
(0, 'Wai-Fah Chen', 'The Civil Engineering Handbook', '624', '6', '2003', 'NA', 'afe7ab6e548346767c69084b4a8a354d.jpg', '', '0', '', '', 'no', 'yes', 0),
(1, 'Wai-Fah Chen', 'Handbook of structural engineering', '624.1', '6', '2005', 'NA', '644f2fb9e57a168eebe98f9292b267a0.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Feng Fu', 'Advanced Modelling Techniques in Structural Design', '624.1/70151', '6', '2015', 'NA', '0731c60e4e4a9a8109916c8456b09599.jpg', '', '0', '', '', 'no', '', 0),
(2, 'Edwin H. Gaylord', 'Design of Steel Structures', '624.1/821', '6', '1992', 'NA', '3dda6a182f002a959d37df19572d6a6c.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Arthur H. Nilsen', 'Design of Concrete Structures', '624.1/8341', '6', '1991', 'NA', 'dae22c17fda8cb938cf4a922cf81179d.jpg', '', '0', '', '', 'no', '', 0),
(2, 'Norman Nise', 'Control Systems', '629.8', '5', '1812', 'NA', 'c598f16227606f6370fa61e02e7a490a.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Sena S. De Silva', 'Tropical Mariculture', '639.8', '6', '1998', 'NA', '731bcc8bb91a7c26f4ccc6f8e65523ee.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Tracey Longo', '10 Minute Guide to Household Budgeting', '640/.42', '6', '1997', 'NA', '7ddb7b39d3032b3a52c58b53208c7dfc.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Alan Heaton', 'An Introduction to Industrial Chemistry', '660', '6', '1996', 'NA', 'a8f2eb4ec07fe7768c04e3c405cf0d73.jpg', '', '0', '', '', 'no', '', 0),
(1, 'Sandie Lea', 'The Encyclopedia of Candle Making Techniques', '745.593', '7', '1999', 'NA', '2b448d4e9b41bc5fd120003368ffddf6.jpg', '', '', '', '', 'no', '', 0),
(1, 'Malcolm Hayes', '40s and 50s, from War to Peace', '780', '7', '2003', 'NA', 'cb8938a19cbd373f4b6ceed785304d93.jpg', '', '', '', '', 'no', '', 0),
(1, 'Frederick Nolan', 'The Sound of their Music', '782.8', '7', 'Modern languages and literature', '1978', 'a5755424aa13effae1783d9dd469e10e.jpg', '', '', '', '', 'no', '', 0),
(1, 'Peter Krampert', 'The Encyclopedia of Harmonica', '788.8', '7', '1998', 'NA', 'eb05ea0e40cda643813acdbfbe19cb30.jpg', '', '', '', '', 'no', '', 0),
(1, 'Peter Dronke', 'The Medieval Lyric', '809', '8', '1975', 'NA', 'a0e1429f1bc49f8b792b5366e46aab7f.jpg', '', '', '', '', 'no', '', 0),
(1, 'Mark Twain', 'The Adventures of Huckleberry Finn', '813', '8', '1999', 'NA', '1b202841a9da56219eada3121eb59820.jpg', '', '', '', '', 'no', '', 0),
(1, 'Linda Ellis', 'Archaeological method and theory : an encyclopedia', '930.1', '9', '2000', 'Garland reference library of the humanities', 'cec9d39a38eb00c73f8edb2df6f2aa4b.jpg', '', '', '', '', 'no', '', 0),
(3, ' Daniel C. Hallin', 'Uncensored War: The Media and Vietnam', 'DS559.46.H351986', '5', '1986', '1', '684d19a2199cc0b8d61565bb3486fcfa.jpg', '', '0', '', '', 'no', '', 0),
(123, 'Lois Lowry', 'The Giver', 'fsdf23444', '2-A', 'December 2008', 'The Giver Quartet', 'c185ec6e126e85311ec9129ce1d1075b.jpg', '', '0', '', '', 'no', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `librarians`
--

CREATE TABLE `librarians` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `section` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librarians`
--

INSERT INTO `librarians` (`id`, `name`, `position`, `section`, `username`, `password`, `userImage`) VALUES
(19, 'Peter Portes', 'OIC', 'General', 'peteramiel', 'c8f94a18d1bd05144c364a15a621f627', 'download.png'),
(21, 'Steven Laurence Ballerda', 'OIC', 'General', 'mysteryslb', '350c9d901b7f1c73a481e240ec1b7c0b', 'download.png'),
(22, 'Blessie Cuevas', 'OIC', 'General', 'blessiecuevas', '6bf388e444e50687f4767468bb93bd1d', 'download.png'),
(23, 'Eloisa Mae G.Singsing', 'Librarian', 'Circulation', 'sasaxxx', 'cd8c937ed35bc38713bc20bbf1816ce7', 'download.png'),
(24, 'Emmanuel T. Sobrevega', 'OIC', 'Circulation', 'rk800', '8d06edc162991881e0c50fd225e6ffa3', 'download.png'),
(25, 'user reg', 'chief', 'circulation', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'download.png');

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE `list` (
  `Id` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `StudentNumber` varchar(255) NOT NULL,
  `College` varchar(255) NOT NULL,
  `Course` varchar(255) NOT NULL,
  `Date` datetime NOT NULL,
  `DateTrigger` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list`
--

INSERT INTO `list` (`Id`, `Name`, `StudentNumber`, `College`, `Course`, `Date`, `DateTrigger`) VALUES
(1, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2018-12-28 20:35:11', 0),
(2, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2018-12-28 20:35:20', 0),
(3, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2018-12-28 20:43:46', 0),
(4, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2018-12-28 20:43:52', 0),
(5, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2018-12-28 20:46:39', 0),
(6, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2018-12-28 22:35:39', 0),
(7, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2018-12-28 22:35:46', 0),
(8, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2018-12-28 22:36:45', 0),
(9, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2018-12-29 01:31:37', 0),
(10, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-12 00:15:17', 0),
(11, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-12 00:15:20', 0),
(12, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-12 00:15:28', 0),
(13, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2019-01-12 00:56:29', 0),
(14, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-12 00:59:44', 0),
(15, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-12 13:57:27', 0),
(16, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-17 14:40:40', 0),
(17, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2019-01-17 14:40:46', 0),
(18, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2019-01-17 15:10:35', 0),
(19, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2019-01-17 15:12:56', 0),
(20, 'Rich Ray C. Fortez', '201410340', 'CET', 'BSCPE', '2019-01-17 15:13:01', 0),
(21, 'Emmanuel T. Sobrevega', '201420486', 'CET', 'BSCPE', '2019-01-17 15:13:05', 0),
(22, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-17 15:13:10', 0),
(23, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-17 15:13:34', 0),
(24, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-17 15:13:36', 0),
(25, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-18 16:37:53', 0),
(26, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-31 18:42:14', 0),
(27, 'Rich Ray C. Fortez', '201410340', 'CET', 'BS CPE', '2019-01-31 18:42:23', 0),
(28, 'Blessie Gabrielle V. Cuevas', '201402417', 'CET', 'BS CPE', '2019-01-31 18:43:13', 0),
(29, 'Blessie Gabrielle V. Cuevas', '201402417', 'CET', 'BS CPE', '2019-01-31 18:43:15', 0),
(30, 'Karl Cedrick M. Villegas', '201410825', 'CET', 'BSCPE', '2019-01-31 18:43:21', 0),
(31, 'Steven Laurence B. Ballerda', '201410082', 'CET', 'BS CPE', '2019-01-31 18:43:23', 0),
(32, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-31 18:43:36', 0),
(33, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-31 18:43:43', 0),
(34, 'Steven Laurence B. Ballerda', '201410082', 'CET', 'BS CPE', '2019-01-31 18:43:52', 0),
(35, 'Steven Laurence B. Ballerda', '201410082', 'CET', 'BS CPE', '2019-01-31 18:43:55', 0),
(36, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 18:53:44', 0),
(37, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 18:58:41', 0),
(38, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 19:00:38', 0),
(39, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 19:01:32', 0),
(40, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 19:02:27', 0),
(41, 'Marc Reinhard C. Ballon', '201420047', 'CET', 'BS CPE', '2019-01-31 19:06:18', 0),
(42, 'Marc Reinhard C. Ballon', '201420047', 'CET', 'BS CPE', '2019-01-31 19:06:23', 0),
(43, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-31 19:06:49', 0),
(44, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-31 19:09:27', 0),
(45, 'Eloisa Mae G. Singsing', '201410740', 'College of Engineeri', 'BS CPE', '2019-01-31 19:09:31', 0),
(46, 'Eloisa Mae G. Singsing', '201410740', 'College of Engineeri', 'BS CPE', '2019-01-31 19:09:34', 0),
(47, 'Steven Laurence B. Ballerda', '201410082', 'CET', 'BS CPE', '2019-01-31 19:09:37', 0),
(48, 'Blessie Gabrielle V. Cuevas', '201402417', 'CET', 'BS CPE', '2019-01-31 19:09:59', 0),
(49, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 19:10:16', 0),
(50, 'Patrick Evangelio ', '201420660', 'CET', 'BSCPE', '2019-01-31 19:10:24', 0),
(51, 'Patrick Evangelio ', '201420660', 'CET', 'BSCPE', '2019-01-31 19:10:27', 0),
(52, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-31 19:10:31', 0),
(53, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-31 19:10:42', 0),
(54, 'Camille Bermundo', '201410116', 'CET', 'BSCPE', '2019-01-31 19:10:45', 0),
(55, 'Blessie Gabrielle V. Cuevas', '201402417', 'CET', 'BS CPE', '2019-01-31 19:11:14', 0),
(56, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 19:11:17', 0),
(57, 'Mark Stephen T. Fabon', '201402453', 'CET', 'BS CPE', '2019-01-31 19:11:32', 0),
(58, 'Lance Mendoza', '201420337', 'CET', 'BSCPE', '2019-01-31 19:53:23', 0),
(59, 'Janine Criztabel E. Ventura', '201410808', 'College of Engineeri', 'BS CPE', '2019-01-31 19:53:41', 0),
(60, 'Janine Criztabel E. Ventura', '201410808', 'College of Engineeri', 'BS CPE', '2019-01-31 19:53:45', 0),
(61, 'Noel T. Perido', '201402248', 'CET', 'BS CPE', '2019-01-31 19:53:49', 0),
(62, 'Jayson Franco', '201402134', 'CET', 'BSCPE', '2019-01-31 19:53:53', 0),
(63, 'Cristine Joyce Dimarucut', '201410289', 'CET', 'BS CPE', '2019-01-31 19:54:27', 0),
(64, 'Joshua Roi De Omana', '201410261', 'CET', 'BSCPE', '2019-01-31 19:54:30', 0),
(65, 'Marc Reinhard C. Ballon', '201420047', 'CET', 'BS CPE', '2019-01-31 19:54:32', 0),
(66, 'Edward K. Peralta', '201410603', 'CET', 'BS CPE', '2019-01-31 19:54:34', 0),
(67, 'Rich Ray C. Fortez', '201410340', 'CET', 'BS CPE', '2019-01-31 19:54:38', 0),
(68, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-31 19:54:41', 0),
(69, 'Steven Laurence B. Ballerda', '201410082', 'CET', 'BS CPE', '2019-01-31 19:54:43', 0),
(70, 'Camille Bermundo', '201410116', 'CET', 'BSCPE', '2019-01-31 19:54:45', 0),
(71, 'Blessie Gabrielle V. Cuevas', '201402417', 'CET', 'BS CPE', '2019-01-31 19:54:48', 0),
(72, 'Mark Stephen T. Fabon', '201402453', 'CET', 'BS CPE', '2019-01-31 19:54:51', 0),
(73, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 19:54:55', 0),
(74, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-31 19:54:58', 0),
(75, 'Mark Naf Rodaje', '201410672', 'CET', 'BSCPE', '2019-01-31 19:55:01', 0),
(76, 'Patrick Evangelio ', '201420660', 'CET', 'BSCPE', '2019-01-31 19:55:09', 0),
(77, 'Patrick Evangelio ', '201420660', 'CET', 'BSCPE', '2019-01-31 19:55:11', 0),
(78, 'Lance Mendoza', '201420337', 'CET', 'BSCPE', '2019-01-31 19:55:13', 0),
(79, 'Janine Criztabel E. Ventura', '201410808', 'College of Engineeri', 'BS CPE', '2019-01-31 19:55:15', 0),
(80, 'Noel T. Perido', '201402248', 'CET', 'BS CPE', '2019-01-31 19:55:18', 0),
(81, 'Jayson Franco', '201402134', 'CET', 'BSCPE', '2019-01-31 19:55:21', 0),
(82, 'Karl Cedrick M. Villegas', '201410825', 'CET', 'BSCPE', '2019-01-31 19:55:24', 0),
(83, 'Eloisa Mae G. Singsing', '201410740', 'College of Engineeri', 'BS CPE', '2019-01-31 19:55:26', 0),
(84, 'Cristine Joyce Dimarucut', '201410289', 'CET', 'BS CPE', '2019-01-31 20:08:34', 0),
(85, 'Cristine Joyce Dimarucut', '201410289', 'CET', 'BS CPE', '2019-01-31 20:08:43', 0),
(86, 'Joshua Roi De Omana', '201410261', 'CET', 'BSCPE', '2019-01-31 20:08:46', 0),
(87, 'Marc Reinhard C. Ballon', '201420047', 'CET', 'BS CPE', '2019-01-31 20:08:49', 0),
(88, 'Edward K. Peralta', '201410603', 'CET', 'BS CPE', '2019-01-31 20:08:51', 0),
(89, 'Rich Ray C. Fortez', '201410340', 'CET', 'BS CPE', '2019-01-31 20:08:53', 0),
(90, 'Peter Amiel N. Portes', '201410623', 'CET', 'BS CpE', '2019-01-31 20:08:57', 0),
(91, 'Steven Laurence B. Ballerda', '201410082', 'CET', 'BS CPE', '2019-01-31 20:08:59', 0),
(92, 'Camille Bermundo', '201410116', 'CET', 'BSCPE', '2019-01-31 20:09:02', 0),
(93, 'Blessie Gabrielle V. Cuevas', '201402417', 'CET', 'BS CPE', '2019-01-31 20:09:04', 0),
(94, 'Mark Stephen T. Fabon', '201402453', 'CET', 'BS CPE', '2019-01-31 20:09:07', 0),
(95, 'Ailene A. Guittap', '201410393', 'CET', 'BS CPE', '2019-01-31 20:09:09', 0),
(96, 'Emmanuel T. Sobrevega', '201420486', 'College of Engineeri', 'BS CPE', '2019-01-31 20:09:11', 0),
(97, 'Mark Naf Rodaje', '201410672', 'CET', 'BSCPE', '2019-01-31 20:09:13', 0),
(98, 'Patrick Evangelio ', '201420660', 'CET', 'BSCPE', '2019-01-31 20:09:15', 0),
(99, 'Lance Mendoza', '201420337', 'CET', 'BSCPE', '2019-01-31 20:09:17', 0),
(100, 'Janine Criztabel E. Ventura', '201410808', 'College of Engineeri', 'BS CPE', '2019-01-31 20:09:20', 0),
(101, 'Noel T. Perido', '201402248', 'CET', 'BS CPE', '2019-01-31 20:09:22', 0),
(102, 'Jayson Franco', '201402134', 'CET', 'BSCPE', '2019-01-31 20:09:24', 0),
(103, 'Karl Cedrick M. Villegas', '201410825', 'CET', 'BSCPE', '2019-01-31 20:09:26', 0),
(104, 'Eloisa Mae G. Singsing', '201410740', 'College of Engineeri', 'BS CPE', '2019-01-31 20:09:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `missingbook`
--

CREATE TABLE `missingbook` (
  `Id` int(11) NOT NULL,
  `bookTitle` varchar(255) NOT NULL,
  `callNumber` varchar(50) NOT NULL,
  `missing` varchar(3) NOT NULL,
  `EPC` varchar(255) NOT NULL,
  `borrowed` varchar(3) NOT NULL,
  `detected` text NOT NULL,
  `location` varchar(10) NOT NULL,
  `available` int(3) NOT NULL,
  `bookAuthor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `missingbook`
--

INSERT INTO `missingbook` (`Id`, `bookTitle`, `callNumber`, `missing`, `EPC`, `borrowed`, `detected`, `location`, `available`, `bookAuthor`) VALUES
(1, 'Thermodynamics', ' 541.3/69', '0', '77 69 30 00 E2 00 00 19 94 09 01 12 21 50 4C 9C ', 'no', 'no', '', 0, ''),
(2, 'The Encyclopedia of Candle Making Techniques', ' 745.593', '0', '', 'no', 'no', '', 0, ''),
(3, 'fasd', '1111', '0', '', '', '', '', 0, ''),
(4, 'After the Downfall', '2017', '0', '', '', '', '', 0, ''),
(5, '20th Century theology : God & the world in a trans', '230', '0', '', '', '', '', 0, ''),
(6, '15 Minutes Alone With God', '242', '0', '', '', '', '', 0, ''),
(7, '1001 Ways to Help your Child Walk With God', '248.8', '0', '6B F7 34 00 E2 00 00 19 94 09 00 66 21 50 25 1D ', 'no', 'no', '', 0, ''),
(8, 'According to the Pattern', '270.8', '0', '', '', '', '', 0, ''),
(9, 'The Governance of Science : Ideology and the Futur', '303.48', '0', '', '', '', '', 0, ''),
(10, '50 great myths of Human Sexuality', '306', '0', '', '', '', '', 0, ''),
(11, 'Sri Lanka, Problems of governance', '320.95', '0', '', '', '', '', 0, ''),
(12, 'Volatility : Practical Options Theory', '332.64', '0', '', '', '', '', 0, ''),
(13, 'A Practical Guide to Finance and Budgeting : Skill', '362.17', '0', '', '', '', '', 0, ''),
(14, 'Natural science : Bridging the Gaps', '500', '0', '', '', '', '', 0, ''),
(15, 'Solid Geometry and Mensuration', '513.3', '0', '', '', '', '', 0, ''),
(16, 'Numerical methods for differential equations : fun', '515/.35', '0', '', '', '', '', 0, ''),
(17, 'Elementary Differential Equations', '517/.38', '0', '', '', '', '', 0, ''),
(18, 'Earth and Space', '520', '0', '', '', '', '', 0, ''),
(19, 'Fundamentals of Radio Astronomy:Astrophysics', '522/.682', '0', '', '', '', '', 0, ''),
(20, 'Astrophysics for People in a Hurry', '523.01', '0', '', '', '', '', 0, ''),
(21, 'Cosmic Perspective', '523.1', '0', '', '', '', '', 0, ''),
(22, 'Stars and Stellar Processes', '523.8/6', '0', '', '', '', '', 0, ''),
(23, 'Physics for Scientists and Engineers', '530', '0', '', '', '', '', 0, ''),
(24, 'The Cosmic Code : Quantum Physics as the Language ', '530.1/2', '0', '', '', '', '', 0, ''),
(25, 'Symmetry Principles in Quantum Physics', '530.12', '0', '', 'yes', '', '', 0, ''),
(26, 'Essentials of Engineering Fluid Mechanics', '532', '0', '', '', '', '', 0, ''),
(27, 'General Chemistry : Principles and Modern Applicat', '540', '0', '', '', '', '', 0, ''),
(28, 'Introduction to Organic Chemistry', '547', '0', '', '', '', '', 0, ''),
(29, 'Problems in Organic Chemistry', '547.0761', '0', '', '', '', '', 0, ''),
(30, 'A Practical Organic Chemistry', '547/.0028', '0', '', '', '', '', 0, ''),
(31, 'Organic and Biological Chemistry', '572', '0', '', '', '', '', 0, ''),
(32, 'The Biochemical Approach to Life', '574.1/92', '0', '', '', '', '', 0, ''),
(33, 'An Introduction to Physical Biochemistry', '574.19', '0', '', '', '', '', 0, ''),
(34, 'Biological Evolution', '576.8', '0', '', '', '', '', 0, ''),
(35, 'Ecology of Shallow Lakes', '577.63', '0', '', '', '', '', 0, ''),
(36, 'A Guide to the Flora and Fauna of Goa', '578/.0954/799', '0', '', '', '', '', 0, ''),
(37, 'The Useful Plants of West Tropical Africa', '581.6/3/0966', '0', '', 'yes', '', '', 0, ''),
(38, 'The Flora of Guadalupe Island, Mexico', '581.972/2', '0', '', 'yes', '', '', 0, ''),
(39, 'Biology of Drosophila', '595.77', '0', '', '', '', '', 0, ''),
(40, 'Textbook of Physical Diagnosis', '616', '0', '', '', '', '', 0, ''),
(41, 'Statics', '620.1/03', '0', '', 'yes', '', '', 0, ''),
(42, 'Engineering Mechanics. Dynamics', '620.1/04', '0', '', '', '', '', 0, ''),
(43, 'Strength of materials : a problem approach', '620.1/12', '0', '', 'no', 'no', '', 0, ''),
(44, 'Mechanics of Solids and Structures', '620.1/123', '0', '', 'no', 'no', '', 0, ''),
(45, 'Electrical engineering : Principles and Applicatio', '621.3', '0', '', '', '', '', 0, ''),
(46, 'Fundamentals of Electric Circuits', '621.319/2', '0', '', '', '', '', 0, ''),
(47, 'Electronic Principles', '621.381', '0', '', '', '', '', 0, ''),
(48, 'Introduction to circuit analysis and design', '621.381/042', '0', '', '', '', '', 0, ''),
(49, 'Digital Principles and Applications', '621.3815', '0', '', '', '', '', 0, ''),
(50, 'Fundamentals of Logic Design', '621.395', '0', '', '', '', '', 0, ''),
(51, 'Theory of Machines and Mechanisms', '621.8', '0', '', 'no', 'no\r\n', '', 0, ''),
(52, 'The Civil Engineering Handbook', '624', '0', '', '', '', '', 0, ''),
(53, 'Handbook of structural engineering', '624.1', '0', '', '', '', '', 0, ''),
(54, 'Advanced Modelling Techniques in Structural Design', '624.1/70151', '0', '', '', '', '', 0, ''),
(55, 'Design of Steel Structures', '624.1/821', '0', '', '', '', '', 0, ''),
(56, 'Design of Concrete Structures', '624.1/8341', '0', '', '', '', '', 0, ''),
(57, 'Control Systems', '629.8', '0', '', '', '', '', 0, ''),
(58, 'Tropical Mariculture', '639.8', '0', '', 'yes', '', '', 0, ''),
(59, '10 Minute Guide to Household Budgeting', '640/.42', '0', '', '', '', '', 0, ''),
(60, 'An Introduction to Industrial Chemistry', '660', '0', '', '', '', '', 0, ''),
(61, 'Inroduction to Chemical Engineering: Tools for Tod', '660.2', '0', '', '', '', '', 0, ''),
(62, '40s and 50s, from War to Peace', '780', '0', '', 'yes', 'no', '', 0, ''),
(63, 'The Sound of their Music', '782.8', '0', '', '', '', '', 0, ''),
(64, 'The Encyclopedia of Harmonica', '788.8', '0', '', '', '', '', 0, ''),
(65, 'The Medieval Lyric', '809', '0', '', 'yes', '', '', 0, ''),
(66, 'The Adventures of Huckleberry Finn', '813', '0', '', 'yes', '', '', 0, ''),
(67, 'Archaeological method and theory : an encyclopedia', '930.1', '0', '', '', '', '', 0, ''),
(68, 'Uncensored War: The Media and Vietnam', 'DS559.46 .H35 1986', '0', '', '', '', '', 0, ''),
(69, 'The Giver', 'fsdf23444', '0', '', 'yes', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `bookTitle` varchar(50) NOT NULL,
  `queueNumber` int(10) NOT NULL,
  `queueTrigger` int(1) NOT NULL DEFAULT '1',
  `Location` varchar(10) NOT NULL,
  `borrower` varchar(50) NOT NULL,
  `queueHere` int(1) NOT NULL DEFAULT '1',
  `Id` int(11) NOT NULL,
  `callNumber` varchar(50) NOT NULL,
  `studentNumber` varchar(10) NOT NULL,
  `dataBorrowed` datetime NOT NULL,
  `dateReturned` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`bookTitle`, `queueNumber`, `queueTrigger`, `Location`, `borrower`, `queueHere`, `Id`, `callNumber`, `studentNumber`, `dataBorrowed`, `dateReturned`) VALUES
('Cosmic Perspective', 2, 0, '6', 'Rich Ray C. Fortez', 0, 1, '523.1', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 2, 0, '5', 'Rich Ray C. Fortez', 0, 2, ' 541.3/69', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Encyclopedia of Candle Making Techniques', 2, 0, '7', 'Rich Ray C. Fortez', 0, 3, ' 745.593', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('20th Century theology : God & the world in a trans', 3, 0, '2', 'Emmanuel T. Sobrevega', 0, 4, '230', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('15 Minutes Alone With God', 3, 0, '2', 'Emmanuel T. Sobrevega', 0, 5, '242', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Biochemical Approach to Life', 4, 0, '5', 'Rich Ray C. Fortez', 0, 6, '574.1/92', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('An Introduction to Physical Biochemistry', 4, 0, '5', 'Rich Ray C. Fortez', 0, 7, '574.19', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1001 Ways to Help your Child Walk With God', 5, 0, '2', 'Emmanuel T. Sobrevega', 0, 8, '248.8', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('According to the Pattern', 5, 0, '2', 'Emmanuel T. Sobrevega', 0, 9, '270.8', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('100 Artists who changed the World', 6, 0, '7', 'Emmanuel T. Sobrevega', 0, 10, '709', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('40s and 50s, from War to Peace', 6, 0, '7', 'Emmanuel T. Sobrevega', 0, 11, '780', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Medieval Lyric', 7, 0, '8', 'Emmanuel T. Sobrevega', 0, 12, '809', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Adventures of Huckleberry Finn', 7, 0, '8', 'Emmanuel T. Sobrevega', 0, 13, '813', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Strength of materials : a problem approach', 8, 0, '6', 'Emmanuel T. Sobrevega', 0, 14, '620.1/12', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Mechanics of Solids and Structures', 8, 0, '6', 'Emmanuel T. Sobrevega', 0, 15, '620.1/123', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Useful Plants of West Tropical Africa', 9, 0, '5', 'Emmanuel T. Sobrevega', 0, 16, '581.6/3/0966', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Flora of Guadalupe Island, Mexico', 9, 0, '5', 'Emmanuel T. Sobrevega', 0, 17, '581.972/2', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Statics', 10, 0, '6', 'Emmanuel T. Sobrevega', 0, 18, '620.1/03', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Giver', 10, 0, '2-A', 'Emmanuel T. Sobrevega', 0, 19, '0-553-57133-8', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Giver', 10, 0, '2-A', 'Emmanuel T. Sobrevega', 0, 20, 'fsdf23444', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 10, 0, '5', 'Emmanuel T. Sobrevega', 0, 22, ' 541.3/69', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Tropical Mariculture', 10, 0, '6', 'Emmanuel T. Sobrevega', 0, 23, '639.8', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Symmetry Principles in Quantum Physics', 10, 0, '5', 'Emmanuel T. Sobrevega', 0, 24, '530.12', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Theory of Machines and Mechanisms', 11, 1, '6', 'Emmanuel T. Sobrevega', 0, 25, '621.8', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Civil Engineering Handbook', 11, 1, '6', 'Emmanuel T. Sobrevega', 0, 26, '624', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 12, 0, '5', 'Rich Ray C. Fortez', 0, 27, ' 541.3/69', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Encyclopedia of Candle Making Techniques', 12, 0, '7', 'Rich Ray C. Fortez', 0, 28, ' 745.593', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 13, 1, '5', 'Rich Ray C. Fortez', 0, 29, ' 541.3/69', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('15 Minutes Alone With God', 14, 1, '2', 'Rich Ray C. Fortez', 0, 30, '242', '201410340 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 15, 1, '5', 'Emmanuel T. Sobrevega', 0, 31, ' 541.3/69', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('After the Downfall', 15, 1, '8', 'Emmanuel T. Sobrevega', 0, 32, '2017', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('20th Century theology : God & the world in a trans', 15, 1, '2', 'Emmanuel T. Sobrevega', 0, 33, '230', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 16, 1, '5', 'Emmanuel T. Sobrevega', 0, 34, ' 541.3/69', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('15 Minutes Alone With God', 16, 1, '2', 'Emmanuel T. Sobrevega', 0, 35, '242', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1001 Ways to Help your Child Walk With God', 16, 1, '2', 'Emmanuel T. Sobrevega', 0, 36, '248.8', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 17, 1, '5', 'Emmanuel T. Sobrevega', 0, 37, ' 541.3/69', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('15 Minutes Alone With God', 17, 1, '2', 'Emmanuel T. Sobrevega', 0, 38, '242', '201420486 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Thermodynamics', 18, 0, '5', 'Eloisa Mae G. Singsing', 0, 39, ' 541.3/69', '201410740 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('The Civil Engineering Handbook', 18, 0, '6', 'Eloisa Mae G. Singsing', 0, 40, '624', '201410740 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('Engineering Mechanics. Dynamics', 18, 0, '6', 'Eloisa Mae G. Singsing', 0, 41, '620.1/04', '201410740 ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `recent_activity`
--

CREATE TABLE `recent_activity` (
  `action_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `item_detail` varchar(100) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `dateTime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recent_activity`
--

INSERT INTO `recent_activity` (`action_id`, `action`, `item_code`, `item_detail`, `userName`, `role`, `dateTime`) VALUES
(1, 'Delete Book', 'fds', '', 'admin', 'admin', 'Monday 9:40 PM December 31, 2018'),
(2, 'Delete Book', 'ds', '', 'admin', 'admin', 'Monday 9:45 PM December 31, 2018'),
(3, 'Delete Book', 'ds', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(4, 'Delete Book', 'sdf', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(5, 'Delete Book', 'adf', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(6, 'Delete Book', 'gsdfgdsfgwqt', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(7, 'Delete Book', 'sdfgtert345', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(8, 'Delete Book', 'asdfas', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(9, 'Delete Book', 'asdffasdf2', '', 'admin', 'admin', 'Monday 9:46 PM December 31, 2018'),
(10, 'Delete Book', 'sdfgerwt4354tsdrg', '', 'admin', 'admin', 'Monday 9:47 PM December 31, 2018'),
(11, 'Delete Book', 'asdf23', '', 'admin', 'admin', 'Monday 9:47 PM December 31, 2018'),
(12, 'Delete Book', '0-553-57133-8', '', 'admin', 'admin', 'Monday 9:47 PM December 31, 2018'),
(13, 'Delete Book', 'asdfqwerqerwqer', '', 'admin', 'admin', 'Monday 9:48 PM December 31, 2018'),
(14, 'Add Librarian', 'mysteryslb', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Thursday 5:51 PM January 17, 2019'),
(15, 'Add Librarian', 'blessiecuevas', 'Blessie Cuevas in General', 'admin', 'admin', 'Friday 7:50 AM January 18, 2019'),
(16, 'Add Librarian', 'lino', 'Lino in General', 'admin', 'admin', 'Friday 7:52 AM January 18, 2019'),
(17, 'Add Librarian', 'marcballon', 'Marc Reinhard C. Ballon in General', 'admin', 'admin', 'Friday 8:16 AM January 18, 2019'),
(18, 'Edit Student', '2014000000', 'Peter Amiel N. Portes by BS CpE', 'admin', 'admin', 'Saturday 11:08 PM January 19, 2019'),
(19, 'Edit Student', '201410623', 'Peter Amiel N. Portes by BS CpE', 'admin', 'admin', 'Saturday 11:09 PM January 19, 2019'),
(20, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Saturday 11:48 PM January 19, 2019'),
(21, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Saturday 11:52 PM January 19, 2019'),
(22, 'Edit Student', '201410623', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Sunday 2:43 PM January 20, 2019'),
(23, 'Add Librarian', 'Lino', 'Lino in General', 'admin', 'admin', 'Monday 9:37 PM January 21, 2019'),
(24, 'Delete Librarian', 'Lino', 'Lino in General', 'admin', 'admin', 'Monday 9:44 PM January 21, 2019'),
(25, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Monday 9:53 PM January 21, 2019'),
(26, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Monday 9:54 PM January 21, 2019'),
(27, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Monday 9:56 PM January 21, 2019'),
(28, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Monday 9:58 PM January 21, 2019'),
(29, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Monday 9:58 PM January 21, 2019'),
(30, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', '', 'admin', 'Monday 10:09 PM January 21, 2019'),
(31, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 10:18 AM January 22, 2019'),
(32, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 10:24 AM January 22, 2019'),
(33, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 10:27 AM January 22, 2019'),
(34, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 10:29 AM January 22, 2019'),
(35, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 10:29 AM January 22, 2019'),
(36, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 10:29 AM January 22, 2019'),
(37, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:18 AM January 22, 2019'),
(38, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:19 AM January 22, 2019'),
(39, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:20 AM January 22, 2019'),
(40, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:21 AM January 22, 2019'),
(41, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:22 AM January 22, 2019'),
(42, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:23 AM January 22, 2019'),
(43, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:24 AM January 22, 2019'),
(44, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:25 AM January 22, 2019'),
(45, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:27 AM January 22, 2019'),
(46, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 11:27 AM January 22, 2019'),
(47, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Tuesday 2:58 PM January 22, 2019'),
(48, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Wednesday 10:53 PM January 23, 2019'),
(49, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Wednesday 10:55 PM January 23, 2019'),
(50, 'Edit Student', '2014000000', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Wednesday 10:55 PM January 23, 2019'),
(51, 'Edit Student', '201410623', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Wednesday 10:56 PM January 23, 2019'),
(52, 'Edit Admin', '', ' in ', 'admin', 'admin', 'Wednesday 11:16 PM January 23, 2019'),
(53, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Wednesday 11:17 PM January 23, 2019'),
(54, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Wednesday 11:17 PM January 23, 2019'),
(55, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Wednesday 11:20 PM January 23, 2019'),
(56, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Wednesday 11:23 PM January 23, 2019'),
(57, 'Edit Admin', '3', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Wednesday 11:26 PM January 23, 2019'),
(58, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Thursday 7:57 AM January 24, 2019'),
(59, 'Add Student', '201420029', 'Pauline Denise E. Aquino - BS CPE', 'admin', 'admin', 'Thursday 8:02 AM January 24, 2019'),
(60, 'Add Student', '201420047', 'Marc Reinhard C. Ballon - BS CPE', 'admin', 'admin', 'Thursday 8:12 AM January 24, 2019'),
(61, 'Add Student', '201410116', 'Camille P. Bermundo - BS CPE', 'admin', 'admin', 'Thursday 8:15 AM January 24, 2019'),
(62, 'Add Student', '201410261', 'Joshua Roi C. De OmaÃ±a - BS CPE', 'admin', 'admin', 'Thursday 8:20 AM January 24, 2019'),
(63, 'Add Student', '201410289', 'Cristine Joyce D. Dimarucut - BS CPE', 'admin', 'admin', 'Thursday 8:21 AM January 24, 2019'),
(64, 'Add Student', '201410340', 'Rich Ray C. Fortez - BS CPE', 'admin', 'admin', 'Thursday 8:23 AM January 24, 2019'),
(65, 'Add Student', '201402134', 'Jayson C. Franco - BS CPE', 'admin', 'admin', 'Thursday 8:24 AM January 24, 2019'),
(66, 'Edit Student', '201410261', 'Joshua Roi De Omana in BSCPE', 'admin', 'admin', 'Thursday 8:27 AM January 24, 2019'),
(67, 'Edit Student', '201410116', 'Camille Bermundo in BSCPE', 'admin', 'admin', 'Thursday 8:28 AM January 24, 2019'),
(68, 'Edit Student', '201402134', 'Jayson Franco in BSCPE', 'admin', 'admin', 'Thursday 8:28 AM January 24, 2019'),
(69, 'Edit Student', '201402248', 'Noel T. Perido in BSCPE', 'admin', 'admin', 'Thursday 8:29 AM January 24, 2019'),
(70, 'Edit Student', '201410289', 'Cristine Joyce Dimarucut in BS', 'admin', 'admin', 'Thursday 8:29 AM January 24, 2019'),
(71, 'Edit Student', '201410340', 'Rich Ray C. Fortez in BSCPE', 'admin', 'admin', 'Thursday 8:29 AM January 24, 2019'),
(72, 'Edit Student', '201410808', 'Janine Criztabel E. Ventura in BSCPE', 'admin', 'admin', 'Thursday 8:30 AM January 24, 2019'),
(73, 'Edit Student', '201402069', 'Aurea Lea E. Caliste in BS CPE', 'admin', 'admin', 'Thursday 8:31 AM January 24, 2019'),
(74, 'Edit Student', '201402134', 'Jayson Franco in BSCPE', 'admin', 'admin', 'Thursday 8:31 AM January 24, 2019'),
(75, 'Edit Student', '201402248', 'Noel T. Perido in BSCPE', 'admin', 'admin', 'Thursday 8:32 AM January 24, 2019'),
(76, 'Edit Student', '201402417', 'Blessie Gabrielle V. Cuevas in BS CPE', 'admin', 'admin', 'Thursday 8:32 AM January 24, 2019'),
(77, 'Edit Student', '201402453', 'Mark Stephen T. Fabon in BSCPE', 'admin', 'admin', 'Thursday 8:32 AM January 24, 2019'),
(78, 'Edit Student', '201410082', 'Steven Laurence B. Ballerda in BS CPE', 'admin', 'admin', 'Thursday 8:32 AM January 24, 2019'),
(79, 'Edit Student', '201410090', 'James Christopher P. Barcial in BS CPE', 'admin', 'admin', 'Thursday 8:33 AM January 24, 2019'),
(80, 'Edit Student', '201410116', 'Camille Bermundo in BSCPE', 'admin', 'admin', 'Thursday 8:33 AM January 24, 2019'),
(81, 'Edit Student', '201410143', 'Christian P. Cabading in BS CPE', 'admin', 'admin', 'Thursday 8:33 AM January 24, 2019'),
(82, 'Edit Student', '201410261', 'Joshua Roi De Omana in BSCPE', 'admin', 'admin', 'Thursday 8:33 AM January 24, 2019'),
(83, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Thursday 8:55 AM January 24, 2019'),
(84, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Thursday 8:57 AM January 24, 2019'),
(85, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Thursday 8:59 AM January 24, 2019'),
(86, 'Edit Admin', '2', 'Steven Laurence Ballerda in General', 'admin', 'admin', 'Thursday 9:00 AM January 24, 2019'),
(87, 'Edit Book', '', ' by ', 'mysteryslb', 'admin', 'Thursday 10:53 AM January 24, 2019'),
(88, 'Edit Book', '', ' by ', 'mysteryslb', 'admin', 'Thursday 10:53 AM January 24, 2019'),
(89, 'Edit Book', '640/.42', '10 Minute Guide to Household Budgeting by Tracey Longo', 'mysteryslb', 'admin', 'Thursday 10:55 AM January 24, 2019'),
(90, 'Edit Book', '362.17', 'A Practical Guide to Finance and Budgeting : Skill by KT Waxman', 'mysteryslb', 'admin', 'Thursday 10:55 AM January 24, 2019'),
(91, 'Edit Book', '332.64', 'Volatility : Practical Options Theory by Adam S. Iqbal', 'mysteryslb', 'admin', 'Thursday 10:55 AM January 24, 2019'),
(92, 'Edit Book', '242', '15 Minutes Alone With God by Emilie Barnes', 'mysteryslb', 'admin', 'Thursday 10:56 AM January 24, 2019'),
(93, 'Edit Student', '201410289', 'Cristine Joyce Dimarucut in BS CPE', 'admin', 'admin', 'Thursday 10:57 AM January 24, 2019'),
(94, 'Edit Student', '201410340', 'Rich Ray C. Fortez in BSCPE', 'admin', 'admin', 'Thursday 10:57 AM January 24, 2019'),
(95, 'Edit Student', '201410393', 'Ailene A. Guittap in BSCPE', 'admin', 'admin', 'Thursday 10:58 AM January 24, 2019'),
(96, 'Edit Student', '201410603', 'Edward K. Peralta in BSCPE', 'admin', 'admin', 'Thursday 10:59 AM January 24, 2019'),
(97, 'Edit Student', '201410672', 'Mark Naf Rodaje in BSCPE', 'admin', 'admin', 'Thursday 11:00 AM January 24, 2019'),
(98, 'Edit Student', '201420047', 'Marc Reinhard C. Ballon in BSCPE', 'admin', 'admin', 'Thursday 11:01 AM January 24, 2019'),
(99, 'Edit Book', '242', '15 Minutes Alone With God by Emilie Barnes', 'mysteryslb', 'admin', 'Thursday 11:01 AM January 24, 2019'),
(100, 'Edit Book', '242', '15 Minutes Alone With God by Emilie Barns', 'mysteryslb', 'admin', 'Thursday 11:01 AM January 24, 2019'),
(101, 'Edit Student', '201410825', 'Karl Cedrick M. Villegas in BSCPE', 'admin', 'admin', 'Thursday 11:02 AM January 24, 2019'),
(102, 'Edit Student', '201410623', 'Peter Amiel N. Portes in BS CpE', 'admin', 'admin', 'Thursday 11:14 AM January 24, 2019'),
(103, 'Edit Student', '201410825', 'Karl Cedrick M. Villegas in BSCPE', 'admin', 'admin', 'Thursday 11:15 AM January 24, 2019'),
(104, 'Add Student', '201420337', 'Lance Albert A. Mendoza - BS CPE', 'admin', 'admin', 'Thursday 11:26 AM January 24, 2019'),
(105, 'Add Announcement', '0', 'PLEASE READ', 'mysteryslb', 'admin', 'Thursday 11:48 AM January 24, 2019'),
(106, 'Add Announcement', '0', 'NO PICTURE', 'mysteryslb', 'admin', 'Thursday 11:50 AM January 24, 2019'),
(107, 'Add Announcement', '0', 'Delete this', 'admin', 'admin', 'Friday 1:54 PM January 25, 2019'),
(108, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 4:49 PM January 31, 2019'),
(109, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 4:50 PM January 31, 2019'),
(110, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 4:50 PM January 31, 2019'),
(111, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 4:50 PM January 31, 2019'),
(112, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:07 PM January 31, 2019'),
(113, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:10 PM January 31, 2019'),
(114, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:12 PM January 31, 2019'),
(115, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:12 PM January 31, 2019'),
(116, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:13 PM January 31, 2019'),
(117, 'Add Librarian', 'peteramiel', 'Peter Portes in General', 'peteramiel', 'admin', 'Thursday 5:13 PM January 31, 2019'),
(118, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:23 PM January 31, 2019'),
(119, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:23 PM January 31, 2019'),
(120, 'Edit Account', '19', 'Peter Amiel N. Portes in General', 'peteramiel', 'librarian', 'Thursday 5:35 PM January 31, 2019'),
(121, 'Edit Student', '201402069', 'Aurea Lea E. Caliste in BS CPE', 'admin', 'admin', 'Friday 8:51 AM February 1, 2019'),
(122, 'Edit Book', '640/.42', '10 Minute Guide to Household Budgeting by Tracey Longo', 'admin', 'admin', 'Friday 8:55 AM February 1, 2019'),
(123, 'Add Librarian', 'sasaxxx', 'Eloisa Mae G.Singsing in Circulation', 'admin', 'admin', 'Friday 9:16 PM February 1, 2019'),
(124, 'Edit Book', '640/.42', '10 Minute Guide to Household Budgeting by Tracey Longo', 'admin', 'admin', 'Saturday 12:12 AM February 2, 2019'),
(125, 'Add Librarian', 'rk800', 'Emmanuel T. Sobrevega in Circulation', 'admin', 'admin', 'Saturday 2:22 PM February 2, 2019'),
(126, 'Edit Student', '201420486', 'Emmanuel T. Sobrevega in BS CPE', 'admin', 'admin', 'Saturday 2:24 PM February 2, 2019'),
(127, 'Add Announcement', '0', 'Hello\r\nThis is a test', 'admin', 'admin', 'Saturday 4:39 PM February 2, 2019'),
(128, 'Add Announcement', '0', 'Hello\r\nThis is a test', 'admin', 'admin', 'Saturday 4:40 PM February 2, 2019'),
(129, 'Add Announcement', '0', 'Hello\r\nThis is a test', 'admin', 'admin', 'Saturday 4:40 PM February 2, 2019'),
(130, 'Add Announcement', '0', 'asdf', 'admin', 'admin', 'Saturday 4:43 PM February 2, 2019'),
(131, 'Add Librarian', 'user', 'user reg in circulation', 'admin', 'admin', 'Saturday 9:44 PM February 2, 2019'),
(132, 'Edit Student', '201410740', 'Eloisa Mae G. Singsing in BS CPE', 'admin', 'admin', 'Saturday 9:49 PM February 2, 2019'),
(133, 'Edit Student', '201410808', 'Janine Criztabel E. Ventura in BS CPE', 'admin', 'admin', 'Saturday 9:49 PM February 2, 2019'),
(134, 'Edit Student', '201420029', 'Pauline Denise E. Aquino in BS CPE', 'admin', 'admin', 'Saturday 9:49 PM February 2, 2019'),
(135, 'Edit Book', '640/.42', '10 Minute Guide to Household Budgeting by Tracey Longo', 'mysteryslb', 'admin', 'Sunday 8:43 AM February 3, 2019'),
(136, 'Edit Book', '248.8', '1001 Ways to Help your Child Walk With God by Kathie Reimer', 'mysteryslb', 'admin', 'Sunday 8:43 AM February 3, 2019'),
(137, 'Edit Book', '578/.0954/799', 'A Guide to the Flora and Fauna of Goa by Peter Killips', 'mysteryslb', 'admin', 'Sunday 8:43 AM February 3, 2019'),
(138, 'Edit Book', '547/.0028', 'A Practical Organic Chemistry by D. C. Firth', 'mysteryslb', 'admin', 'Sunday 8:44 AM February 3, 2019'),
(139, 'Edit Book', '640/.42', '10 Minute Guide to Household Budgeting by Tracey Longo', 'mysteryslb', 'admin', 'Sunday 8:49 AM February 3, 2019'),
(140, 'Edit Book', '248.8', '1001 Ways to Help your Child Walk With God by Kathie Reimer', 'mysteryslb', 'admin', 'Sunday 8:49 AM February 3, 2019'),
(141, 'Edit Book', '242', '15 Minutes Alone With God by Emilie Barnes', 'mysteryslb', 'admin', 'Sunday 8:49 AM February 3, 2019'),
(142, 'Edit Book', '230', '20th Century theology : God & the world in a trans by Stanley J. Grenz', 'mysteryslb', 'admin', 'Sunday 8:49 AM February 3, 2019'),
(143, 'Edit Book', '780', '40s and 50s, from War to Peace by Malcolm Hayes', 'mysteryslb', 'admin', 'Sunday 8:49 AM February 3, 2019'),
(144, 'Edit Book', '306', '50 great myths of Human Sexuality by Pepper Schwartz', 'mysteryslb', 'admin', 'Sunday 8:49 AM February 3, 2019'),
(145, 'Edit Book', '624.1/8341', 'Design of Concrete Structures by Arthur H. Nilsen', 'mysteryslb', 'admin', 'Sunday 8:50 AM February 3, 2019'),
(146, 'Edit Book', '620.1/123', 'Mechanics of Solids and Structures by Peter P. Benham', 'mysteryslb', 'admin', 'Sunday 8:50 AM February 3, 2019'),
(147, 'Edit Book', '547.0761', 'Problems in Organic Chemistry by Ernest Huntress', 'mysteryslb', 'admin', 'Sunday 8:51 AM February 3, 2019'),
(148, 'Edit Book', '332.64', 'Volatility : Practical Options Theory by Adam S. Iqbal', 'admin', 'admin', 'Sunday 8:53 AM February 3, 2019'),
(149, 'Edit Book', 'DS559.46 .H35 1986', 'Uncensored War: The Media and Vietnam by  Daniel C. Hallin', 'admin', 'admin', 'Sunday 8:53 AM February 3, 2019'),
(150, 'Edit Book', '639.8', 'Tropical Mariculture by Sena S. De Silva', 'admin', 'admin', 'Sunday 8:53 AM February 3, 2019'),
(151, 'Edit Book', '270.8', 'According to the Pattern by Clarence Summy', 'admin', 'admin', 'Sunday 8:54 AM February 3, 2019'),
(152, 'Delete Book', '621.3', 'Electrical engineering : Principles and Applicatio by Allan R. Hambley', 'admin', 'admin', 'Sunday 9:26 AM February 3, 2019'),
(153, 'Delete Book', '540', 'General Chemistry : Principles and Modern Applicat by Ralph Petrucci', 'admin', 'admin', 'Sunday 9:26 AM February 3, 2019'),
(154, 'Delete Book', '660.2', 'Inroduction to Chemical Engineering: Tools for Tod by Kenneth A. Solen', 'admin', 'admin', 'Sunday 9:26 AM February 3, 2019');

-- --------------------------------------------------------

--
-- Table structure for table `search_page`
--

CREATE TABLE `search_page` (
  `id` int(50) NOT NULL,
  `sectionTitle` varchar(50) NOT NULL,
  `available` varchar(10) NOT NULL,
  `bookAuthor` varchar(50) NOT NULL,
  `bookTitle` varchar(50) NOT NULL,
  `callNumber` varchar(50) NOT NULL,
  `location` varchar(10) NOT NULL,
  `publishDate` varchar(20) NOT NULL,
  `series` varchar(50) NOT NULL,
  `uniqueId` varchar(50) NOT NULL,
  `shelfPosition` varchar(50) NOT NULL,
  `shelfLayer` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search_page`
--

INSERT INTO `search_page` (`id`, `sectionTitle`, `available`, `bookAuthor`, `bookTitle`, `callNumber`, `location`, `publishDate`, `series`, `uniqueId`, `shelfPosition`, `shelfLayer`) VALUES
(1, 'Recent', '', 'Joker', 'Joke lang', 'sdfgdg', '', '', '', '583ab69a934491cb3e0582d41cf1e055.jpg', '', ''),
(2, 'Recent', '', 'Joker2', 'Joke lang2', 'dfg', '', '', '', '583ab69a934491cb3e0582d41cf1e055.jpg', '', ''),
(10, 'asdf', '1', 'Steve Fuller', 'The Governance of Science : Ideology and the Futur', '303.48', '3', '2000', 'Issues in society', 'b3a1fabbf060cb703aba81326e51f6f9.jpg', '', ''),
(11, 'asdf', '1', 'Joseph Edward Shigley', 'Theory of Machines and Mechanisms', '621.8', '6', '1995', 'McGraw-Hill series in mechanical engineering', 'fb7700a322d46ab8ea8a66728367a1dd.jpg', '', '0'),
(12, 'fasd', '1', 'Kathie Reimer', '1001 Ways to Help your Child Walk With God', '248.8', '2', '1994', 'NA', '1d7667e1b3163e16d01da3ac3ded44dc.jpg', '', ''),
(13, 'fasd', '1', 'Joseph Edward Shigley', 'Theory of Machines and Mechanisms', '621.8', '6', '1995', 'McGraw-Hill series in mechanical engineering', 'fb7700a322d46ab8ea8a66728367a1dd.jpg', '', '0'),
(14, 'wer', '1', 'Peter Dronke', 'The Medieval Lyric', '809', '8', '1975', 'NA', 'a0e1429f1bc49f8b792b5366e46aab7f.jpg', '', ''),
(15, 'wer', '1', 'Adam S. Iqbal', 'Volatility : Practical Options Theory', '332.64', '3', '2018', 'NA', 'd475441da21d3fafda3672bdda8c440f.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Name` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `StudentNumber` varchar(20) NOT NULL,
  `UserPic` varchar(50) NOT NULL,
  `Course` varchar(30) NOT NULL,
  `College` varchar(20) NOT NULL,
  `YearLevel` int(2) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `ContactNumber` varchar(11) NOT NULL,
  `UserType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Name`, `UserId`, `StudentNumber`, `UserPic`, `Course`, `College`, `YearLevel`, `Email`, `ContactNumber`, `UserType`) VALUES
('Aurea Lea E. Caliste', '', '201402069', '6e3a8512e073d220233bdf0d1e1cde5f.jpg', 'BS CPE', 'CET', 5, 'aureacaliste@gmail.com', '09351688859', 'Student'),
('Jayson Franco', '', '201402134', '71a2e80271d3aa30bb6569f0679e72c9.jpg', 'BSCPE', 'CET', 5, 'jaysoncabralfranco@gmail.com', '09058860633', 'Student'),
('Noel T. Perido', '', '201402248', 'f7d36fb51f41d803bd0dde97731eef07.jpg', 'BS CPE', 'CET', 5, 'perido.noel@gmail.com', '09569624262', 'Student'),
('Blessie Gabrielle V. Cuevas', '', '201402417', '230e9db6aee46fec45353fc45230bf50.jpg', 'BS CPE', 'CET', 5, 'blessiecuevas@gmail.com', '09354054033', 'Student'),
('Mark Stephen T. Fabon', '', '201402453', '625073a8fb650dbd79e4976fcfa7bcb5.png', 'BS CPE', 'CET', 5, 'mark.fabon@yahoo.com', '09569624262', 'Student'),
('Steven Laurence B. Ballerda', '', '201410082', 'd5ded50190158bc8bd44cf1f5055aad8.jpg', 'BS CPE', 'CET', 5, 'stevenlaurenceballerda@gmail.com', '09569624262', 'Student'),
('James Christopher P. Barcial', '', '201410090', '43260d66c17c1839a32e8118b3a7d94d.jpg', 'BS CPE', 'CET', 5, 'jamesbarcial11@gmail.com', '09275253354', 'Student'),
('Camille Bermundo', '', '201410116', '221295199845cd539caee832536d69fc.jpg', 'BSCPE', 'CET', 5, 'bermundo.cams@gmail.com', '09569624262', 'Student'),
('Christian P. Cabading', '', '201410143', '720bf7e40567fbc9321e6e819be83121.jpg', 'BS CPE', 'CET', 5, 'chrstncbdng@gmail.com', '09272797658', 'Student'),
('Laurence B. Del Rosario', '', '201410238', '53a0d522cb0f1fe850e12dd2dc309877.png', 'BSCPE', 'CET', 5, 'lbdr@gmail.com', '09569624262', 'Student'),
('Joshua Roi De Omana', '', '201410261', '238c66f0ad8e5990a9cb8091f1a63be0.jpg', 'BSCPE', 'CET', 5, 'joshroi24@gmail.com', '09058860633', 'Student'),
('Frank Oliver Demonteverde', '', '201410285', 'db92edecfba2be02d5f01ce7180a1617.png', 'BSEntrep', 'CBGM', 5, 'fod@gmail.com', '09234567812', 'Student'),
('Cristine Joyce Dimarucut', '', '201410289', '6f095e2af3c9e3ebf82afe82f24fee09.jpg', 'BS CPE', 'CET', 5, 'joycedimarucut@gmail.com', '09569624262', 'Student'),
('Rich Ray C. Fortez', '', '201410340', '821d0ae85218fcef3232187a13265eb0.jpg', 'BS CPE', 'CET', 5, 'fortezrichray@gmail.com', '09058860633', 'Student'),
('Ailene A. Guittap', '', '201410393', '92ce19c51865b51967ee0dc19744fc69.jpg', 'BS CPE', 'CET', 5, 'aileneguittap@gmail.com', '09058860633', 'Student'),
('Edward K. Peralta', '', '201410603', 'ab3888bec9be8cffaec674cb0f901c32.jpg', 'BS CPE', 'CET', 5, 'edwardkperalta08@gmail.com', '09058860633', 'Student'),
('Peter Amiel N. Portes', 'QCVQWBUjeEZyJE9qyMQupaiILij2', '201410623', '6dc95649e08fbbf3cddc4b91428ef550.png', 'BS CpE', 'CET', 5, 'retepsetrop@gmail.com', '09561467930', 'Student'),
('Mark Naf Rodaje', '', '201410672', '7c850c8cc039fd79be6eccff5e9100e5.png', 'BSCPE', 'CET', 5, 'marknafrodaje17@gmail.com', '09569624262', 'Student'),
('Eloisa Mae G. Singsing', '', '201410740', 'cb0704c32e6a69f1abeede873c087034.jpg', 'BS CPE', 'CET', 5, 'eloisingsing97@gmail.com', '09367819791', 'Student'),
('Benjie R. Tendido', '', '201410780', '1bc34295fba295387844873b7175cce9.jpg', 'BS CPE', 'CET', 5, 'berries0922@gmail.com', '09568233557', 'Student'),
('Janine Criztabel E. Ventura', '', '201410808', '856d9d245f672bcab06072c99133e1a9.jpg', 'BS CPE', 'CET', 5, 'jcev@gmail.com', '09234567812', 'Student'),
('Karl Cedrick M. Villegas', '', '201410825', 'd735e0080f84dc5c08e57f9508956b14.jpg', 'BSCPE', 'CET', 5, 'kcmv@gmail.com', '09234567812', 'Student'),
('Caren Bartolata', '', '201411088', 'b52312a3e9c48f65fff488286a3c6eca.png', 'BSEntrep', 'CBGM', 5, 'cb1@gmail.com', '09058860633', 'Student'),
('Pauline Denise E. Aquino', '', '201420029', '4d949f556b7c316716502595bc7850b1.jpg', 'BS CPE', 'CET', 5, 'pauline.aquino@yahoo.com', '09956738020', 'Student'),
('Marc Reinhard C. Ballon', '', '201420047', 'fa304f4547ce8be9cd05300fda89b0dd.jpg', 'BS CPE', 'CET', 5, 'marcballon31@gmail.com', '09058860633', 'Student'),
('Lance Mendoza', '', '201420337', '109985d79393ebd6efb4a5eb8200d091.png', 'BSCPE', 'CET', 5, 'lm@gmail.com', '09569624262', 'Student'),
('Ian O. Milanes', '', '201420348', '133136a87de75a67c36eeb2c89751c38.jpg', 'BS CPE', 'CET', 5, 'ianmilanes13@gmail.com', '09979584317', 'Student'),
('Lou James M. Montenegro', '', '201420353', '2891df62dddc62b4edd006f355e7e364.jpg', 'BS CPE', 'CET', 5, 'ljmontenegro52@gmail.com', '09153009102', 'Student'),
('John Paul M. Reyes', '', '201420429', '1d7ba4ac718d809fca81ca60273664b4.jpg', 'BS CPE', 'CET', 5, 'jp19reyes@gmail.com', '09201133211', 'Student'),
('Emmanuel T. Sobrevega', '', '201420486', 'ea5b57e90af3282192a23c03e2b524ea.jpg', 'BS CPE', 'CET', 5, 'etsobrevega@yahoo.com', '09275687502', 'Student'),
('Frey De Prise C. Velasco', '', '201420524', 'dccfe14960d8ffd9c6b26e8d4099cc4f.jpg', 'BS CPE', 'CET', 5, 'dprisevelasco@gmail.com', '09055660762', 'Student'),
('Patrick Evangelio ', '', '201420660', 'bec7baf6faacd586b25668b17ad8b0f5.png', 'BSCPE', 'CET', 5, 'pr@gmail.com', '09058860633', 'Student'),
('Aaron John P. Nunez', '', '201520212', '0b44f55f2d80bc9f5385e039abbea1c0.png', 'BSARCH', 'CAUP', 4, 'ajp@gmail.com', '09301221122', 'Student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`callNumber`);

--
-- Indexes for table `librarians`
--
ALTER TABLE `librarians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `missingbook`
--
ALTER TABLE `missingbook`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `recent_activity`
--
ALTER TABLE `recent_activity`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `search_page`
--
ALTER TABLE `search_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `librarians`
--
ALTER TABLE `librarians`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `Id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `missingbook`
--
ALTER TABLE `missingbook`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `recent_activity`
--
ALTER TABLE `recent_activity`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `search_page`
--
ALTER TABLE `search_page`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
