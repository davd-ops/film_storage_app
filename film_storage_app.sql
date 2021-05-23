-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 23. kvě 2021, 13:11
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
('tt0268225', 'Classic Albums: Steely Dan - Aja', 'movie', '1999', '60 min', 'Aja was the biggest selling album of Steely Dan\'s career, reaching #3 on the U.S. Billboard chart and #5 in the UK. This is a portrait of the making of this 1977 jazz-rock album. It includes archival footage, newly recorded performances, and interviews wit', 'Walter Becker, Larry Carlton, Ian Dury, Donald Fagen', 'https://m.media-amazon.com/images/M/MV5BMTIzMDcyNzUwNV5BMl5BanBnXkFtZTcwODk1NzMyMQ@@._V1_SX300.jpg', 'Alan Lewens', 'Documentary, Music'),
('tt0295297', 'Harry Potter and the Chamber of Secrets', 'movie', '2002', '161 min', 'Forced to spend his summer holidays with his muggle relations, Harry Potter gets a real shock when he gets a surprise visitor: Dobby the house-elf, who warns Harry Potter against returning to Hogwarts, for terrible things are going to happen. Harry decides', 'Daniel Radcliffe, Rupert Grint, Emma Watson, Richard Griffiths', 'https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_SX300.jpg', 'Chris Columbus', 'Adventure, Family, Fantasy, Mystery'),
('tt0458339', 'Captain America: The First Avenger', 'movie', '2011', '124 min', 'It is 1942, America has entered World War II, and sickly but determined Steve Rogers is frustrated at being rejected yet again for military service. Everything changes when Dr. Erskine recruits him for the secret Project Rebirth. Proving his extraordinary ', 'Chris Evans, Hayley Atwell, Sebastian Stan, Tommy Lee Jones', 'https://m.media-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_SX300.jpg', 'Joe Johnston', 'Action, Adventure, Sci-Fi'),
('tt0944947', 'Game of Thrones', 'series', '2011–2019', '57 min', 'In the mythical continent of Westeros, several powerful families fight for control of the Seven Kingdoms. As conflict erupts in the kingdoms of men, an ancient enemy rises once again to threaten them all. Meanwhile, the last heirs of a recently usurped dyn', 'Peter Dinklage, Lena Headey, Emilia Clarke, Kit Harington', 'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_SX300.jpg', 'N/A', 'Action, Adventure, Drama, Fantasy'),
('tt10090796', 'Game of Thrones: The Last Watch', 'movie', '2019', '114 min', 'Chronicling the creation of Game of Thrones (2011)\'s final season, its most ambitious and complicated one.', 'Kevin Alexander, Alfie Allen, Jacob Anderson, Gethin Anthony', 'https://m.media-amazon.com/images/M/MV5BZDdlMzQzNDQtNTAxMS00NTMyLTgxYTAtYzQ0OGI1YzZhY2Y3XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg', 'Jeanie Finlay', 'Documentary'),
('tt1201607', 'Harry Potter and the Deathly Hallows: Part 2', 'movie', '2011', '130 min', 'Harry, Ron, and Hermione continue their quest of finding and destroying the Dark Lord\'s three remaining Horcruxes, the magical items responsible for his immortality. But as the mystical Deathly Hallows are uncovered, and Voldemort finds out about their mis', 'Ralph Fiennes, Michael Gambon, Alan Rickman, Daniel Radcliffe', 'https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SX300.jpg', 'David Yates', 'Adventure, Drama, Fantasy, Mystery'),
('tt1756545', 'Harry Potter and the Forbidden Journey', 'movie', '2010', '5 min', 'Enter through the towering castle gates and make your way down the familiar passages and corridors of Hogwarts School of Witchcraft and Wizardry. You\'ll visit iconic locations such as Dumbledore\'s office, the Defence Against the Dark Arts classroom, the Gr', 'Ken Bones, Claire Carroll, Robbie Coltrane, Remy Coup', 'https://m.media-amazon.com/images/M/MV5BNDM0YzMyNGUtMTU1Yy00OTE2LWE5NzYtZDZhMTBmN2RkNjg3XkEyXkFqcGdeQXVyMzU5NjU1MDA@._V1_SX300.jpg', 'Thierry Coup', 'Short, Adventure, Fantasy'),
('tt3732110', 'Jatt James Bond', 'movie', '2014', '220 min', 'Shinda was mistreated by his relatives therefore he finds other ways to have his love Laali. Shinda and his two other friends come up with a plan to solve all of their problems.', 'Gippy Grewal, Zareen Khan, Gurpreet Ghuggi, Yashpal Sharma', 'https://m.media-amazon.com/images/M/MV5BOWVmNjQ2YmYtY2M4ZS00NDdkLTljZmUtYTZkNmNjM2FhMWU3XkEyXkFqcGdeQXVyNjQ2MjQ5NzM@._V1_SX300.jpg', 'Rohit Jugraj', 'Comedy'),
('tt5986682', 'Ananas Comosus', 'movie', '2017', 'N/A', 'George works a long day. George\'s wife wants him to go the grocery store on his way home. George is so tired, he\'s forgotten to change out of his work clothes. George\'s strange job is going to lead to a strange trip to the store.', 'Kevin Davis, John Ross Clark, Alexa Castillo Shackelford, Derek Maher', 'https://m.media-amazon.com/images/M/MV5BOTJjMmE4YjQtZTFjMy00MmM4LWJhYTEtMWVmYWE1NmRmM2NhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMDMzNjcxMQ@@._V1_SX300.jpg', 'Tyler Nisbet', 'Short, Comedy'),
('tt7937220', 'Game of Thrones Conquest & Rebellion: An Animated History of the Seven Kingdoms', 'movie', '2017', '45 min', 'Aegon of House Targaryen sets out on his brave and bloody conquest to defeat the seven reigning families of Westeros. An impossible feat were it not for Aegon\'s possession of feared and ferocious dragons.', 'Pilou Asbæk, Nikolaj Coster-Waldau, Aidan Gillen, Conleth Hill', 'https://m.media-amazon.com/images/M/MV5BMGYzNDJiOTgtN2Y1OC00NmM2LTk3MTMtZmFhNmJlMzQzNGNhXkEyXkFqcGdeQXVyNDgyODgxNjE@._V1_SX300.jpg', 'N/A', 'Animation, Action, Fantasy, War');

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
(5, 'dddd', 'tt0241527'),
(6, 'dddd', 'tt0944947'),
(9, 'test', 'tt5986682'),
(19, 'dddd', 'tt7937220');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
