-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 07. 08:32
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `turbodrive`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car`
--

CREATE TABLE `car` (
  `Id` int(11) NOT NULL,
  `LicensePlate` varchar(10) DEFAULT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `RentalPricePerDay` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Mileage` int(11) DEFAULT NULL,
  `Fenykep` varchar(64) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `motor_type` varchar(100) NOT NULL,
  `power_hp` int(11) NOT NULL,
  `gearbox` varchar(50) NOT NULL,
  `seats` int(11) NOT NULL,
  `drivetrain` varchar(50) NOT NULL,
  `fuel_consumption` decimal(10,4) NOT NULL,
  `description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `car`
--

INSERT INTO `car` (`Id`, `LicensePlate`, `Brand`, `Model`, `Year`, `RentalPricePerDay`, `Status`, `Mileage`, `Fenykep`, `motor_type`, `power_hp`, `gearbox`, `seats`, `drivetrain`, `fuel_consumption`, `description`) VALUES
(1, 'ASD123', 'Ford ', 'Focus', 2018, 25000.00, 'Közép', 317000, 'fordfocus.png', '1.5L benzinmotor', 150, 'Manuális', 5, 'Elsőkerékhajtás', 6.5000, 'A Ford Focus 2018 egy megbízható és jól felszerelt kompakt autó. Tökéletes választás mindennapi városi közlekedéshez és hosszú utakra is. A sportos megjelenés és a kényelmes vezethetőség a legnagyobb erősségei.'),
(2, 'AAA111', 'Lamborghini', 'Urus', 2022, 252000.00, 'Luxus', 176500, 'lamborghiniurus.png', '4.0L Biturbó benzinmotor', 650, 'Manuális', 5, 'Összkerékhajtás', 14.0000, 'A Lamborghini Urus 2022 egy luxus SUV, amely a sportautók erejét és a prémium jellemzőket ötvözi. Az autó lenyűgöző teljesítménye és elegáns dizájnja minden egyes vezetést izgalmassá tesz.'),
(3, 'BBB222', 'Audi', 'A6', 2019, 47777.00, 'Felső', 243000, 'audia6.png', '2.0L benzinmotor', 204, 'Automata', 5, 'Quattro', 6.0000, 'Az Audi A6 2019-es modellje a prémium középkategóriás szedánok között kiemelkedő. Elegáns belső tér, fejlett technológia és erőteljes motorok jellemzik, miközben az autó vezetése rendkívül kényelmes és dinamikus.'),
(4, 'DDR545', 'Lamborghini', 'Aventador', 2021, 273991.00, 'Luxus', 10000, 'lamborghiniaventador.png', '6.5L Szívó benzinmotor', 770, 'Automata', 2, 'Összkerékhajtás', 18.0000, 'A Lamborghini Aventador 2021 egy szuperautó, amely a V12-es motor erejével és elképesztő dizájnjával kiemelkedik. Az autó páratlan gyorsulást és vezetési élményt kínál.'),
(5, 'DFH375', 'Ford', 'Fiesta', 2020, 11737.00, 'Alsó', 250000, 'fordfiesta.png', '1.0L benzinmotor', 95, 'Manuális', 5, 'Elsőkerékhajtás', 4.5000, 'A Ford Fiesta 2020 egy kompakt városi autó, amely sportos megjelenésével és remek üzemanyag-hatékonyságával tűnik ki. Az új generációs modellben korszerű technológiai jellemzők és biztonsági rendszerek találhatók, miközben az autó dinamikus vezetési élmén'),
(6, 'XYZ456', 'Toyota', 'Yaris', 2019, 13000.00, 'Alsó', 200000, 'toyotayaris.png', '1.5L benzinmotor', 111, 'Manuális', 5, 'Elsőkerékhajtás', 5.0000, 'A Toyota Yaris 2019-es modellje tökéletes választás azok számára, akik megbízhatóságot, gazdaságos üzemeltetést és kényelmes városi közlekedést keresnek. Kiváló minőségű belső térrel és alacsony fenntartási költségekkel rendelkezik.'),
(7, 'QWE789', 'Honda', 'Fit', 2021, 12525.00, 'Alsó', 180000, 'hondafit.png', '1.5L benzinmotor', 130, 'Manuális', 5, 'Elsőkerékhajtás', 6.0000, 'A Honda Fit 2021 egy praktikus, kis méretű, de tágas belső térrel rendelkező városi autó. Az erősebb motorváltozatok és az energiatakarékos funkciók remek vezetési élményt biztosítanak mind a városban, mind az autópályán.'),
(8, 'FGH135', 'Hyundai', 'i10', 2018, 10959.00, 'Alsó', 300000, 'hyundaii10.png', '1.0L benzinmotor', 66, 'Automata', 5, 'Elsőkerékhajtás', 4.5000, 'A Hyundai i10 2018 kompakt városi autó, amely kis mérete ellenére kényelmes utasteret és gazdaságos üzemeltetést kínál. Az egyszerű, de elegáns dizájn és a megbízhatóság a legfőbb erősségei.'),
(9, 'JKL246', 'Renault', 'Clio', 2017, 12916.00, 'Alsó', 350000, 'renaultclio.png', '1.2L benzinmotor', 75, 'Automata', 5, 'Elsőkerékhajtás', 5.0000, 'A Renault Clio 2017-es modellje egy stílusos, kompakt autó, amely modern dizájnnal és fejlett technológiai megoldásokkal rendelkezik. A kényelmes vezethetőség és az alacsony fogyasztás ideális városi közlekedéshez.'),
(10, 'MNB112', 'BMW', '3 Series', 2020, 27399.00, 'Közép', 200000, 'bmw3series.png', '3.0L Turbó benzinmotor', 473, 'Manuális', 5, 'Hátsókerékhajtás', 11.0000, 'A BMW 3 Series 2020 egy elegáns és sportos szedán, amely kifinomult technológiai megoldásokkal és dinamikus vezetési élménnyel rendelkezik. Az autó ideális választás azoknak, akik a luxust és a teljesítményt keresik.'),
(11, 'OPQ987', 'Audi', 'A4', 2021, 29356.00, 'Közép', 150000, 'audia4.png', '2.0L Turbó dízelmotor', 136, 'Manuális', 5, 'Összkerékhajtás', 5.5000, 'Az Audi A4 2021 egy stílusos és prémium szedán, amely erőteljes motorokkal és kifinomult belső térrel rendelkezik. A vezetési élmény és a magas szintű komfort ideális választássá teszi.'),
(12, 'RST258', 'Mercedes', 'C-Class', 2022, 28313.00, 'Közép', 100000, 'mercedesclass.png', '1.5L benzinmotor', 156, 'Automata', 5, 'Elsőkerékhajtás', 6.0000, 'A Mercedes C-Class 2022-es modellje prémium középkategóriás autó, amely kifinomult dizájnnal, erőteljes motorokkal és fejlett vezetési segédrendszerekkel rendelkezik. Az autó a kényelem és a teljesítmény tökéletes kombinációját biztosítja.'),
(13, 'UVW135', 'Volkswagen', 'Golf', 2020, 25442.00, 'Közép', 220000, 'volkswagengolf.png', '2.0L Turbó benzinmotor', 245, 'Manuális', 5, 'Elsőkerékhajtás', 7.0000, 'A Volkswagen Golf 2020 az autóipar egyik legismertebb és legmegbízhatóbb modelle. Praktikus belső tér, dinamikus vezetési élmény és kiváló üzemanyag-hatékonyság jellemzi.'),
(14, 'FFH999', 'Bentley', 'Continental GT', 2022, 254421.00, 'Luxus', 30000, 'bentleycontinentalgt.png', '6.0L Turbó benzinmotor', 626, 'Automata', 4, 'Összkerékhajtás', 15.0000, 'A Bentley Continental GT 2022 egy luxus sportkupé, amely kifinomult dizájnjával és prémium teljesítményével garantálja a legjobb vezetési élményt. A belső tér kézműves minőségű, miközben az autó erőteljes motorokkal rendelkezik.'),
(15, 'DFR756', 'Jaguar', 'XE', 2021, 46970.00, 'Felső', 80000, 'jaguarxe.png', '2.0L dízelmotor', 201, 'Automata', 5, 'Hátsókerékhajtás', 5.0000, 'A Jaguar XE 2021 a sportos szedánok egyik ékköve. A dinamikus teljesítmény és a kifinomult brit dizájn kombinációja lehetővé teszi, hogy az autó kiemelkedjen a középkategóriás prémium szedánok között.'),
(16, 'HJK475', 'BMW', 'M4', 2022, 54798.00, 'Felső', 50000, 'bmwm4.png', '3.0L Turbo benzinmotor', 473, 'Manuális', 4, 'Hátsókerékhajtás', 10.0000, 'A BMW M4 2022-es modellje egy igazi sportautó, amely dinamikus vezetési élményt és erőteljes teljesítményt kínál. A kifinomult design és a csúcsminőségű technológia garantálja a legmagasabb szintű autózást.'),
(17, 'LKM263', 'BMW', '5 Series', 2022, 50884.00, 'Felső', 60000, 'bmw5series.png', '2.0L dízelmotor', 184, 'Automata', 5, 'Összkerékhajtás', 6.5000, 'A BMW 5 Series 2022 a sportos és kényelmes szedánok tökéletes kombinációja. Az autó prémium minőségű belső térrel és fejlett technológiával rendelkezik, miközben az erőteljes motorok a dinamikus vezetést is biztosítják.'),
(18, 'PQR524', 'Mercedes', 'E-Class', 2021, 52841.00, 'Felső', 70000, 'mercedeseclass.png', '3.0L hibridmotor', 312, 'Automata', 5, 'Összkerékhajtás', 2.5000, 'A Mercedes E-Class 2021-es modellje a luxus és a kényelem egyensúlyát kínálja. Az elegáns dizájn, a kényelmes vezetési élmény és a fejlett biztonsági rendszerek biztosítják a prémium utazást.'),
(19, 'VWX843', 'Rolls-Royce', 'Phantom', 2022, 195708.00, 'Luxus', 20000, 'rollsroycephantom.png', '6.75L Turbó benzinmotor', 563, 'Automata', 4, 'Hátsókerékhajtás', 15.0000, 'A Rolls-Royce Phantom 2022 a világ egyik legprémiumabb autója, amely páratlan luxust, kényelmet és stílust kínál. A W12-es motor és a tökéletes kidolgozás biztosítja a legfinomabb vezetési élményt.'),
(20, 'YZB284', 'Ferrari', 'Roma', 2023, 234850.00, 'Luxus', 15000, 'ferrariroma.png', '3.9L Bitturbó benzinmotor', 620, 'Automata', 2, 'Hátsókerékhajtás', 11.0000, 'A Ferrari Roma 2023 egy elegáns és sportos kupé, amely a Ferrari hagyományait ötvözi a modern technológiával. A V8-as biturbó motor kiemelkedő teljesítményt biztosít, miközben az autó stílusos és kifinomult megjelenésű.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `client`
--

CREATE TABLE `client` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contracts`
--

CREATE TABLE `contracts` (
  `contract_id` int(11) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `contract_details` text DEFAULT NULL,
  `signed_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `customers`
--

CREATE TABLE `customers` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `driver_license` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `maintenance`
--

CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `maintenance_date` date DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rentals`
--

CREATE TABLE `rentals` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `CarId` int(11) DEFAULT NULL,
  `RentalDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rentals`
--

INSERT INTO `rentals` (`Id`, `UserId`, `CarId`, `RentalDate`, `ReturnDate`, `TotalPrice`, `Status`) VALUES
(1, 1, 16, '2025-03-05', '2025-03-06', 30000.00, 'Igen');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `FelhasznaloNev` varchar(100) NOT NULL,
  `TeljesNev` varchar(60) NOT NULL,
  `SALT` varchar(64) NOT NULL,
  `HASH` varchar(64) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Jogosultsag` int(1) NOT NULL,
  `Aktiv` int(1) NOT NULL,
  `RegisztracioDatuma` datetime DEFAULT current_timestamp(),
  `FenykepUtvonal` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`Id`, `FelhasznaloNev`, `TeljesNev`, `SALT`, `HASH`, `Email`, `Jogosultsag`, `Aktiv`, `RegisztracioDatuma`, `FenykepUtvonal`) VALUES
(1, 'LakatosI', 'Lakatos István', 'jQGX8grO1yjNqhiZbtROcseiqj1NVZJd2iqlfxPx1GKLJ9H8smnLJ9dloScCK6Zp', 'dcedbd2d352d19c6eae0dfb12271b74d985c825b8d774afd2abd0d101b6e57ef', 'lakatosi@gmail.com', 9, 1, '2024-11-25 07:33:49', 'letoltes.jpg'),
(3, 'teszt', 'teszt', 'string', 'string', 'teszt', 0, 0, '2025-03-31 09:45:28', 'string'),
(25, 'asdadasdasddsadasddsadasddsa', 'asdasdasdasddsa', 'eJ6EYq1q92Z7TMcTvOIDVLfXPqxyca7pT2WcuN501LeLlqlq14J2h01SPTqwAIpi', '5973209a06caa1ebc82f64fd645777bf197deee10dd2fbbd74267e86874e02ab', 'egrid@kkszki.hu', 1, 1, '2025-02-13 09:13:16', 'default.jpg'),
(26, 'string', 'string', 'string', 'string', 'string', 0, 0, '2025-04-01 08:04:42', 'string'),
(29, 'string2', 'string', 'string', 'string', 'string2', 0, 0, '2025-04-01 08:04:42', 'string'),
(30, '2', '2', 'saltValue', 'hashValue', '2', 2, 2, '2025-04-01 10:39:33', 'fenykepUtvonalValue'),
(31, 'eddd', 'ddd', 'saltValue', 'hashValue', 'ddd', 1, 1, '2025-04-01 10:40:13', 'fenykepUtvonalValue');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- A tábla indexei `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `car_id` (`car_id`);

--
-- A tábla indexei `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `rental_id` (`rental_id`);

--
-- A tábla indexei `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `customer_id` (`UserId`),
  ADD KEY `car_id` (`CarId`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `FelhasznaloNev` (`FelhasznaloNev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rentals` (`Id`);

--
-- Megkötések a táblához `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `client` (`Id`);

--
-- Megkötések a táblához `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`Id`);

--
-- Megkötések a táblához `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rentals` (`Id`);

--
-- Megkötések a táblához `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`CarId`) REFERENCES `car` (`Id`),
  ADD CONSTRAINT `rentals_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
