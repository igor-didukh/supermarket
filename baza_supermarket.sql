-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Янв 02 2017 г., 16:42
-- Версия сервера: 5.5.25
-- Версия PHP: 5.5.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `baza_supermarket`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dostawca`
--

CREATE TABLE IF NOT EXISTS `dostawca` (
  `idDostawca` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `adres` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idDostawca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `faktura`
--

CREATE TABLE IF NOT EXISTS `faktura` (
  `idFaktura` int(11) NOT NULL,
  `idKlient` int(11) DEFAULT NULL,
  `produkty` varchar(300) DEFAULT NULL,
  `wartosc` float DEFAULT NULL,
  `iloscProduktow` int(11) DEFAULT NULL,
  `idZamowienia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFaktura`),
  KEY `klient_faktura_FK` (`idKlient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `klient`
--

CREATE TABLE IF NOT EXISTS `klient` (
  `idKlient` int(11) NOT NULL AUTO_INCREMENT,
  `iloscPunktow` int(11) DEFAULT NULL,
  `imie` varchar(20) DEFAULT NULL,
  `nazwisko` varchar(20) DEFAULT NULL,
  `kodPocztowy` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idKlient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `klient`
--

INSERT INTO `klient` (`idKlient`, `iloscPunktow`, `imie`, `nazwisko`, `kodPocztowy`) VALUES
(1, 123, 'Ivan', 'Salo', '12345');

-- --------------------------------------------------------

--
-- Структура таблицы `konta`
--

CREATE TABLE IF NOT EXISTS `konta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `haslo` varchar(100) DEFAULT NULL,
  `uprawnienia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `konta`
--

INSERT INTO `konta` (`id`, `login`, `haslo`, `uprawnienia`) VALUES
(1, 'admin', '123', 'Admin'),
(2, 'buba', '123', 'Sale'),
(3, 'vasya', '123', 'Manager'),
(4, 'vova', '123', 'Stock'),
(5, 'ivan', '123', 'Delivery');

-- --------------------------------------------------------

--
-- Структура таблицы `logowanie`
--

CREATE TABLE IF NOT EXISTS `logowanie` (
  `login` varchar(20) NOT NULL,
  `haslo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `magazyn`
--

CREATE TABLE IF NOT EXISTS `magazyn` (
  `id` int(11) NOT NULL,
  `id_partii` int(11) NOT NULL,
  `ustawienie_regalu` char(7) NOT NULL,
  `ilosc_produktow_w_regale` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `magazynier`
--

CREATE TABLE IF NOT EXISTS `magazynier` (
  `idMagazynier` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idMagazynier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `magazynier`
--

INSERT INTO `magazynier` (`idMagazynier`, `imie`, `nazwisko`) VALUES
(1, 'Tristan', 'Bull');

-- --------------------------------------------------------

--
-- Структура таблицы `pracownicy`
--

CREATE TABLE IF NOT EXISTS `pracownicy` (
  `id_pracownika` int(11) NOT NULL AUTO_INCREMENT,
  `id_konta` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(30) NOT NULL,
  `PESEL` char(11) NOT NULL,
  `stanowisko` varchar(50) NOT NULL,
  `premia` float NOT NULL DEFAULT '0',
  `data_zatrudnienia` date NOT NULL,
  `data_zwolnienia` date DEFAULT NULL,
  `adres` varchar(120) NOT NULL,
  PRIMARY KEY (`id_pracownika`),
  KEY `id_konta` (`id_konta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `id_konta`, `imie`, `nazwisko`, `PESEL`, `stanowisko`, `premia`, `data_zatrudnienia`, `data_zwolnienia`, `adres`) VALUES
(1, 1, 'Vasya', 'Kikiradziuk', '11qq11', 'porjnerj vejvowklv', 14.8, '2015-08-19', NULL, ''),
(2, 2, 'Second', 'User', '', '11111111111111111', 0, '2016-08-15', NULL, ''),
(3, 3, 'Buba', 'Smith', 'fdsfsdf', 'asasasasasasasasasas', 5, '2014-11-01', '2015-12-01', 'sddfsdfsdfsd');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `unit`) VALUES
(1, 'Omar', 'kg'),
(3, 'Needle', 'pc');

-- --------------------------------------------------------

--
-- Структура таблицы `produkty`
--

CREATE TABLE IF NOT EXISTS `produkty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `punkty` int(11) DEFAULT '0',
  `dlugosc_gwarancji` int(11) DEFAULT NULL,
  `cena_sprzedazy` float DEFAULT NULL,
  `cena_zakupu` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `produktysprzedaz`
--

CREATE TABLE IF NOT EXISTS `produktysprzedaz` (
  `idProduktySprzedaz` int(11) NOT NULL,
  `idFaktury` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProduktySprzedaz`),
  KEY `produktySprzedaz_faktura_FK` (`idFaktury`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `promocja`
--

CREATE TABLE IF NOT EXISTS `promocja` (
  `id` int(11) NOT NULL,
  `data_rozpoczecia` datetime DEFAULT NULL,
  `data_zakonczenia` datetime DEFAULT NULL,
  `id_produktu` int(11) NOT NULL,
  `stara_cena` float NOT NULL,
  `nowa_cena` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reklamacje`
--

CREATE TABLE IF NOT EXISTS `reklamacje` (
  `id` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `data_zgloszenia` datetime DEFAULT NULL,
  `opis` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Reklamacje_Produkty_FK` (`id_produktu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sprzedawca`
--

CREATE TABLE IF NOT EXISTS `sprzedawca` (
  `idSprzedawca` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(30) DEFAULT NULL,
  `nazwisko` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idSprzedawca`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `sprzedawca`
--

INSERT INTO `sprzedawca` (`idSprzedawca`, `imie`, `nazwisko`) VALUES
(1, 'Johh', 'Smith III');

-- --------------------------------------------------------

--
-- Структура таблицы `transakcje`
--

CREATE TABLE IF NOT EXISTS `transakcje` (
  `id` int(11) NOT NULL,
  `id_kasjera` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `nr_paragonu` int(11) NOT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `data_sprzedazy` datetime DEFAULT NULL,
  `rodzaj_platnosci` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Transakcje_Pracownik_FK` (`id_kasjera`),
  KEY `transakcje_Produkty_FK` (`id_produktu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `wynagrodzenia`
--

CREATE TABLE IF NOT EXISTS `wynagrodzenia` (
  `id_wyplaty` int(11) NOT NULL,
  `pracownik` int(11) NOT NULL,
  `kwota` float NOT NULL,
  `data_wyplacenia` date DEFAULT NULL,
  PRIMARY KEY (`id_wyplaty`),
  KEY `wynagrodzenia_pracownicy_fk` (`pracownik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `zamowienie`
--

CREATE TABLE IF NOT EXISTS `zamowienie` (
  `idZamowienie` int(11) NOT NULL,
  `idProdukt` int(11) NOT NULL,
  `idKlient` int(11) NOT NULL,
  `idSprzedawca` int(11) NOT NULL,
  `iloscProduktow` int(11) NOT NULL,
  `produkty` varchar(300) DEFAULT NULL,
  `status1` varchar(20) DEFAULT NULL,
  `czasDostawy` datetime DEFAULT NULL,
  `dostawca` varchar(100) DEFAULT NULL,
  `nr_zamowienia` int(11) DEFAULT NULL,
  `idFaktura` int(11) DEFAULT NULL,
  PRIMARY KEY (`idZamowienie`),
  KEY `produkty_zam_FK` (`idProdukt`),
  KEY `faktura_zam_FK` (`idFaktura`),
  KEY `klient_zam_FK` (`idKlient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `faktura`
--
ALTER TABLE `faktura`
  ADD CONSTRAINT `klient_faktura_FK` FOREIGN KEY (`idKlient`) REFERENCES `klient` (`idKlient`);

--
-- Ограничения внешнего ключа таблицы `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`id_konta`) REFERENCES `konta` (`id`);

--
-- Ограничения внешнего ключа таблицы `produktysprzedaz`
--
ALTER TABLE `produktysprzedaz`
  ADD CONSTRAINT `produktySprzedaz_faktura_FK` FOREIGN KEY (`idFaktury`) REFERENCES `faktura` (`idFaktura`),
  ADD CONSTRAINT `produktySprzedaz_produkt_FK` FOREIGN KEY (`idProduktySprzedaz`) REFERENCES `produkty` (`id`);

--
-- Ограничения внешнего ключа таблицы `reklamacje`
--
ALTER TABLE `reklamacje`
  ADD CONSTRAINT `Reklamacje_Produkty_FK` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id`);

--
-- Ограничения внешнего ключа таблицы `transakcje`
--
ALTER TABLE `transakcje`
  ADD CONSTRAINT `Transakcje_Pracownik_FK` FOREIGN KEY (`id_kasjera`) REFERENCES `pracownicy` (`id_pracownika`),
  ADD CONSTRAINT `transakcje_Produkty_FK` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id`);

--
-- Ограничения внешнего ключа таблицы `wynagrodzenia`
--
ALTER TABLE `wynagrodzenia`
  ADD CONSTRAINT `wynagrodzenia_pracownicy_fk` FOREIGN KEY (`pracownik`) REFERENCES `pracownicy` (`id_pracownika`);

--
-- Ограничения внешнего ключа таблицы `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `faktura_zam_FK` FOREIGN KEY (`idFaktura`) REFERENCES `faktura` (`idFaktura`),
  ADD CONSTRAINT `klient_zam_FK` FOREIGN KEY (`idKlient`) REFERENCES `klient` (`idKlient`),
  ADD CONSTRAINT `produkty_zam_FK` FOREIGN KEY (`idProdukt`) REFERENCES `produkty` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
