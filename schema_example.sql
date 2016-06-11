-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Objects'
-- Stores an astronomical object
-- ---

DROP TABLE IF EXISTS `Objects`;
		
CREATE TABLE `Objects` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `ra` DECIMAL NULL DEFAULT NULL COMMENT 'Right Ascension',
  `dec` DECIMAL NULL DEFAULT NULL COMMENT 'declination',
  `name` CHAR(128) NULL DEFAULT NULL,
  `reference` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Stores an astronomical object';

-- ---
-- Table 'References'
-- 
-- ---

DROP TABLE IF EXISTS `References`;
		
CREATE TABLE `References` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `ads_id` CHAR(128) NULL DEFAULT NULL,
  `bibtex` MEDIUMTEXT NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Photometry'
-- 
-- ---

DROP TABLE IF EXISTS `Photometry`;
		
CREATE TABLE `Photometry` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `value` DECIMAL NULL DEFAULT NULL,
  `uncertainty` DECIMAL NULL DEFAULT NULL,
  `units` CHAR(128) NULL DEFAULT NULL COMMENT 'test comment',
  `filter` INTEGER NULL DEFAULT NULL,
  `reference` INTEGER NULL DEFAULT NULL,
  `object` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'SpectralTypes'
-- 
-- ---

DROP TABLE IF EXISTS `SpectralTypes`;
		
CREATE TABLE `SpectralTypes` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `value` DECIMAL NULL DEFAULT NULL,
  `adopted_flag` INTEGER NULL DEFAULT NULL,
  `uncertainty` INTEGER NOT NULL DEFAULT NULL,
  `reference` INTEGER NULL DEFAULT NULL,
  `object` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Measurements'
-- General example of measurements
-- ---

DROP TABLE IF EXISTS `Measurements`;
		
CREATE TABLE `Measurements` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `value` DECIMAL NOT NULL DEFAULT NULL,
  `uncertainty` DECIMAL NOT NULL DEFAULT NULL,
  `adopted_flag` INTEGER NULL DEFAULT NULL,
  `object` INTEGER NOT NULL DEFAULT NULL,
  `reference` INTEGER NULL DEFAULT NULL,
  `type` CHAR(128) NOT NULL DEFAULT 'NULL',
  `units` CHAR(128) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
) COMMENT 'General example of measurements';

-- ---
-- Table 'Filters'
-- 
-- ---

DROP TABLE IF EXISTS `Filters`;
		
CREATE TABLE `Filters` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` CHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'SpectralTypesStrings'
-- 
-- ---

DROP TABLE IF EXISTS `SpectralTypesStrings`;
		
CREATE TABLE `SpectralTypesStrings` (
  `id` DECIMAL NOT NULL DEFAULT NULL,
  `name` CHAR(128) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Observations'
-- 
-- ---

DROP TABLE IF EXISTS `Observations`;
		
CREATE TABLE `Observations` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `object` INTEGER NOT NULL DEFAULT NULL,
  `instrument` INTEGER NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `filename` INTEGER NULL DEFAULT NULL,
  `exposure_time` DECIMAL NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Instruments'
-- 
-- ---

DROP TABLE IF EXISTS `Instruments`;
		
CREATE TABLE `Instruments` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `telescope` CHAR(128) NULL DEFAULT NULL,
  `name` CHAR(128) NULL DEFAULT NULL,
  `mode` CHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'MeasurementTypes'
-- 
-- ---

DROP TABLE IF EXISTS `MeasurementTypes`;
		
CREATE TABLE `MeasurementTypes` (
  `id` CHAR(128) NOT NULL DEFAULT 'NULL',
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Objects` ADD FOREIGN KEY (reference) REFERENCES `References` (`id`);
ALTER TABLE `Photometry` ADD FOREIGN KEY (filter) REFERENCES `Filters` (`id`);
ALTER TABLE `Photometry` ADD FOREIGN KEY (reference) REFERENCES `References` (`id`);
ALTER TABLE `Photometry` ADD FOREIGN KEY (object) REFERENCES `Objects` (`id`);
ALTER TABLE `SpectralTypes` ADD FOREIGN KEY (value) REFERENCES `SpectralTypesStrings` (`id`);
ALTER TABLE `SpectralTypes` ADD FOREIGN KEY (reference) REFERENCES `References` (`id`);
ALTER TABLE `SpectralTypes` ADD FOREIGN KEY (object) REFERENCES `Objects` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (object) REFERENCES `Objects` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (reference) REFERENCES `References` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (type) REFERENCES `MeasurementTypes` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (object) REFERENCES `Objects` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (instrument) REFERENCES `Instruments` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Objects` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `References` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Photometry` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `SpectralTypes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Measurements` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Filters` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `SpectralTypesStrings` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Observations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Instruments` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MeasurementTypes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Objects` (`id`,`ra`,`dec`,`name`,`reference`) VALUES
-- ('','','','','');
-- INSERT INTO `References` (`id`,`ads_id`,`bibtex`,`comment`) VALUES
-- ('','','','');
-- INSERT INTO `Photometry` (`id`,`value`,`uncertainty`,`units`,`filter`,`reference`,`object`) VALUES
-- ('','','','','','','');
-- INSERT INTO `SpectralTypes` (`id`,`value`,`adopted_flag`,`uncertainty`,`reference`,`object`) VALUES
-- ('','','','','','');
-- INSERT INTO `Measurements` (`id`,`value`,`uncertainty`,`adopted_flag`,`object`,`reference`,`type`,`units`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Filters` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `SpectralTypesStrings` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Observations` (`id`,`object`,`instrument`,`date`,`filename`,`exposure_time`,`comment`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Instruments` (`id`,`telescope`,`name`,`mode`) VALUES
-- ('','','','');
-- INSERT INTO `MeasurementTypes` (`id`,`comment`) VALUES
-- ('','');
