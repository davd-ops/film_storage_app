-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 22. kvě 2021, 23:13
-- Verze serveru: 10.4.16-MariaDB
-- Verze PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `film_storage_app`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `favorite_movies`
--

CREATE TABLE `favorite_movies` (
  `imdbId` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `type` varchar(256) NOT NULL,
  `year` varchar(256) NOT NULL,
  `runtime` varchar(256) NOT NULL,
  `plot` varchar(256) NOT NULL,
  `actors` varchar(256) NOT NULL,
  `poster` varchar(256) NOT NULL,
  `director` varchar(256) NOT NULL,
  `genre` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `favorite_movies`
--

INSERT INTO `favorite_movies` (`imdbId`, `title`, `type`, `year`, `runtime`, `plot`, `actors`, `poster`, `director`, `genre`) VALUES
('tt0241527', 'Harry Potter and the Sorcerer\'s Stone', 'movie', '2001', '152 min', 'This is the tale of Harry Potter, an ordinary 11-year-old boy serving as a sort of slave for his aunt and uncle who learns that he is actually a wizard and has been invited to attend the Hogwarts School for Witchcraft and Wizardry. Harry is snatched away f', 'Richard Harris, Maggie Smith, Robbie Coltrane, Saunders Triplets', 'https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg', 'Chris Columbus', 'Adventure, Family, Fantasy'),
('tt0295297', 'Harry Potter and the Chamber of Secrets', 'movie', '2002', '161 min', 'Forced to spend his summer holidays with his muggle relations, Harry Potter gets a real shock when he gets a surprise visitor: Dobby the house-elf, who warns Harry Potter against returning to Hogwarts, for terrible things are going to happen. Harry decides', 'Daniel Radcliffe, Rupert Grint, Emma Watson, Richard Griffiths', 'https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg', 'Chris Columbus', 'Adventure, Family, Fantasy, Mystery'),
('tt0458339', 'Captain America: The First Avenger', 'movie', '2011', '124 min', 'It is 1942, America has entered World War II, and sickly but determined Steve Rogers is frustrated at being rejected yet again for military service. Everything changes when Dr. Erskine recruits him for the secret Project Rebirth. Proving his extraordinary ', 'Chris Evans, Hayley Atwell, Sebastian Stan, Tommy Lee Jones', 'https://m.media-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_SX300.jpg', 'Joe Johnston', 'Action, Adventure, Sci-Fi');

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
(50, 'dddd', 'test@test', 'b103f138fec8d9d0a40dd97789cd7713', '2021-05-05 20:10:10'),
(51, 'test', 'test@test', '05a671c66aefea124cc08b76ea6d30bb', '2021-05-10 10:55:45');

-- --------------------------------------------------------

--
-- Struktura tabulky `user_movies`
--

CREATE TABLE `user_movies` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `movieId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `user_movies`
--

INSERT INTO `user_movies` (`id`, `user`, `movieId`) VALUES
(2, 'dddd', 'tt0295297'),
(4, 'test', 'tt0458339'),
(5, 'dddd', 'tt0241527');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `favorite_movies`
--
ALTER TABLE `favorite_movies`
  ADD PRIMARY KEY (`imdbId`);

--
-- Klíče pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `user_movies`
--
ALTER TABLE `user_movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pro tabulku `user_movies`
--
ALTER TABLE `user_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
