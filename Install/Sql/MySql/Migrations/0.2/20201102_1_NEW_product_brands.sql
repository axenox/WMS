-- UP

CREATE TABLE IF NOT EXISTS `brand` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`created_on` DATETIME NOT NULL,
	`created_by_user_oid` BINARY(16) NULL DEFAULT NULL,
	`modified_on` DATETIME NOT NULL,
	`modified_by_user_oid` BINARY(16) NULL DEFAULT NULL,
	`name` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
 COLLATE 'utf8_general_ci' ENGINE=InnoDB ROW_FORMAT=Dynamic AUTO_INCREMENT=1;

ALTER TABLE `product`
	ADD COLUMN `brand_id` INT NULL AFTER `weight`,
	ADD COLUMN `brand_model_code` VARCHAR(50) NULL DEFAULT NULL AFTER `brand_id`;

-- DOWN

DROP TABLE IF EXISTS `brand`;

ALTER TABLE `product`
	DROP COLUMN `brand_id`,
	DROP COLUMN `brand_model_code`;