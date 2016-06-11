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
  PRIMARY KEY (`id`)
) COMMENT 'Stores an astronomical object';

-- ---
-- Table 'References'
-- 
-- ---

DROP TABLE IF EXISTS `References`;
		
CREATE TABLE `References` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `ads_bibcode` CHAR(128) NULL DEFAULT NULL,
  `bibtex` MEDIUMTEXT NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  `citekey` CHAR(128) NULL DEFAULT NULL,
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
  `object_id` INTEGER NOT NULL DEFAULT NULL,
  `reference_id` INTEGER NULL DEFAULT NULL,
  `observation_id` INTEGER NULL DEFAULT NULL,
  `type` CHAR(128) NOT NULL DEFAULT 'NULL',
  `units` CHAR(128) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
) COMMENT 'General example of measurements';

-- ---
-- Table 'Observations'
-- 
-- ---

DROP TABLE IF EXISTS `Observations`;
		
CREATE TABLE `Observations` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `object_id` INTEGER NOT NULL DEFAULT NULL,
  `instrument_id` INTEGER NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `filename` INTEGER NULL DEFAULT NULL,
  `exposure_time` DECIMAL NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  `reference_id` INTEGER NULL DEFAULT NULL,
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
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
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
-- Table 'ObjectReferences'
-- 
-- ---

DROP TABLE IF EXISTS `ObjectReferences`;
		
CREATE TABLE `ObjectReferences` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  `object_id` INTEGER NOT NULL DEFAULT NULL,
  `reference_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Measurements` ADD FOREIGN KEY (object_id) REFERENCES `Objects` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (reference_id) REFERENCES `References` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (observation_id) REFERENCES `Observations` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (type) REFERENCES `MeasurementTypes` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (object_id) REFERENCES `Objects` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (instrument_id) REFERENCES `Instruments` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (reference_id) REFERENCES `References` (`id`);
ALTER TABLE `ObjectReferences` ADD FOREIGN KEY (object_id) REFERENCES `Objects` (`id`);
ALTER TABLE `ObjectReferences` ADD FOREIGN KEY (reference_id) REFERENCES `References` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Objects` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `References` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Measurements` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Observations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Instruments` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MeasurementTypes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ObjectReferences` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Objects` (`id`,`ra`,`dec`,`name`) VALUES
-- ('','','','');
-- INSERT INTO `References` (`id`,`ads_bibcode`,`bibtex`,`comment`,`citekey`) VALUES
-- ('','','','','');
-- INSERT INTO `Measurements` (`id`,`value`,`uncertainty`,`adopted_flag`,`object_id`,`reference_id`,`observation_id`,`type`,`units`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `Observations` (`id`,`object_id`,`instrument_id`,`date`,`filename`,`exposure_time`,`comment`,`reference_id`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Instruments` (`id`,`telescope`,`name`,`mode`,`comment`) VALUES
-- ('','','','','');
-- INSERT INTO `MeasurementTypes` (`id`,`comment`) VALUES
-- ('','');
-- INSERT INTO `ObjectReferences` (`id`,`comment`,`object_id`,`reference_id`) VALUES
-- ('','','','');
