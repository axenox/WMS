
CREATE TABLE IF NOT EXISTS `alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_area_id` int(11) DEFAULT NULL,
  `iot_device_id` int(11) DEFAULT NULL,
  `message` varchar(200) NOT NULL,
  `level` int(2) NOT NULL,
  `silenced` int(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carrier`
--

CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gate`
--

CREATE TABLE IF NOT EXISTS `gate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `storage_location_id` int(11) DEFAULT NULL,
  `gate_no` varchar(5) NOT NULL,
  `map_uri` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `handling_unit`
--

CREATE TABLE IF NOT EXISTS `handling_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) NOT NULL COMMENT 'HU',
  `description` varchar(100) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_location_id` int(11) NOT NULL COMMENT 'Lagerplatz',
  `product_id` int(11) DEFAULT NULL,
  `handling_unit_id` int(11) DEFAULT NULL COMMENT 'HU',
  `quanity` int(11) NOT NULL COMMENT 'Menge',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `iot_devices`
--

CREATE TABLE IF NOT EXISTS `iot_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_area_id` int(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kpi`
--

CREATE TABLE IF NOT EXISTS `kpi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `kpi` varchar(50) NOT NULL,
  `value` float NOT NULL,
  `time` datetime NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `picking_order`
--

CREATE TABLE IF NOT EXISTS `picking_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picking_tour_id` int(11) DEFAULT NULL COMMENT 'Tour',
  `order_type` varchar(20) NOT NULL,
  `source_location_id` int(11) DEFAULT NULL COMMENT 'Quelle',
  `destination_location_id` int(11) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `state` int(2) NOT NULL,
  `date_scheduled` date NOT NULL COMMENT 'Scheduled',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `picking_priority_id` int(11) NOT NULL,
  `pick_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87700 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `picking_order_pos`
--

CREATE TABLE IF NOT EXISTS `picking_order_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picking_order_id` int(11) NOT NULL COMMENT 'Pickauftrag',
  `source_location_id` int(11) NOT NULL COMMENT 'Lagerplatz',
  `target_location_id` int(11) DEFAULT NULL,
  `handling_unit_id` int(11) NOT NULL DEFAULT '1' COMMENT 'HU',
  `hu_qty` int(11) NOT NULL DEFAULT '1' COMMENT 'Quantity',
  `product_id` int(11) NOT NULL,
  `pick_failed_reason` varchar(20) DEFAULT NULL,
  `picked` int(1) NOT NULL DEFAULT '0' COMMENT 'Gepickt',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `picking_priority`
--

CREATE TABLE IF NOT EXISTS `picking_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `position` int(2) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `picking_tour`
--

CREATE TABLE IF NOT EXISTS `picking_tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL COMMENT 'Lager',
  `date` date NOT NULL COMMENT 'Datum',
  `assigned_to` varchar(11) DEFAULT NULL COMMENT 'Auszuführen durch',
  `state` int(2) NOT NULL DEFAULT '10' COMMENT 'Status',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2507 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pick_type`
--

CREATE TABLE IF NOT EXISTS `pick_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_on` datetime NOT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `product_group_id` int(11) DEFAULT NULL,
  `shipment_category_id` int(11) DEFAULT NULL,
  `state` int(2) NOT NULL,
  `qty_unit_id` int(11) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PRODUCT_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product_group`
--

CREATE TABLE IF NOT EXISTS `product_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product_handling_unit`
--

CREATE TABLE IF NOT EXISTS `product_handling_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `handling_unit_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty_per_hu` int(11) NOT NULL,
  `default_handling_unit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `qty_unit`
--

CREATE TABLE IF NOT EXISTS `qty_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipment`
--

CREATE TABLE IF NOT EXISTS `shipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_on` datetime NOT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `delivery_note_number` varchar(30) NOT NULL,
  `delivery_note_date` date NOT NULL,
  `order_no` varchar(30) DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '10',
  `from_site_id` int(11) DEFAULT NULL,
  `to_site_id` int(11) DEFAULT NULL,
  `eta` datetime DEFAULT NULL,
  `shipping_route_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipment_category`
--

CREATE TABLE IF NOT EXISTS `shipment_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipment_lu`
--

CREATE TABLE IF NOT EXISTS `shipment_lu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_on` datetime NOT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `shipment_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `scancode` varchar(50) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `length` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `shipment_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipping_route`
--

CREATE TABLE IF NOT EXISTS `shipping_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `vehicle_type_id` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time DEFAULT NULL,
  `departure_site_id` int(11) NOT NULL,
  `departure_yard_order_id` int(11) DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `destination_site_id` int(11) NOT NULL,
  `destination_yard_order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `code` varchar(10) NOT NULL COMMENT 'Code',
  `name` varchar(50) NOT NULL COMMENT 'Bezeichnung',
  `company_id` int(11) DEFAULT NULL,
  `site_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `site_type`
--

CREATE TABLE IF NOT EXISTS `site_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(50) NOT NULL COMMENT 'Bezeichnung',
  `category` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `storage_area`
--

CREATE TABLE IF NOT EXISTS `storage_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL COMMENT 'Code',
  `site_id` int(11) NOT NULL COMMENT 'Lager',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `storage_location`
--

CREATE TABLE IF NOT EXISTS `storage_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT 'Code',
  `storage_area_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicle_type`
--

CREATE TABLE IF NOT EXISTS `vehicle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `worker_schedule`
--

CREATE TABLE IF NOT EXISTS `worker_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `hours` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `yard_order`
--

CREATE TABLE IF NOT EXISTS `yard_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by_user_oid` binary(16) DEFAULT NULL,
  `modified_by_user_oid` binary(16) DEFAULT NULL,
  `direction` varchar(3) NOT NULL,
  `vehicle_type_id` int(11) NOT NULL,
  `vehicle_lic` varchar(10) DEFAULT NULL,
  `state` int(2) NOT NULL,
  `site_id` int(11) NOT NULL,
  `gate_id` int(11) DEFAULT NULL,
  `date_scheduled` date NOT NULL,
  `time_scheduled` time DEFAULT NULL,
  `supplier_site_id` int(11) DEFAULT NULL,
  `carrier_id` int(11) NOT NULL,
  `order_no` varchar(50) DEFAULT NULL,
  `number_of_lus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54894 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;