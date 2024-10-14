-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.0
-- Время создания: Окт 14 2024 г., 13:43
-- Версия сервера: 8.0.35
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sologuide`
--

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `show_place_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `show_place_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 4),
(4, 1, 3),
(5, 6, 5),
(6, 5, 1),
(7, 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `show_place`
--

CREATE TABLE `show_place` (
  `id` int NOT NULL,
  `type` enum('Статуя','Музей','Выставка','Парк','Памятник') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `latitude` float NOT NULL,
  `longtitude` float NOT NULL,
  `city` varchar(30) NOT NULL,
  `addres` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `show_place`
--

INSERT INTO `show_place` (`id`, `type`, `name`, `description`, `latitude`, `longtitude`, `city`, `addres`) VALUES
(1, 'Статуя', 'Статуя_1', 'статуйка', 1, 1, 'Первый город', 'улица первых'),
(2, 'Музей', 'Музей восковых фигур', 'Музей восковых фигур знаменитостей', 2, 2, 'Москва', 'Улица восковых фигур'),
(3, 'Музей', 'Эрмитаж', 'Российский государственный художественный и культурно-исторический музей', 3, 3, 'Санкт-Петербург', 'Дворцовая площадь, 2'),
(4, 'Музей', 'кунсткамера', 'Российский государственный естественно-научный музей в Санкт-Петербурге, учреждённый Петром Великим в 1714 году. Исторически первый в России публичный музей', 2, 3, 'Санкт-Петербург', 'Университетская набережная, 3'),
(5, 'Парк', 'За Саймой', 'Парк с севера примыкает к Университетской улице, с востока — к Пролетарскому проспекту, а с двух других сторон ограничен рукавами реки Саймы. Преобладающая древесная порода — сосна.', 61.2443, 73.426, 'Сургут', 'ул. Университетская'),
(6, 'Памятник', 'Скважина Р-63', 'Скважина Р-63, пробуренная на Усть-Балыкском месторождении, стала судьбоносной для г. Нефтеюганска. 18 декабря 1962 года она дала мощнейший фонтан нефти с суточным дебитом 800 тонн, что доказало перспективность разработки нефтяных месторождений Западной Сибири. Открытие комплекса состоялось 26 мая 1984 года в честь 20-летия отправки на Омский НПЗ нефти Усть-Балыка. \r\nА в 2021 году мемориальный комплекс пополнил новый архитектурный объект – 15-метровая буровая вышка, увенчанная фонтаном нефти, возвышается на постаменте.', 61.0633, 72.6224, 'Нефтеюганск', 'берег протоки Юганская Обь');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `login`, `password`) VALUES
(1, 'user_1', 'user_1', '123'),
(3, 'Владислав', 'vlad_1990', '123'),
(4, 'Некто', 'incognito', '...'),
(5, 'Ибрагим', 'ibra', 'qwerty');

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

CREATE TABLE `visits` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `showplace_id` int NOT NULL,
  `grade` int DEFAULT NULL,
  `review` text,
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `visits`
--

INSERT INTO `visits` (`id`, `user_id`, `showplace_id`, `grade`, `review`, `datetime`) VALUES
(1, 1, 1, 1, 'Ничего не понял', '2024-10-09 11:33:08'),
(2, 3, 5, 5, 'Хорошее место, чтобы прогуляться.', '2024-10-09 11:47:55'),
(3, 5, 6, 5, 'Очень интересно', '2024-10-13 20:54:18'),
(4, 4, 6, 4, 'Круто!!!', '2024-10-13 20:54:37'),
(5, 1, 6, 2, 'Не нашёл, где она', '2024-10-13 20:55:03'),
(6, 3, 1, 4, 'Прикольно', '2024-10-13 21:02:35');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show_place_id` (`show_place_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `show_place`
--
ALTER TABLE `show_place`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `showplace_id` (`showplace_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `show_place`
--
ALTER TABLE `show_place`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`show_place_id`) REFERENCES `show_place` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`showplace_id`) REFERENCES `show_place` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
