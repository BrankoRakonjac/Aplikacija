/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS `aplikacija`;
CREATE DATABASE IF NOT EXISTS `aplikacija` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aplikacija`;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
	(1, 'brankorakonjac', '29CF5FF4983D18D7F57376CE45893620C6AA0A37DDDE2DA18760151A26077004787ABC67B1ED1A0AC1D741A0BE2EE6FAA8D9B679A0FE35AE8D49B8AFE0ED57FD'),
	(2, 'ivanajasovic', 'jasamosa'),
	(3, 'pperisc', 'D42644540C0A033AD344B79C78FA4E875E4F57671E80A2FA7D4B33D474E520F7C22665FA5A8D7F838EA0D775DAD12525D53F5EE35668AE4E8F7221C65CB2624E'),
	(5, 'branjo', 'A1013A69EF34D094479B22B5C736B50ECA0329BBE3D125D68AFAD41EE551514D268C8B4F8A717CC863D69C41152586C5641E6FDD1EBE82E44E5CB1222FC4DB87'),
	(7, 'adminnn', '7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D'),
	(8, 'admin1', 'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC'),
	(9, 'test', 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

DROP TABLE IF EXISTS `administrator_token`;
CREATE TABLE IF NOT EXISTS `administrator_token` (
  `administrator_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `administrator_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_token_id`),
  KEY `fk_administrator_token_administrator_id` (`administrator_id`),
  CONSTRAINT `fk_administrator_token_administrator_id` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`administrator_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator_token`;
/*!40000 ALTER TABLE `administrator_token` DISABLE KEYS */;
INSERT INTO `administrator_token` (`administrator_token_id`, `administrator_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
	(1, 1, '2020-09-08 22:35:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyMjc1NzI4LjM5MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NC4wLjQxNDcuMTM1IFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1OTczMjh9.KTRnd1d8r8YQvlMJOnTjrC7SLh7Iqd9O-eW4oYqY1DU', '2020-10-09 20:35:28', 0),
	(2, 1, '2020-09-09 12:05:44', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyMzI0MzQ0LjE0MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTY0NTk0NH0.nbbFyw478pSzilKI87zzUYm9wW3jsEGRdwgOvKB7QNI', '2020-10-10 10:05:44', 0),
	(3, 1, '2020-09-09 12:35:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyMzI2MTAyLjE0NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTY0NzcwMn0.LfxuiV87eNkVLvC4RIT8CkrFHoHhXFhecaqSBL4Ga0A', '2020-10-10 10:35:02', 0),
	(4, 1, '2020-09-09 13:41:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyMzMwMTE3LjU1NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTY1MTcxN30.t88cez2mTDEJFUjoVpkqus20XHLR-NxFqByhj8pIPCE', '2020-10-10 11:41:57', 0),
	(5, 1, '2020-09-09 14:15:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyMzMyMTQ1LjMzNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTY1Mzc0NX0.q-K0LqNrUSNE0EIqxi7MfNX5AR2dnPWShwnNZ8zGCRI', '2020-10-10 12:15:45', 0),
	(6, 7, '2020-09-09 17:35:42', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWlubm4iLCJleHAiOjE2MDIzNDQxNDEuOTE4LCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4yNi41IiwiaWF0IjoxNTk5NjY1NzQxfQ.sOXwxS0JCAIWU77BVgTudFNOz5So-ocNh6rCjkjF7hU', '2020-10-10 15:35:41', 0),
	(7, 1, '2020-09-10 21:55:01', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNDQ2MTAxLjc3MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTc2NzcwMX0.wcRZ4tWSW7LeCcsH4sI7wHUc1dl4F_Fezl9D5TjpsHQ', '2020-10-11 19:55:01', 0),
	(8, 1, '2020-09-11 13:39:20', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTAyNzYwLjE0NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTgyNDM2MH0.OFs2_Wh7oAQqj58Rquj0wuQloqpNCC5AAD75wb9Nb3U', '2020-10-12 11:39:20', 0),
	(9, 1, '2020-09-11 13:44:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTAzMDQyLjY3OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTgyNDY0Mn0.CvWqUcDBqTMe2rZtDM13wbQLfSFD9OQ3j29O9K7sWqo', '2020-10-12 11:44:02', 0),
	(10, 1, '2020-09-11 14:33:50', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTA2MDMwLjUyNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTgyNzYzMH0.7QhFYpgg4WUy2biYbCo2SCOzr8XSXt-JncYfrEu66G4', '2020-10-12 12:33:50', 0),
	(11, 1, '2020-09-11 15:03:43', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTA3ODIzLjAzMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTgyOTQyM30.-fj63GxVm4QMLVgDgROnr3ZAlhW1vw0E98Z4ycfGiAI', '2020-10-12 13:03:43', 0),
	(12, 7, '2020-09-11 15:14:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjo3LCJpZGVudGl0eSI6ImFkbWlubm4iLCJleHAiOjE2MDI1MDg0NjQuMzUxLCJpcCI6Ijo6MSIsInVhIjoiUG9zdG1hblJ1bnRpbWUvNy4yNi41IiwiaWF0IjoxNTk5ODMwMDY0fQ.Ya2s6DNsY1SMnKK1JOdz5UAPHxzSbo8CDmTF-Nd66L4', '2020-10-12 13:14:24', 0),
	(13, 1, '2020-09-11 22:25:46', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTM0MzQ2LjE1NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTg1NTk0Nn0.xj12LlgVgjkKEdACeMVTrthmrzFv2Bc62w-WrUtSbsU', '2020-10-12 20:25:46', 0),
	(14, 1, '2020-09-11 22:31:49', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTM0NzA5LjAwOCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTg1NjMwOX0.Tc-OIZ1OS_6OSd1IFBHaC0vQapH-T6OIfgh_09BKmM4', '2020-10-12 20:31:49', 0),
	(15, 1, '2020-09-11 22:37:01', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNTM1MDIxLjI3OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTg1NjYyMX0.hYorV-JnTePWlleCri1swQ9zF32DmNTgQCmnTLaxOU4', '2020-10-12 20:37:01', 0),
	(16, 1, '2020-09-12 18:06:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNjA1MjEzLjc2OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTkyNjgxM30.iF5Rcc_iayyaBCO3zpEB54pYaDflS9jZFKCEHCBaJIY', '2020-10-13 16:06:53', 0),
	(17, 1, '2020-09-14 11:01:18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNzUyNDc4LjEzMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMDc0MDc4fQ.8k7Qi1YwJ5PhLs5q9m3s1Xqz-ok-5fFunWvbygzeqis', '2020-10-15 09:01:18', 0),
	(18, 1, '2020-09-14 14:36:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNzY1MzkzLjYzLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My44MyBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDg2OTkzfQ.VmnWBIZ2eofyznlaRo5jq7-GdNdD1qBWPO2q-9i0Ggo', '2020-10-15 12:36:33', 0),
	(19, 1, '2020-09-14 14:38:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNzY1NDk1Ljc5LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My44MyBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDg3MDk1fQ.-5_xwoH-ddDl-U-UuBu2ELuSQM02hERpi6fDt_js718', '2020-10-15 12:38:15', 0),
	(20, 1, '2020-09-14 20:51:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyNzg3OTEzLjQ1OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTYwMDEwOTUxM30.qEHOVjmRFBSFbaqrxdRUxbsec7qBwZsq1atZIABvNT8', '2020-10-15 18:51:53', 0),
	(21, 1, '2020-09-15 10:40:01', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyODM3NjAxLjY0OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMTU5MjAxfQ.slgrrVb8mffRN0Cm81ug76SAtfN9vXaeJ5VDcfJ-nCY', '2020-10-16 08:40:01', 0),
	(22, 1, '2020-09-15 10:57:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyODM4NjQyLjUyNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMTYwMjQyfQ.9AIjtTywJU7ulwTTQHc2tykHisqJ1RypFOA7tqjcwjU', '2020-10-16 08:57:22', 0),
	(23, 1, '2020-09-15 11:06:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyODM5MTg4LjQzOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMTYwNzg4fQ.MedsbxLjLPtFk8rqEzIQ_DKw3QurLH0o6fDbhxKWBeI', '2020-10-16 09:06:28', 0),
	(24, 1, '2020-09-15 12:01:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyODQyNDY4LjcyLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My4xMDIgU2FmYXJpLzUzNy4zNiBFZGcvODUuMC41NjQuNTEiLCJpYXQiOjE2MDAxNjQwNjh9.ODsePbVGQ515XnsU1h4kNNkgIV_x-HhyZ9bZvTGHOwU', '2020-10-16 10:01:08', 0),
	(25, 1, '2020-09-15 12:01:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAyODQyNDg0LjkyNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMTY0MDg0fQ.IDSooJuzgD4xZ4R4z9Yj991dAWpdxUWYAUmLB00K03o', '2020-10-16 10:01:24', 0),
	(26, 1, '2020-09-17 10:50:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAzMDExMDQ3LjQ4NSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMzMyNjQ3fQ.0TWy91DRs6xqLcOgNcIXpEiORozjXuLd2B4eEzIL5o0', '2020-10-18 08:50:47', 0),
	(27, 1, '2020-09-17 11:00:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxLCJpZGVudGl0eSI6ImJyYW5rb3Jha29uamFjIiwiZXhwIjoxNjAzMDExNjI0LjI2MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYgRWRnLzg1LjAuNTY0LjUxIiwiaWF0IjoxNjAwMzMzMjI0fQ.2U5y3OJv-zaK2-drzh1a9gO0RX-3z7dIfms3pVJMlVM', '2020-10-18 09:00:24', 0);
/*!40000 ALTER TABLE `administrator_token` ENABLE KEYS */;

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  `excerpt` varchar(255) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `status` enum('available','visible','hidden') NOT NULL DEFAULT 'available',
  `is_promoted` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
	(1, 'ACME HDD GB', 5, 'kratak opis', 'detaljan opis', 'available', 0, '2020-08-17 02:49:32'),
	(2, 'ACME HD11 1024GB', 5, 'neki kratki tekst 2', 'neki malo duzi tekst o proizvodu', 'visible', 1, '2020-08-18 00:19:50'),
	(3, 'Ciscenje virusa', 3, 'Antivirus zastita', 'koju instaliramo na vaš kompjuter je Avast koji čuva i čisti vaš operativni sistem, program Autorun Eater koji štiti upade sa flash memorije. i program SpyWare Terminator koji čisti operativni sistem od svih drugih sitnih štetnih programčića.', 'available', 0, '2020-08-20 17:13:23'),
	(4, 'masine za sudove', 23, 'kratak opis', 'dugacak opis  dugacak opis dugacak opis dugacak opis dugacak opis dugacak opis dugacak opis dugacak opis ', 'hidden', 0, '2020-09-11 11:13:15'),
	(5, 'Ciscenje virusa', 3, 'Bez instaliranja av.', 'Brišemo Vašu postojeću antivirusnu zaštitu, jer očito nije bila od koristi i propustila je viruse i trojance u računar\nInstaliramo svoju proverenu antivirusnu zaštitu, i odmah radimo dopunu baze za viruse i trojance\nInstaliramo jos par pratećih programa za brisanje virusa i trojanaca.\nInstaliramo čistač nepotrebih fajlova u Vašem sistemu, brišemo sistem od đubreta i nepotrebnih dokumenata, time rasterećujemo Vaš sistem i ubrzavamo ga', 'available', 0, '2020-09-12 18:20:30'),
	(6, 'Beko masina za pranje vesa ', 13, 'kratak opis', 'dugacak opis dugacak opis dugacak opis dugacak opis dugacak opis ', 'available', 0, '2020-09-13 21:24:11'),
	(7, 'WHIRLPOOL Mašina za pranje veša', 13, 'kratak opis', 'WHIRLPOOL Mašina za pranje veša WHIRLPOOL Mašina za pranje veša WHIRLPOOL Mašina za pranje veša', 'available', 0, '2020-09-13 22:18:51'),
	(8, 'SAMSUNG Mašina za pranje veša ', 13, 'kratak opis', 'SAMSUNG Mašina za pranje veša SAMSUNG Mašina za pranje veša SAMSUNG Mašina za pranje veša ', 'available', 0, '2020-09-13 22:24:32'),
	(9, 'SAMSUNG Usisivač', 28, 'Model	SAMSUNG VC 4135', 'Usisna snaga: 320 W\nTrajna platnena kesa\nTwister\nMikrofilter\nFunkcija za izduvavanje\nIndikator napunjenosti vrećice\n2 dodatna nastavka\nAutomatsko uvlačenje kabla\nDvostepena četka\nNivo buke 80 dBA\nTeleskopska metalna cev\nCyclon filter\nTwister\nTrajna platnena kesa\nMikrofilter\nDvostepena četka', 'available', 0, '2020-09-14 11:30:03'),
	(10, 'GORENJE usisivač', 28, 'Model	GORENJE SVC 216 FR', 'Bežična upotreba\n21,6 LI-Ion zamenjiva baterija\nVreme rada do 60 min\nMotorna Turbo četka\nPraktična LED svetla\nJednostavno odlaganje\nLako pražnjenje posude', 'available', 0, '2020-09-14 11:31:43'),
	(11, 'VOX Usisivač na vodu ', 28, 'Model	VOX TYPHOON 3000', 'Tip	Usisivač na vodu	Snaga	2800 W	Zapremina kese/posude	13 l	Filter	Petostepeni sistem filtriranja	Oprema u pakovanju	Nastavci za nameštaj i ćoškove	Radijus rada	12 m	Ostalo	Suvo i mokro usisavanje\nPlastična cev', 'available', 0, '2020-09-14 11:32:42'),
	(12, 'iRobot Robot usisivač', 28, 'Model	IROBOT ROOMBA E5158', 'Čisti različite vrste tvrdih podova i tepiha\nMogućnost čišćenja teško dostupnih mesta, duž zidova i uglova\nPoboljšano filtriranje prašine unapređenim filterom\nUpravljanje putem aplikacije iRobot Home\nVreme rada i do 90 minuta', 'available', 0, '2020-09-14 11:33:39'),
	(13, 'cd & dvd', 2, 'zamena cd-a', 'detaljna zamena detaljna zamena detaljna zamena detaljna zamena detaljna zamena detaljna zamena ', 'available', 0, '2020-09-15 11:22:47'),
	(14, 'Procesor', 2, 'zamena procesora', 'zamena procesora sa detaljnim ciscenjem racunara zamena procesora sa detaljnim ciscenjem racunara ', 'available', 0, '2020-09-15 11:26:33'),
	(15, 'RAM Memory', 2, 'Dodavanje ili zamena', 'Dodavanje ili zamena rama sa detaljnim ciscenjem racunara i pregledom Dodavanje ili zamena rama sa detaljnim ciscenjem racunara i pregledom ', 'available', 0, '2020-09-15 11:29:05');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_feature`;
CREATE TABLE IF NOT EXISTS `article_feature` (
  `article_feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `feature_id` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_feature`;
/*!40000 ALTER TABLE `article_feature` DISABLE KEYS */;
INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `value`) VALUES
	(1, 1, 1, '512'),
	(2, 1, 3, 'SATA 3.0'),
	(3, 1, 2, 'SSD'),
	(6, 2, 1, '1024GB'),
	(7, 2, 2, 'SATA 3.0'),
	(18, 6, 16, 'a++'),
	(19, 6, 17, '5 kg'),
	(20, 7, 15, 'Samostojeća'),
	(21, 7, 16, 'a+'),
	(22, 7, 17, '6 kg'),
	(26, 8, 15, 'Samostojeća'),
	(27, 8, 16, 'A+++'),
	(28, 8, 17, '7 kg'),
	(30, 9, 19, ''),
	(31, 10, 20, ''),
	(34, 11, 22, ''),
	(35, 12, 21, 'baterija'),
	(38, 13, 7, 'acer'),
	(40, 14, 7, 'dell'),
	(41, 15, 7, 'vengeance'),
	(42, 3, 8, 'ACME'),
	(43, 3, 9, '15,6'),
	(44, 3, 10, 'bez op'),
	(46, 5, 8, 'DELL'),
	(47, 5, 9, '17"'),
	(48, 5, 10, 'IOS');
/*!40000 ALTER TABLE `article_feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_price`;
CREATE TABLE IF NOT EXISTS `article_price` (
  `article_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price_artical_id` (`article_id`),
  CONSTRAINT `fk_article_price_artical_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_price`;
/*!40000 ALTER TABLE `article_price` DISABLE KEYS */;
INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
	(1, 1, 45.00, '2020-08-17 16:40:47'),
	(2, 3, 43.00, '2020-08-17 16:40:57'),
	(3, 2, 56.89, '2020-08-18 00:19:50'),
	(4, 3, 340.00, '2020-08-22 16:54:16'),
	(5, 4, 50.00, '2020-09-11 11:13:15'),
	(6, 5, 500.00, '2020-09-12 18:20:30'),
	(7, 6, 200.00, '2020-09-13 21:24:11'),
	(8, 7, 320.00, '2020-09-13 22:18:51'),
	(9, 8, 0.01, '2020-09-13 22:24:32'),
	(10, 8, 600.00, '2020-09-13 22:25:10'),
	(11, 9, 0.01, '2020-09-14 11:30:03'),
	(12, 9, 70.00, '2020-09-14 11:30:23'),
	(13, 10, 150.00, '2020-09-14 11:31:43'),
	(14, 11, 0.01, '2020-09-14 11:32:42'),
	(15, 12, 0.01, '2020-09-14 11:33:40'),
	(16, 11, 90.00, '2020-09-14 13:52:07'),
	(17, 12, 100.00, '2020-09-14 13:52:37'),
	(18, 13, 30.00, '2020-09-15 11:22:47'),
	(19, 14, 50.00, '2020-09-15 11:26:33'),
	(20, 15, 10.00, '2020-09-15 11:29:05'),
	(21, 3, 20.00, '2020-09-15 11:34:29'),
	(22, 5, 15.00, '2020-09-15 11:36:40');
/*!40000 ALTER TABLE `article_price` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
	(1, 1, '2020-08-24 21:46:08'),
	(2, 1, '2020-08-24 22:09:29'),
	(3, 1, '2020-08-24 23:55:29'),
	(4, 1, '2020-08-24 23:58:54'),
	(5, 1, '2020-08-26 01:26:38'),
	(6, 1, '2020-08-26 02:01:44'),
	(7, 1, '2020-08-26 02:04:29'),
	(8, 1, '2020-08-26 02:13:13'),
	(9, 1, '2020-08-26 02:20:00'),
	(10, 1, '2020-08-26 02:24:39'),
	(11, 1, '2020-08-26 02:39:12'),
	(12, 1, '2020-08-26 02:45:40'),
	(13, 1, '2020-08-26 02:48:54'),
	(14, 1, '2020-08-26 02:53:38'),
	(15, 1, '2020-08-31 23:10:42'),
	(16, 1, '2020-08-31 23:15:20'),
	(17, 1, '2020-09-01 00:08:26'),
	(18, 1, '2020-09-01 01:03:06'),
	(19, 1, '2020-09-01 01:07:57'),
	(20, 1, '2020-09-13 22:26:43'),
	(21, 1, '2020-09-13 22:26:45');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart_article`;
CREATE TABLE IF NOT EXISTS `cart_article` (
  `cart_article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart_article`;
/*!40000 ALTER TABLE `cart_article` DISABLE KEYS */;
INSERT INTO `cart_article` (`cart_article_id`, `cart_id`, `article_id`, `quantity`) VALUES
	(1, 1, 1, 4),
	(3, 2, 2, 2),
	(4, 3, 3, 3),
	(5, 4, 3, 3),
	(6, 5, 1, 3),
	(7, 5, 2, 1),
	(8, 6, 2, 1),
	(9, 6, 1, 3),
	(10, 7, 1, 3),
	(11, 8, 1, 3),
	(12, 9, 1, 3),
	(13, 10, 1, 3),
	(14, 11, 1, 3),
	(15, 12, 1, 3),
	(16, 13, 1, 3),
	(17, 14, 1, 3),
	(30, 15, 1, 5),
	(31, 16, 1, 2),
	(32, 17, 1, 3),
	(33, 18, 1, 2),
	(34, 19, 2, 2),
	(40, 20, 6, 2);
/*!40000 ALTER TABLE `cart_article` ENABLE KEYS */;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`name`),
  UNIQUE KEY `uq_category_image_path` (`image_path`),
  KEY `fk_category_parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
	(1, 'Racunarske usluge', 'C:\\Users\\User\\Desktop\\type\\slike\\stan.jpg', NULL),
	(2, 'Odrzavanje racunara', 'assets/home.jpg', 1),
	(3, 'Servis racunara', 'assets/pc/laptop.jpg', 1),
	(4, 'Servis stampaca', 'assets/pc/memory.jpg', 1),
	(5, 'Audio', 'assets/pc/memory/hdd.jpg', 16),
	(10, 'Periferije', 'http://slike.com/keyboard-mice.png', 1),
	(11, 'misevi', 'http://slike.com/mice.png', 10),
	(12, 'Bela tehnika', 'http://slike.com/asd/mice.png', NULL),
	(13, 'Ves masine', 'http://slike.com/mice1.png', 12),
	(14, 'Mali kucni aparati', 'assets/pc/memory/hdd111.jpg', NULL),
	(15, 'Klima', 'slike/stan.jpg', NULL),
	(16, 'Televizori', 'http://slike.com/mi1234ce.png', NULL),
	(17, 'IT Shop', 'http://slike.com111/mice.png', NULL),
	(18, 'Telefoni', 'assets/pc.jpg111', NULL),
	(19, 'Foto Aparati', 'http://slike.com/asd/mice.png123', NULL),
	(23, 'Audio & Video', 'assets/pc/1111memory/hdd.jpg', NULL),
	(24, 'Frizideri', 'C:\\Users\\User\\Desktop\\type\\front-end\\src\\slike\\maina5.jpg', 12),
	(25, 'Zamrzivac', 'src\\slike\\maina5.jpg', 12),
	(26, 'Sporet', 'C:\\Users\\User\\Desktop\\type\\slike\\maina5.jpg', 12),
	(27, 'Masina za sudove', 'C:\\Users\\User\\Desktop\\type\\storage\\photos\\masina2.jpg', 12),
	(28, 'Usisivaci', 'http://slike.com/mice12.png', 14),
	(29, 'Laptop', 'https://internetske-usluge.com/wp-content/uploads/2017/05/besplatne-fotografije-za-web-800x500_c.jpg', 17),
	(30, 'Kamere', 'https://www.espreso.rs/data/images/2017/12/08/15/298425_atila-sabo-cigota_ls.jpg', 23),
	(31, 'Fotoaparati', 'https://www.nationalgeographic.rs/files/images/2013/Vincent_van_Gogh___National_Gallery_of_Art_681308748.jpg', 23);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `feature`;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
	(9, 'dijagonala e', 3),
	(11, 'Dimenzija', 5),
	(16, 'Energetska klasa', 13),
	(1, 'Kapacitet', 5),
	(17, 'Kapacitet pranja', 13),
	(5, 'Napon', 2),
	(13, 'Naziv i vrsta robe	', 13),
	(10, 'OP', 3),
	(7, 'Proizvodjac', 2),
	(8, 'Proizvodjac', 3),
	(18, 'Proizvodjac', 12),
	(21, 'Robot usisivac', 28),
	(20, 'Stapni usisivac', 28),
	(2, 'Tehnologija', 5),
	(3, 'Tip', 5),
	(15, 'Tip aparata', 13),
	(12, 'Tip i model', 13),
	(22, 'Usisivac na vodu', 28),
	(19, 'Usisivaci sa kesom', 28),
	(14, 'Uvoznik', 13);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('rejected','accepted','shipped','pending') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`, `created_at`, `cart_id`, `status`) VALUES
	(1, '2020-08-24 21:50:48', 1, 'shipped'),
	(2, '2020-08-24 23:55:23', 2, 'accepted'),
	(3, '2020-08-24 23:57:13', 3, 'rejected'),
	(4, '2020-08-25 00:00:37', 4, 'accepted'),
	(5, '2020-08-26 01:27:49', 5, 'rejected'),
	(6, '2020-08-26 02:02:43', 6, 'pending'),
	(7, '2020-08-26 02:09:22', 7, 'pending'),
	(8, '2020-08-26 02:13:24', 8, 'pending'),
	(9, '2020-08-26 02:20:14', 9, 'pending'),
	(10, '2020-08-26 02:24:45', 10, 'pending'),
	(11, '2020-08-26 02:39:22', 11, 'pending'),
	(12, '2020-08-26 02:45:50', 12, 'pending'),
	(13, '2020-08-26 02:49:00', 13, 'pending'),
	(14, '2020-08-26 02:53:43', 14, 'pending'),
	(15, '2020-08-31 23:10:42', 15, 'pending'),
	(16, '2020-08-31 23:15:20', 16, 'pending'),
	(17, '2020-09-01 00:08:26', 17, 'pending'),
	(18, '2020-09-01 01:03:05', 18, 'pending'),
	(19, '2020-09-01 01:07:56', 19, 'pending'),
	(20, '2020-09-13 22:26:42', 20, 'pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `uq_photo_image_path` (`image_path`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
	(9, 2, '2020822-1518237363-bane.jpg'),
	(11, 3, '202099-9316762363-bane.jpg'),
	(12, 4, '2020911-7787945734-img_20170404_201523_300.jpg'),
	(13, 1, '2020911-8614194340-faire_maus.jpg'),
	(14, 5, '2020912-5321755663-stan.jpg'),
	(15, 6, '2020913-6726338976-masina2.jpg'),
	(16, 6, '2020913-1730118472-masina2.jpg'),
	(17, 6, '2020913-7335425146-masina1.jpg'),
	(18, 7, '2020913-0718185893-masina3.jpg'),
	(19, 8, '2020913-7830013336-maina5.jpg'),
	(20, 8, '2020913-9468149511-masina8.jpg'),
	(21, 8, '2020913-0518383581-masina4.jpg'),
	(22, 9, '2020914-9567306747-usisivac2.jpg'),
	(23, 9, '2020914-4333341918-usisivac1.jpg'),
	(24, 10, '2020914-6663277393-stapni.jpg'),
	(25, 11, '2020914-3875282366-voda.jpg'),
	(26, 12, '2020914-5103026842-robot.jpg'),
	(27, 13, '2020915-1526717646-cd.jpg'),
	(28, 14, '2020915-5212546247-i5.jpg'),
	(29, 15, '2020915-7801371308-ram.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  `forename` varchar(64) NOT NULL DEFAULT '0',
  `surname` varchar(64) NOT NULL DEFAULT '0',
  `phone_number` varchar(24) NOT NULL DEFAULT '0',
  `postal_address` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`),
  UNIQUE KEY `uq_user_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surname`, `phone_number`, `postal_address`) VALUES
	(1, 'test@test.rs', '8D2F4D9C7F87141F0810F1ACD6C0462FF0319BB049AA88EA4E310649628091DE316CF1392E19AF4F0A327826545F63E4E969838F5E7D572A475DE3255B738ACA', 'Pera', 'Peric', '+381645669454', 'velislava t.'),
	(3, 'test@test123.rs', '9E8C8260680E943A8EC5361D67B05880C3C52E91ECE81F291C211FA0494230D2179B8100F62772AB52DB0D3A63C552899B5977A438891F81634AFEE7A39BD9A0', 'brenjo', 'rako', '+381645669545', ' Milosa crnjanskog'),
	(8, 'qwert@gmail.com', 'FD97F5A974FC0651B025B5239F4A4726761C090915C5BC87871AE89DC1977E988E3F9503CFFF818BCEA9E4F91A640D0F38429E782F5F4EC9EB0AB4F79B1A04D2', 'teasddf', 'qwedfn', '+38164569874', 'breasidjf sdaf sd\n11000'),
	(9, 'Marko@gmail.rs', '983D706539D9961FA9949A82286D1322125DD530C70E6C6EB51700CBB68DE73ED93008EBD2C1B0386D542790B8BACB151B8457FDA8CC5DA62219E32157AB9022', 'Marko', 'Rako', '+381647896532', 'Beograd novi\n11000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `user_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_token_id`),
  KEY `fk_user_token_user_id` (`user_id`),
  CONSTRAINT `fk_user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`user_token_id`, `user_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
	(1, 1, '2020-08-26 19:05:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJ1c2VybmFtZSI6InRlc3RAdGVzdC5ycyIsImV4dCI6MTYwMTEzOTkyNC4yNDgsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTg0NjE1MjR9.oUofKRGx2MQZLUPD_Pw2U4Dtvz60Sj7fTtPn_2c6p4U', '2020-09-26 17:05:24', 1),
	(2, 1, '2020-08-26 23:15:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJ1c2VybmFtZSI6InRlc3RAdGVzdC5ycyIsImV4dCI6MTYwMTE1NDkwMi4zMywiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjYuMyIsImlhdCI6MTU5ODQ3NjUwMn0.4xpWYG8Zx2zpAOwGjBGkjAhuLoF8y8w_1MXEZj5wWh8', '2020-09-26 21:15:02', 1),
	(3, 1, '2020-08-27 00:25:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJ1c2VybmFtZSI6InRlc3RAdGVzdC5ycyIsImV4dCI6MTYwMTE1OTE1NC4wMywiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjYuMyIsImlhdCI6MTU5ODQ4MDc1NH0.blIW40h8BifSxD7Lb9yKCYnBbmUJf4mjuDxJRAcx4LQ', '2020-09-26 22:25:54', 1),
	(4, 1, '2020-08-28 23:59:06', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzMDM0Ni43ODMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjUxOTQ2fQ.F7-yr9CxykkhmFELAmLce7gkNXHHKaK_AuWeLw-ATYU', '2020-09-28 23:00:00', 1),
	(5, 1, '2020-08-29 00:57:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzMzg1Ni41MjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjU1NDU2fQ._czVQlybFaYlJFlc83nQOtFKKpJr28htP_t74bGUssY', '2020-09-29 00:00:00', 1),
	(6, 1, '2020-08-29 01:20:04', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzNTIwNC4zMjIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjU2ODA0fQ.EtDeriRLQ1DmBYLXH6fPRfRTUmUFTthzSG74PrtgYtk', '2020-09-29 01:00:00', 1),
	(7, 1, '2020-08-29 02:32:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzOTUyOC44ODIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjYxMTI4fQ.BFBfq7SIGcqpf5p8-xKBfoZF9oIsVsdHWZRX2HwaypQ', '2020-09-29 02:00:00', 1),
	(8, 1, '2020-08-29 20:53:18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTQwNTU5OC43NTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NzI3MTk4fQ.jRDtQW3eKmlHhm8k_5gwOvjolIsDbGFF_SvbKnVJ8rk', '2020-09-29 20:00:00', 1),
	(9, 1, '2020-08-30 00:14:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTQxNzY4NS4yMTMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0OyBydjo3OS4wKSBHZWNrby8yMDEwMDEwMSBGaXJlZm94Lzc5LjAiLCJpYXQiOjE1OTg3MzkyODV9.lu185aypeexCIjTJpN8sh-dDmgFh8fOz-uZ5AS04Txg', '2020-09-30 00:00:00', 1),
	(10, 1, '2020-08-30 17:24:32', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTQ3OTQ3Mi4xNzUsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTg4MDEwNzJ9.RQEAts2vNotrUSLE4uEcuLx7hL-Y9ug6-nLo-2zDnrw', '2020-09-30 17:00:00', 1),
	(11, 1, '2020-08-31 19:41:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU3NDA4OC41NzgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4ODk1Njg4fQ.XpxsOh4DmPsGuQdxTnA6hkWkKFGkVOYbkpMIUo8JDEg', '2020-10-01 19:00:00', 1),
	(12, 1, '2020-08-31 19:41:48', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU3NDEwOC45MTgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4ODk1NzA4fQ.4i7AxalkZelYPAmqTXlKFAURDcizqKhoyrKD7FieJTs', '2020-10-01 19:00:00', 1),
	(13, 1, '2020-08-31 23:14:58', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU4Njg5OC4wODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTA4NDk4fQ.s-Ddg5mt8H2MYUW1pGk11cci9EcASPxCPNC66qJu42g', '2020-10-01 23:00:00', 1),
	(14, 1, '2020-09-01 00:08:10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU5MDA5MC45MDUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTExNjkwfQ.sqCrByGxnOihOUFewmjYriuPKb-J0QHcXnnkJAGLDHM', '2020-10-02 00:00:00', 1),
	(15, 1, '2020-09-01 01:02:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU5MzM2NS4yNTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTE0OTY1fQ.hQR4Ajqh2kxu71vE5Edyh7VRF3U2bOatynLEBzvZCDk', '2020-10-02 01:00:00', 1),
	(16, 1, '2020-09-01 01:07:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU5MzY0My45ODEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTE1MjQzfQ.xQHWeRbCH9JjHrhRWNgLCuX8m5GLw-217gzSTnBYl1o', '2020-10-02 01:00:00', 1),
	(17, 1, '2020-09-01 02:56:55', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNS44MTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE1fQ.BwLtEm8nEQ-TNZh1Sz9YwqQRY2HJR9mMBurkZ50ZFZE', '2020-10-02 00:56:55', 1),
	(18, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy4zODksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.VpM_riU885dH2xw7jiRLin2cYByJ57Df6aHWYQlploY', '2020-10-02 00:56:57', 1),
	(19, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy42MDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.4n1bMrSFMe6FNQzVU7jQxY0LbyL-jq1mKrEt5Lur2tY', '2020-10-02 00:56:57', 1),
	(20, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy43OTQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.4uh-Tq6R-VgkjH6thntS8V4sLveOs4JWJcSx5-Gfr7I', '2020-10-02 00:56:57', 1),
	(21, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy45ODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.39ECrnpBM24w2KbuPGh4_8KxLmhsxM484uN9GNXs9Ys', '2020-10-02 00:56:57', 1),
	(22, 1, '2020-09-01 02:57:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDI0Mi44ODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODQyfQ.MaDirgkVh5NLv8vTT-aC8HG_u9iWc9r-A1pIwHozRes', '2020-10-02 00:57:22', 1),
	(23, 9, '2020-09-08 22:50:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjo5LCJpZGVudGl0eSI6Ik1hcmtvQGdtYWlsLnJzIiwiZXhwIjoxNjAyMjc2NjQxLjMyMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NC4wLjQxNDcuMTM1IFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1OTgyNDF9.5mRy6mFc042_42trI1XTTgn6FQX3abUo65d6bvmJ36s', '2020-10-09 20:50:41', 1),
	(24, 1, '2020-09-09 12:04:32', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMyNDI3Mi40MTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2NDU4NzJ9.FdN7IHwXCtZTrcvMQWq_2Hqg7Epw92YuMk6ZNua0mS4', '2020-10-10 10:04:32', 1),
	(25, 1, '2020-09-09 12:06:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMyNDQwNy45MDksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2NDYwMDd9.9ge12yCOyV_GKKH4dHAnjMK6ZCDxKxVhn2cRyMwscD4', '2020-10-10 10:06:47', 1),
	(26, 1, '2020-09-09 12:10:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMyNDYyMi44NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTY0NjIyMn0.TYRcvSqltbjEpIBjLJtWa9JRa1nvQ8MXnTtJtdONSvI', '2020-10-10 10:10:22', 1),
	(27, 1, '2020-09-09 12:10:30', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMyNDYzMC40NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTY0NjIzMH0.8OT9TbEpyOSSxTXiiwRdF7R7qrx2hq7RiTUqvkUK1A0', '2020-10-10 10:10:30', 1),
	(28, 1, '2020-09-09 12:10:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMyNDYzMS42ODMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2NDYyMzF9.tvhA-2KHfSV_bItqI90jAdQDpSBWcpcIF2yaM0lglpM', '2020-10-10 10:10:31', 1),
	(29, 1, '2020-09-09 14:29:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMzMjk5OS45ODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2NTQ1OTl9.zkAQX3lu4Z-tOyia38K5x1s3doC9Dp3q5c0u8GAcW_Q', '2020-10-10 12:29:59', 1),
	(30, 1, '2020-09-11 13:38:38', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjUwMjcxOC43MjksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MjQzMTh9.maBmgiKtKW3igj_pAl6EOC6_J6GCGX3hBGwTgR35FUE', '2020-10-12 11:38:38', 1),
	(31, 1, '2020-09-14 10:57:01', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc1MjIyMS44MzIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IEVkZy84NS4wLjU2NC41MSIsImlhdCI6MTYwMDA3MzgyMX0.-YtdZiKIH98hGc1OQ5-hHWKwBISe14olbUL1w9Hx4sU', '2020-10-15 08:57:01', 1),
	(32, 1, '2020-09-15 12:23:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjg0MzgwMi45NjIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMTY1NDAyfQ.AVuXHyOy5SYgi-7K_bmxzFmKtmgeHaUIgTNHHPFvbzA', '2020-10-16 10:23:22', 1),
	(33, 1, '2020-09-15 14:04:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjg0OTg3MC44NjUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMTcxNDcwfQ.D45TU92M_s3Ls7UzO3fiUmOsWUaVBziSq5_6OdpnSXw', '2020-10-16 12:04:30', 1);
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
