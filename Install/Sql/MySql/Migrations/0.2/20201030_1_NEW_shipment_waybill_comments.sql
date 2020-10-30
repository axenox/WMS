-- UP

ALTER TABLE `shipment`
	ADD COLUMN `comment` TEXT NULL DEFAULT NULL AFTER `time_received`,
	ADD COLUMN `waybill` VARCHAR(200) NULL DEFAULT NULL AFTER `comment`;

-- DOWN

ALTER TABLE `shipment`
	ADD DROP `comment`,
	ADD DROP `waybill`;