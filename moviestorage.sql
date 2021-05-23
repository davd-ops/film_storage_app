-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Počítač: sql.endora.cz:3317
-- Vytvořeno: Ned 23. kvě 2021, 18:44
-- Verze serveru: 5.7.26-29
-- Verze PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `moviestorage`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `favorite_movies`
--

CREATE TABLE `favorite_movies` (
  `id` int(11) NOT NULL,
  `imdbId` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `runtime` varchar(255) NOT NULL,
  `plot` varchar(1500) NOT NULL,
  `actors` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `favorite_movies`
--

INSERT INTO `favorite_movies` (`id`, `imdbId`, `title`, `type`, `year`, `runtime`, `plot`, `actors`, `poster`, `director`, `genre`, `user`) VALUES
(3, 'tt10090796', 'Game of Thrones: The Last Watch', 'movie', '2019', '114 min', 'Chronicling the creation of Game of Thrones (2011)\'s final season, its most ambitious and complicated one.', 'Kevin Alexander, Alfie Allen, Jacob Anderson, Gethin Anthony', 'https://m.media-amazon.com/images/M/MV5BZDdlMzQzNDQtNTAxMS00NTMyLTgxYTAtYzQ0OGI1YzZhY2Y3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'Jeanie Finlay', 'Documentary', 'test'),
(6, 'tt2653342', 'Game of Thrones: Season 2 - Character Profiles', 'movie', '2013', '16 min', 'Get to know the major power players in Season 2 of \'Game of Thrones\' with these seven profiles, including Renly and Stannis Baratheon, Robb Stark, Theon Greyjoy and more.', 'Alfie Allen, Gethin Anthony, John Bradley, Emilia Clarke', 'https://m.media-amazon.com/images/M/MV5BMTU1MzU2MDE4MV5BMl5BanBnXkFtZTgwNTc3NzA2MDE@._V1_SX300.jpg', 'N/A', 'Documentary, Short', 'test'),
(7, 'tt10090796', 'Game of Thrones: The Last Watch', 'movie', '2019', '114 min', 'Chronicling the creation of Game of Thrones (2011)\'s final season, its most ambitious and complicated one.', 'Kevin Alexander, Alfie Allen, Jacob Anderson, Gethin Anthony', 'https://m.media-amazon.com/images/M/MV5BZDdlMzQzNDQtNTAxMS00NTMyLTgxYTAtYzQ0OGI1YzZhY2Y3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'Jeanie Finlay', 'Documentary', 'dddd'),
(8, 'tt2653342', 'Game of Thrones: Season 2 - Character Profiles', 'movie', '2013', '16 min', 'Get to know the major power players in Season 2 of \'Game of Thrones\' with these seven profiles, including Renly and Stannis Baratheon, Robb Stark, Theon Greyjoy and more.', 'Alfie Allen, Gethin Anthony, John Bradley, Emilia Clarke', 'https://m.media-amazon.com/images/M/MV5BMTU1MzU2MDE4MV5BMl5BanBnXkFtZTgwNTc3NzA2MDE@._V1_SX300.jpg', 'N/A', 'Documentary, Short', 'dddd'),
(9, 'tt0284083', 'Bond of Love', 'movie', '2001', '174 min', 'Vijay Kapoor, a wealthy businessman and his family are deceived by Rajesh, Vijay Kapoor\'s employee and son in law. A struggle begins by both father-son duos to regain their business and position.', 'Amitabh Bachchan, Rakhee Gulzar, Akshay Kumar, Karisma Kapoor', 'https://m.media-amazon.com/images/M/MV5BZmNmOTM5ZGUtNTFiZS00M2E2LTk2NzAtNTJlZmQ0MGQyOTMwXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg', 'Suneel Darshan', 'Drama, Family', 'dddd'),
(10, 'tt1201607', 'Harry Potter and the Deathly Hallows: Part 2', 'movie', '2011', '130 min', 'Harry, Ron, and Hermione continue their quest of finding and destroying the Dark Lord\'s three remaining Horcruxes, the magical items responsible for his immortality. But as the mystical Deathly Hallows are uncovered, and Voldemort finds out about their mission, the biggest battle begins and life as they know it will never be the same again.', 'Ralph Fiennes, Michael Gambon, Alan Rickman, Daniel Radcliffe', 'https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg', 'David Yates', 'Adventure, Drama, Fantasy, Mystery', 'dddd');

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `create_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `create_datetime`) VALUES
(50, 'dddd', 'test@test', '05a671c66aefea124cc08b76ea6d30bb', '2021-05-05 20:10:10'),
(51, 'test', 'test@test', '05a671c66aefea124cc08b76ea6d30bb', '2021-05-10 10:55:45'),
(52, 'newtest', 'new@new.cz', '902855b701346155b5c59c0523425d26', '2021-05-23 16:38:40');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `favorite_movies`
--
ALTER TABLE `favorite_movies`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `favorite_movies`
--
ALTER TABLE `favorite_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
