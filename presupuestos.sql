
-- SET SQL_MODE = NO_AUTO_VALUE_ON_ZERO;
-- SET time_zone = +00:00;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Presupuesto`
--

CREATE DATABASE Presupuestos;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `ClienteId` int(11) NOT NULL AUTO_INCREMENT,
  `ClienteNombre` varchar(255) NOT NULL,
  `ClienteTelefono` varchar(100) NOT NULL,
  `ClienteEmail` varchar(64) NOT NULL,
  `ClienteDireccion` varchar(255) NOT NULL,
  PRIMARY KEY (`ClienteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Cliente`
--

INSERT INTO `Cliente` (`ClienteNombre`, `ClienteTelefono`, `ClienteEmail`, `ClienteDireccion`) VALUES
('Abel De Jesus', '809 999 4646', 'abel@gmail.com', 'Los alcarrizos Santo Domingo Oeste');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `Perfil`
--

CREATE TABLE `Perfil` (
  `PerfilId` int(11) NOT NULL AUTO_INCREMENT,
  `PerfilNombreComercial` varchar(255) NOT NULL,
  `PerfilPropietario` varchar(255) NOT NULL,
  `PerfilTelefono` varchar(30) NOT NULL,
  `PerfilDireccion` varchar(255) NOT NULL,
  `PerfilEmail` varchar(64) NOT NULL,
  `PerfilWeb` varchar(100) NOT NULL,
  PRIMARY KEY (`PerfilId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Perfil`
--

INSERT INTO `Perfil` (`PerfilNombreComercial`, `PerfilPropietario`, `PerfilTelefono`, `PerfilDireccion`, `PerfilEmail`, `PerfilWeb`) VALUES
('Pinturas Magistral SRL.', 'Milciades Mateo', ' (809) 568-8913', 'Av Los Restauradores, Santo Domingo', 'info@pinturasmagistral.com', 'www.pinturasmagistral.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Presupuesto`
--

CREATE TABLE `Presupuesto` (
  `PresupuestoId` int(11) NOT NULL AUTO_INCREMENT,
  `PresupuestoFecha` datetime NOT NULL,
  `PresupuestoClienteId` int(11) NOT NULL,
  `PresupuestoDescripcion` varchar(255) NOT NULL,
  `PresupuestoMonto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PresupuestoId`),
  FOREIGN KEY (`PresupuestoClienteId`) REFERENCES Cliente(`ClienteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalle`
--

CREATE TABLE `Detalle` (
  `DetalleId` int(11) NOT NULL AUTO_INCREMENT,
  `DetalleDescripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DetalleCantidad` int(11) NOT NULL,
  `DetallePrecio` decimal(10,2) NOT NULL,
  `DetallePresupuestoId` int(11) NOT NULL,
  PRIMARY KEY (`DetalleId`),
  FOREIGN KEY (`DetallePresupuestoId`) REFERENCES Presupuesto(`PresupuestoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `Tmp`
--

CREATE TABLE `Tmp` (
  `TmpId` int(11) NOT NULL AUTO_INCREMENT,
  `TmpDescripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TmpCantidad` int(11) NOT NULL,
  `TmpPrecio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`TmpId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;