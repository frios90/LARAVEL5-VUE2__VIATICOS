/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : sofag_db

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-10-09 22:04:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of areas
-- ----------------------------

-- ----------------------------
-- Table structure for codes
-- ----------------------------
DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codes_type_id_foreign` (`type_id`),
  CONSTRAINT `codes_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of codes
-- ----------------------------

-- ----------------------------
-- Table structure for communes
-- ----------------------------
DROP TABLE IF EXISTS `communes`;
CREATE TABLE `communes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communes_region_id_foreign` (`region_id`),
  CONSTRAINT `communes_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of communes
-- ----------------------------
INSERT INTO `communes` VALUES ('1', 'Arica', '1', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('2', 'Camarones', '1', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('3', 'General Lagos', '1', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('4', 'Putre', '1', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('5', 'Alto Hospicio', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('6', 'Iquique', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('7', 'Camiña', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('8', 'Colchane', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('9', 'Huara', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('10', 'Pica', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('11', 'Pozo Almonte', '2', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('12', 'Antofagasta', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('13', 'Mejillones', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('14', 'Sierra Gorda', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('15', 'Taltal', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('16', 'Calama', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('17', 'Ollague', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('18', 'San Pedro de Atacama', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('19', 'María Elena', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('20', 'Tocopilla', '3', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('21', 'Chañaral', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('22', 'Diego de Almagro', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('23', 'Caldera', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('24', 'Copiapó', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('25', 'Tierra Amarilla', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('26', 'Alto del Carmen', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('27', 'Freirina', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('28', 'Huasco', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('29', 'Vallenar', '4', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('30', 'Canela', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('31', 'Illapel', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('32', 'Los Vilos', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('33', 'Salamanca', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('34', 'Andacollo', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('35', 'Coquimbo', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('36', 'La Higuera', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('37', 'La Serena', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('38', 'Paihuaco', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('39', 'Vicuña', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('40', 'Combarbalá', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('41', 'Monte Patria', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('42', 'Ovalle', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('43', 'Punitaqui', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('44', 'Río Hurtado', '5', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('45', 'Isla de Pascua', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('46', 'Calle Larga', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('47', 'Los Andes', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('48', 'Rinconada', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('49', 'San Esteban', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('50', 'La Ligua', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('51', 'Papudo', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('52', 'Petorca', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('53', 'Zapallar', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('54', 'Hijuelas', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('55', 'La Calera', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('56', 'La Cruz', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('57', 'Limache', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('58', 'Nogales', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('59', 'Olmué', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('60', 'Quillota', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('61', 'Algarrobo', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('62', 'Cartagena', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('63', 'El Quisco', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('64', 'El Tabo', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('65', 'San Antonio', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('66', 'Santo Domingo', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('67', 'Catemu', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('68', 'Llaillay', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('69', 'Panquehue', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('70', 'Putaendo', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('71', 'San Felipe', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('72', 'Santa María', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('73', 'Casablanca', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('74', 'Concón', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('75', 'Juan Fernández', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('76', 'Puchuncaví', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('77', 'Quilpué', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('78', 'Quintero', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('79', 'Valparaíso', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('80', 'Villa Alemana', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('81', 'Viña del Mar', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('82', 'Colina', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('83', 'Lampa', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('84', 'Tiltil', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('85', 'Pirque', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('86', 'Puente Alto', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('87', 'San José de Maipo', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('88', 'Buin', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('89', 'Calera de Tango', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('90', 'Paine', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('91', 'San Bernardo', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('92', 'Alhué', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('93', 'Curacaví', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('94', 'María Pinto', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('95', 'Melipilla', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('96', 'San Pedro', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('97', 'Cerrillos', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('98', 'Cerro Navia', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('99', 'Conchalí', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('100', 'El Bosque', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('101', 'Estación Central', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('102', 'Huechuraba', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('103', 'Independencia', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('104', 'La Cisterna', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('105', 'La Granja', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('106', 'La Florida', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('107', 'La Pintana', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('108', 'La Reina', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('109', 'Las Condes', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('110', 'Lo Barnechea', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('111', 'Lo Espejo', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('112', 'Lo Prado', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('113', 'Macul', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('114', 'Maipú', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('115', 'Ñuñoa', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('116', 'Pedro Aguirre Cerda', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('117', 'Peñalolén', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('118', 'Providencia', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('119', 'Pudahuel', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('120', 'Quilicura', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('121', 'Quinta Normal', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('122', 'Recoleta', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('123', 'Renca', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('124', 'San Miguel', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('125', 'San Joaquín', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('126', 'San Ramón', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('127', 'Santiago', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('128', 'Vitacura', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('129', 'El Monte', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('130', 'Isla de Maipo', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('131', 'Padre Hurtado', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('132', 'Peñaflor', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('133', 'Talagante', '7', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('134', 'Codegua', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('135', 'Coínco', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('136', 'Coltauco', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('137', 'Doñihue', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('138', 'Graneros', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('139', 'Las Cabras', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('140', 'Machalí', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('141', 'Malloa', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('142', 'Mostazal', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('143', 'Olivar', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('144', 'Peumo', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('145', 'Pichidegua', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('146', 'Quinta de Tilcoco', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('147', 'Rancagua', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('148', 'Rengo', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('149', 'Requínoa', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('150', 'San Vicente de Tagua Tagua', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('151', 'La Estrella', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('152', 'Litueche', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('153', 'Marchihue', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('154', 'Navidad', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('155', 'Peredones', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('156', 'Pichilemu', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('157', 'Chépica', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('158', 'Chimbarongo', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('159', 'Lolol', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('160', 'Nancagua', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('161', 'Palmilla', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('162', 'Peralillo', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('163', 'Placilla', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('164', 'Pumanque', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('165', 'San Fernando', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('166', 'Santa Cruz', '8', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('167', 'Cauquenes', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('168', 'Chanco', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('169', 'Pelluhue', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('170', 'Curicó', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('171', 'Hualañé', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('172', 'Licantén', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('173', 'Molina', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('174', 'Rauco', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('175', 'Romeral', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('176', 'Sagrada Familia', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('177', 'Teno', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('178', 'Vichuquén', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('179', 'Colbún', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('180', 'Linares', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('181', 'Longaví', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('182', 'Parral', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('183', 'Retiro', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('184', 'San Javier', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('185', 'Villa Alegre', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('186', 'Yerbas Buenas', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('187', 'Constitución', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('188', 'Curepto', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('189', 'Empedrado', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('190', 'Maule', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('191', 'Pelarco', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('192', 'Pencahue', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('193', 'Río Claro', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('194', 'San Clemente', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('195', 'San Rafael', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('196', 'Talca', '9', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('197', 'Arauco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('198', 'Cañete', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('199', 'Contulmo', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('200', 'Curanilahue', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('201', 'Lebu', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('202', 'Los Álamos', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('203', 'Tirúa', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('204', 'Alto Biobío', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('205', 'Antuco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('206', 'Cabrero', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('207', 'Laja', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('208', 'Los Ángeles', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('209', 'Mulchén', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('210', 'Nacimiento', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('211', 'Negrete', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('212', 'Quilaco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('213', 'Quilleco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('214', 'San Rosendo', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('215', 'Santa Bárbara', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('216', 'Tucapel', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('217', 'Yumbel', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('218', 'Chiguayante', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('219', 'Concepción', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('220', 'Coronel', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('221', 'Florida', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('222', 'Hualpén', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('223', 'Hualqui', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('224', 'Lota', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('225', 'Penco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('226', 'San Pedro de La Paz', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('227', 'Santa Juana', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('228', 'Talcahuano', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('229', 'Tomé', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('230', 'Bulnes', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('231', 'Chillán', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('232', 'Chillán Viejo', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('233', 'Cobquecura', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('234', 'Coelemu', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('235', 'Coihueco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('236', 'El Carmen', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('237', 'Ninhue', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('238', 'Ñiquen', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('239', 'Pemuco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('240', 'Pinto', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('241', 'Portezuelo', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('242', 'Quillón', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('243', 'Quirihue', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('244', 'Ránquil', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('245', 'San Carlos', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('246', 'San Fabián', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('247', 'San Ignacio', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('248', 'San Nicolás', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('249', 'Treguaco', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('250', 'Yungay', '10', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('251', 'Carahue', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('252', 'Cholchol', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('253', 'Cunco', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('254', 'Curarrehue', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('255', 'Freire', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('256', 'Galvarino', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('257', 'Gorbea', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('258', 'Lautaro', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('259', 'Loncoche', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('260', 'Melipeuco', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('261', 'Nueva Imperial', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('262', 'Padre Las Casas', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('263', 'Perquenco', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('264', 'Pitrufquén', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('265', 'Pucón', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('266', 'Saavedra', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('267', 'Temuco', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('268', 'Teodoro Schmidt', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('269', 'Toltén', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('270', 'Vilcún', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('271', 'Villarrica', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('272', 'Angol', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('273', 'Collipulli', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('274', 'Curacautín', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('275', 'Ercilla', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('276', 'Lonquimay', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('277', 'Los Sauces', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('278', 'Lumaco', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('279', 'Purén', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('280', 'Renaico', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('281', 'Traiguén', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('282', 'Victoria', '11', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('283', 'Corral', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('284', 'Lanco', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('285', 'Los Lagos', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('286', 'Máfil', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('287', 'Mariquina', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('288', 'Paillaco', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('289', 'Panguipulli', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('290', 'Valdivia', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('291', 'Futrono', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('292', 'La Unión', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('293', 'Lago Ranco', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('294', 'Río Bueno', '12', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('295', 'Ancud', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('296', 'Castro', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('297', 'Chonchi', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('298', 'Curaco de Vélez', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('299', 'Dalcahue', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('300', 'Puqueldón', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('301', 'Queilén', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('302', 'Quemchi', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('303', 'Quellón', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('304', 'Quinchao', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('305', 'Calbuco', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('306', 'Cochamó', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('307', 'Fresia', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('308', 'Frutillar', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('309', 'Llanquihue', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('310', 'Los Muermos', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('311', 'Maullín', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('312', 'Puerto Montt', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('313', 'Puerto Varas', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('314', 'Osorno', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('315', 'Puero Octay', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('316', 'Purranque', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('317', 'Puyehue', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('318', 'Río Negro', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('319', 'San Juan de la Costa', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('320', 'San Pablo', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('321', 'Chaitén', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('322', 'Futaleufú', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('323', 'Hualaihué', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('324', 'Palena', '13', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('325', 'Aisén', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('326', 'Cisnes', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('327', 'Guaitecas', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('328', 'Cochrane', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('329', 'O\'higgins', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('330', 'Tortel', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('331', 'Coihaique', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('332', 'Lago Verde', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('333', 'Chile Chico', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('334', 'Río Ibáñez', '14', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('335', 'Antártica', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('336', 'Cabo de Hornos', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('337', 'Laguna Blanca', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('338', 'Punta Arenas', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('339', 'Río Verde', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('340', 'San Gregorio', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('341', 'Porvenir', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('342', 'Primavera', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('343', 'Timaukel', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('344', 'Natales', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('345', 'Torres del Paine', '15', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `communes` VALUES ('346', 'Cabildo', '6', '2019-10-10 01:53:24', '2019-10-10 01:53:24');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_code_id_foreign` (`code_id`),
  CONSTRAINT `logs_code_id_foreign` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for managements
-- ----------------------------
DROP TABLE IF EXISTS `managements`;
CREATE TABLE `managements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_contact` int(10) unsigned NOT NULL,
  `mail_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_id` int(10) unsigned NOT NULL,
  `commune_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `managements_code_id_foreign` (`code_id`),
  KEY `managements_commune_id_foreign` (`commune_id`),
  CONSTRAINT `managements_code_id_foreign` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`),
  CONSTRAINT `managements_commune_id_foreign` FOREIGN KEY (`commune_id`) REFERENCES `communes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of managements
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------

-- ----------------------------
-- Table structure for menu_profile
-- ----------------------------
DROP TABLE IF EXISTS `menu_profile`;
CREATE TABLE `menu_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_profile_profile_id_foreign` (`profile_id`),
  KEY `menu_profile_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_profile_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `menu_profile_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_profile
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2019_10_09_130115_create__regions', '1');
INSERT INTO `migrations` VALUES ('2', '2019_10_09_130116_create__communes', '1');
INSERT INTO `migrations` VALUES ('3', '2019_10_09_130118_create_profiles', '1');
INSERT INTO `migrations` VALUES ('4', '2019_10_09_130319_create_areas', '1');
INSERT INTO `migrations` VALUES ('5', '2019_10_09_130430_create_menus', '1');
INSERT INTO `migrations` VALUES ('6', '2019_10_09_130533_create_menu_profile', '1');
INSERT INTO `migrations` VALUES ('7', '2019_10_09_130642_create_types', '1');
INSERT INTO `migrations` VALUES ('8', '2019_10_09_130740_create_codes', '1');
INSERT INTO `migrations` VALUES ('9', '2019_10_09_130951_create_managements', '1');
INSERT INTO `migrations` VALUES ('10', '2019_10_09_131224_create_rates', '1');
INSERT INTO `migrations` VALUES ('11', '2019_10_09_131436_create_logs', '1');
INSERT INTO `migrations` VALUES ('12', '2019_10_09_131437_create_users_table', '1');
INSERT INTO `migrations` VALUES ('13', '2019_10_09_132006_create_requests', '1');
INSERT INTO `migrations` VALUES ('14', '2019_10_09_132402_create_request_proyects', '1');
INSERT INTO `migrations` VALUES ('15', '2019_10_09_132524_create_request_details', '1');
INSERT INTO `migrations` VALUES ('16', '2019_10_09_132633_create_request_users', '1');
INSERT INTO `migrations` VALUES ('17', '2019_10_09_133141_create_request_payments', '1');
INSERT INTO `migrations` VALUES ('18', '2019_10_12_100000_create_password_resets_table', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for profiles
-- ----------------------------
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of profiles
-- ----------------------------

-- ----------------------------
-- Table structure for rates
-- ----------------------------
DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `management_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rates_management_id_foreign` (`management_id`),
  CONSTRAINT `rates_management_id_foreign` FOREIGN KEY (`management_id`) REFERENCES `managements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rates
-- ----------------------------

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordinal` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO `regions` VALUES ('1', 'Arica y Parinacota', 'XV', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('2', 'Tarapacá', 'I', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('3', 'Antofagasta', 'II', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('4', 'Atacama', 'III', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('5', 'Coquimbo', 'IV', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('6', 'Valparaiso', 'V', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('7', 'Metropolitana de Santiago', 'RM', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('8', 'Libertador General Bernardo O\'Higgins', 'VI', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('9', 'Maule', 'VII', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('10', 'Biobío', 'VIII', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('11', 'La Araucanía', 'IX', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('12', 'Los Ríos', 'XIV', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('13', 'Los Lagos', 'X', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('14', 'Aisén del General Carlos Ibáñez del Campo', 'XI', '2019-10-10 01:53:24', '2019-10-10 01:53:24');
INSERT INTO `regions` VALUES ('15', 'Magallanes y de la Antártica Chilena', 'XII', '2019-10-10 01:53:24', '2019-10-10 01:53:24');

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS `requests`;
CREATE TABLE `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_amount` int(11) NOT NULL,
  `providence_id` int(11) NOT NULL,
  `going_at` date NOT NULL,
  `return_at` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cash` int(11) NOT NULL,
  `destiny` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commune_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `user_management_id` int(10) unsigned NOT NULL,
  `code_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requests_commune_id_foreign` (`commune_id`),
  KEY `requests_user_id_foreign` (`user_id`),
  KEY `requests_user_management_id_foreign` (`user_management_id`),
  KEY `requests_code_id_foreign` (`code_id`),
  CONSTRAINT `requests_code_id_foreign` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`),
  CONSTRAINT `requests_commune_id_foreign` FOREIGN KEY (`commune_id`) REFERENCES `communes` (`id`),
  CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `requests_user_management_id_foreign` FOREIGN KEY (`user_management_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of requests
-- ----------------------------

-- ----------------------------
-- Table structure for request_details
-- ----------------------------
DROP TABLE IF EXISTS `request_details`;
CREATE TABLE `request_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `rate_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_details_request_id_foreign` (`request_id`),
  KEY `request_details_rate_id_foreign` (`rate_id`),
  CONSTRAINT `request_details_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`),
  CONSTRAINT `request_details_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of request_details
-- ----------------------------

-- ----------------------------
-- Table structure for request_payments
-- ----------------------------
DROP TABLE IF EXISTS `request_payments`;
CREATE TABLE `request_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `emited_at` date NOT NULL,
  `name_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rut_company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `path_document` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `code_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_payments_request_id_foreign` (`request_id`),
  KEY `request_payments_user_id_foreign` (`user_id`),
  KEY `request_payments_code_id_foreign` (`code_id`),
  CONSTRAINT `request_payments_code_id_foreign` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`),
  CONSTRAINT `request_payments_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`),
  CONSTRAINT `request_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of request_payments
-- ----------------------------

-- ----------------------------
-- Table structure for request_proyects
-- ----------------------------
DROP TABLE IF EXISTS `request_proyects`;
CREATE TABLE `request_proyects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_proyects_request_id_foreign` (`request_id`),
  CONSTRAINT `request_proyects_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of request_proyects
-- ----------------------------

-- ----------------------------
-- Table structure for request_users
-- ----------------------------
DROP TABLE IF EXISTS `request_users`;
CREATE TABLE `request_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `request_users_request_id_foreign` (`request_id`),
  KEY `request_users_user_id_foreign` (`user_id`),
  CONSTRAINT `request_users_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`),
  CONSTRAINT `request_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of request_users
-- ----------------------------

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of types
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rut` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `area_id` int(10) unsigned NOT NULL,
  `profile_id` int(10) unsigned NOT NULL,
  `commune_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_area_id_foreign` (`area_id`),
  KEY `users_profile_id_foreign` (`profile_id`),
  KEY `users_commune_id_foreign` (`commune_id`),
  CONSTRAINT `users_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  CONSTRAINT `users_commune_id_foreign` FOREIGN KEY (`commune_id`) REFERENCES `communes` (`id`),
  CONSTRAINT `users_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
