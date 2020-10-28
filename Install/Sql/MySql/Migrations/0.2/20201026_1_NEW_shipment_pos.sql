-- UP

ALTER TABLE `shipment`
	ADD COLUMN `time_shipped` DATETIME NULL DEFAULT NULL AFTER `shipping_route_id`,
	ADD COLUMN `time_received` DATETIME NULL DEFAULT NULL AFTER `time_shipped`;
	
CREATE TABLE IF NOT EXISTS `shipment_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_on` datetime NOT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `shipment_id` int(11) NOT NULL,
  `pos_no` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_hu_id` int(11) DEFAULT NULL,
  `qty_shipped` decimal(10,2) NOT NULL,
  `qty_received` decimal(10,2) DEFAULT NULL,
  `qa_sample_qty` decimal(10,2) DEFAULT NULL,
  `qa_result` varchar(20) DEFAULT NULL,
  `from_storage_area_id` int(11) DEFAULT NULL,
  `to_storage_area_id` int(11) DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `received_flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pos_no unique per shipment` (`shipment_id`,`pos_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- DOWN

DROP TABLE IF EXISTS `shipment_pos`;

ALTER TABLE `shipment`
	DROP COLUMN `time_shipped`,
	DROP COLUMN `time_received`;