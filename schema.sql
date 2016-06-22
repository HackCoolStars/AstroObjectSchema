-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Objects'
--
-- ---

DROP TABLE IF EXISTS `Objects`;

CREATE TABLE `Objects` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `ra` DECIMAL NULL DEFAULT NULL,
  `decl` DECIMAL NULL DEFAULT NULL,
  `name` CHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Reference'
--
-- ---

DROP TABLE IF EXISTS `Reference`;

CREATE TABLE `Reference` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `ads_bibcode` CHAR(128) NULL DEFAULT NULL,
  `citekey` CHAR(128) NULL DEFAULT NULL,
  `bibtex` MEDIUMTEXT NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Measurements'
--
-- ---

DROP TABLE IF EXISTS `Measurements`;

CREATE TABLE `Measurements` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `object_id` INTEGER NOT NULL DEFAULT NULL,
  `type` CHAR(128) NOT NULL DEFAULT 'NULL',
  `val` DECIMAL NOT NULL DEFAULT NULL,
  `uncertainty` DECIMAL NOT NULL DEFAULT NULL,
  `units` CHAR(128) NOT NULL DEFAULT 'NULL',
  `adopted_flag` INTEGER NULL DEFAULT NULL,
  `reference_id` INTEGER NULL DEFAULT NULL,
  `observation_id` INTEGER NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Observations'
--
-- ---

DROP TABLE IF EXISTS `Observations`;

CREATE TABLE `Observations` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `object_id` INTEGER NOT NULL DEFAULT NULL,
  `instrument_id` INTEGER NULL DEFAULT NULL,
  `obs_date` DATETIME NULL DEFAULT NULL,
  `filename` INTEGER NULL DEFAULT NULL,
  `exposure_time` DECIMAL NULL DEFAULT NULL,
  `reference_id` INTEGER NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Instruments'
--
-- ---

DROP TABLE IF EXISTS `Instruments`;

CREATE TABLE `Instruments` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
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
  `id` CHAR(128) NOT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ObjectReferences'
--
-- ---

DROP TABLE IF EXISTS `ObjectReferences`;

CREATE TABLE `ObjectReferences` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `object_id` INTEGER NOT NULL DEFAULT NULL,
  `reference_id` INTEGER NULL DEFAULT NULL,
  `comment` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Measurements` ADD FOREIGN KEY (object_id) REFERENCES `Objects` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (type) REFERENCES `MeasurementTypes` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (reference_id) REFERENCES `Reference` (`id`);
ALTER TABLE `Measurements` ADD FOREIGN KEY (observation_id) REFERENCES `Observations` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (object_id) REFERENCES `Objects` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (instrument_id) REFERENCES `Instruments` (`id`);
ALTER TABLE `Observations` ADD FOREIGN KEY (reference_id) REFERENCES `Reference` (`id`);
ALTER TABLE `ObjectReferences` ADD FOREIGN KEY (object_id) REFERENCES `Objects` (`id`);
ALTER TABLE `ObjectReferences` ADD FOREIGN KEY (reference_id) REFERENCES `Reference` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Objects` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reference` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Measurements` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Observations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Instruments` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `MeasurementTypes` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ObjectReferences` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Objects` (`id`,`ra`,`decl`,`name`) VALUES
-- ('','','','');
-- INSERT INTO `Reference` (`id`,`ads_bibcode`,`citekey`,`bibtex`,`comment`) VALUES
-- ('','','','','');
-- INSERT INTO `Measurements` (`id`,`object_id`,`type`,`val`,`uncertainty`,`units`,`adopted_flag`,`reference_id`,`observation_id`,`comment`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `Observations` (`id`,`object_id`,`instrument_id`,`obs_date`,`filename`,`exposure_time`,`reference_id`,`comment`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Instruments` (`id`,`telescope`,`name`,`mode`,`comment`) VALUES
-- ('','','','','');
-- INSERT INTO `MeasurementTypes` (`id`,`comment`) VALUES
-- ('','');
-- INSERT INTO `ObjectReferences` (`id`,`object_id`,`reference_id`,`comment`) VALUES
-- ('','','','');
