-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 20 2023 г., 19:11
-- Версия сервера: 10.6.9-MariaDB
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `texts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `AUTHORS`
--

CREATE TABLE `AUTHORS` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `AUTHORS`
--

INSERT INTO `AUTHORS` (`id`, `name`) VALUES
(1, 'DC'),
(2, 'Агата Кристи'),
(3, 'Майк Омер'),
(4, 'Борис Акунин'),
(5, 'Джон Маррс'),
(6, 'Marvel'),
(7, 'Уилки Коллинз'),
(8, 'Стивен Кинг'),
(9, 'Говард Лавкрафт'),
(10, 'Эдгар По');

-- --------------------------------------------------------

--
-- Структура таблицы `CATEGORIES`
--

CREATE TABLE `CATEGORIES` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `CATEGORIES`
--

INSERT INTO `CATEGORIES` (`id`, `name`, `code`) VALUES
(1, 'Ужасы', 'horror'),
(5, 'Фэнтези', 'fantasy'),
(7, 'Фантастика', 'fantastic'),
(9, 'Детективы', 'detective'),
(11, 'Комиксы', 'comics');

-- --------------------------------------------------------

--
-- Структура таблицы `POSTS`
--

CREATE TABLE `POSTS` (
  `id` int(5) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `POSTS`
--

INSERT INTO `POSTS` (`id`, `active`, `title`, `code`, `content`, `category_id`, `author_id`, `date`) VALUES
(23, 1, 'Страна радости', 'strana-radosti', 'Студент Девин Джонс, решивший подработать в парке развлечений \"Страна радости\", внезапно словно попадает в своеобразный параллельный мир.\r\n\r\nЗдесь живут по своим правилам, говорят на особом языке и очень не любят, когда кто-то задает \"лишние\" вопросы. Особенно – если они касаются убийства молодой девушки Линды Грей, тело которой было обнаружено в парке, в павильоне \"Дом ужасов\".', 1, 8, '2023-06-16 16:20:21'),
(24, 1, 'Superman', 'superman', 'True comicbook', 11, 1, '2023-06-16 16:37:23'),
(25, 1, 'Batman', 'batman', 'True comicbook', 11, 6, '2023-06-16 16:38:10'),
(26, 1, 'Spider-man', 'spider-man', 'True comicbook', 11, 6, '2023-06-16 16:38:26'),
(27, 1, 'X-man', 'x-man', 'True comicbook', 11, 6, '2023-06-16 16:38:40'),
(28, 1, 'Hulk', 'hulk', 'True comicbook', 11, 6, '2023-06-16 16:38:55'),
(29, 1, 'Green Lantern', 'green-lantern', 'True comicbook', 11, 1, '2023-06-16 16:39:11'),
(30, 1, 'Десять негритят', 'desyat-negrityat', 'Десять никак не связанных между собой людей в особняке на уединенном острове... Кто вызвал их сюда таинственным приглашением? Зачем кто-то убивает их, одного за другим, самыми невероятными способами? Почему все происходящее так тесно переплетено с веселым детским стишком?', 9, 2, '2023-06-16 16:40:27'),
(31, 1, 'Убийства по алфавиту', 'ubiystva-po-alfavitu', 'В английском алфавите 26 букв. В подписи преступника, затеявшего с Эркюлем Пуаро игру при помощи писем, всего три буквы, первые, А, B и С. Он планирует совершить убийства в местах, названия которых расположены в алфавитном порядке. Задача Пуаро – разгадать замыслы убийцы и не дать ему совершить задуманные 26 преступлений.', 9, 2, '2023-06-16 16:40:42'),
(32, 1, 'Гибельное влияние', 'gibelnoe-vliyanie', 'Лейтенант полиции Нью-Йорка Эбби Маллен – психолог-переговорщик. За считанные секунды ей нужно найти единственно верные слова, чтобы вооруженный убийца не спустил курок. А для этого – составить его психологический профиль, имея минимум информации. Эбби – как профайлер, только быстрее и круче. Она готова ко всему. <br><br>Но не к этому...', 9, 3, '2023-06-16 16:49:56'),
(33, 1, 'Внутри убийцы', 'vnutri-ubiycy', 'Профайлер... Криминальный психолог, буквально по паре незначительных деталей способный воссоздать облик и образ действий самого хитроумного преступника. Эти люди выглядят со стороны как волшебники, как супергерои. Тем более если профайлер – женщина... На мосту в Чикаго, облокотившись на перила, стоит молодая красивая женщина. Очень бледная и очень грустная. Она неподвижно смотрит на темную воду, прикрывая ладонью плачущие глаза. И никому не приходит в голову, что... ОНА МЕРТВА.', 9, 3, '2023-06-16 16:50:10'),
(34, 1, 'Яма', 'yama', 'Большое приключение Эраста Петровича Фандорина, рассказанное его бессменным помощником Масахиро Сибатой, началось в первый день двадцатого столетия.<br><br>Только что им пришлось соперничать с самым знаменитым детективом Англии и самым известным преступником Франции, и вот уже предстоит новое состязание умов. Великому сыщику брошен вызов, и Маса еще не знает, какие душевные потрясения ждут их обоих.', 9, 4, '2023-06-16 16:50:25'),
(35, 1, 'Когда ты исчез', 'kogda-ty-ischez', 'Она жаждала правды. Пришло время пожалеть об этом...<br><br>Однажды утром Кэтрин обнаружила, что ее муж Саймон исчез. Дома остались все вещи, деньги и документы. Но он не мог просто взять и уйти. Не мог бросить ее и детей. Значит, он в беде...<br><br>И все же это не так. Саймон действительно взял и ушел. Он знает, что сделал и почему покинул дом. Ему известна страшная тайна их брака, которая может уничтожить Кэтрин. Все, чем она представляет себе их совместную жизнь, – ложь.', 9, 5, '2023-06-16 16:50:45'),
(36, 1, 'Отель с привидениями', 'otel-s-privideniyami', 'Роман \"Отель с привидениями\" – это мастерское сочетание детектива и истории о привидениях. Действие разворачивается в Венеции – городе темных каналов, пустынных мостов и таинственных смертей. Старинное палаццо превратили в фешенебельный отель, но он продолжает хранить свои мрачные секреты, сводя с ума постояльцев, заставляя их задаваться вопросом, кто они – орудия рока или просто сумасшедшие?\r\n', 1, 7, '2023-06-16 16:51:00'),
(37, 1, 'Долгая прогулка', 'dolgaya-progulka', 'Это была страшная игра – игра на выживание. Это была Долгая Прогулка. Прогулка со Смертью, ибо смерть ожидала каждого упавшего. Дорога к счастью – потому что победивший в игре получал все.\r\n', 1, 8, '2023-06-16 16:51:17'),
(38, 1, 'Кэрри', 'kerri', 'Маленький провинциальный городок в Новой Англии в одночасье становится \"мертвым городом\". На улицах лежат трупы, над домами бушует смертоносное пламя. И весь этот кошмар огненного Апокалипсиса – дело рук одного человека, девушки Кэрри, жалкой, запуганной дочери чудаковатой вдовы. Долгие годы дремал в Кэрри талант телекинеза, чтобы однажды проснуться.\r\n', 1, 8, '2023-06-16 16:51:40'),
(39, 1, 'Зов Ктулху', 'zov-ktulhu', 'При жизни этот писатель не опубликовал ни одной книги, после смерти став кумиром как массового читателя, так и искушенного эстета, и неиссякаемым источником вдохновения для кино- и игровой индустрии, его называли \"Эдгаром По ХХ века\", гениальным безумцем и адептом тайных знаний; его творчество уникально настолько, что потребовало выделения в отдельный поджанр, им восхищались Роберт Говард и Клайв Баркер, Хорхе Луис Борхес и Айрис Мёрдок.', 1, 9, '2023-06-16 16:51:59'),
(40, 1, 'Куджо', 'kudzho', 'Увалень сенбернар, преследуя кролика, забирается в нору. А в ней таится зловещая тварь, жуткое, кошмарное нечто...\r\n', 1, 8, '2023-06-16 16:52:18'),
(41, 1, 'Убийства на улице Морг', 'ubiystva-na-ulice-morg', 'Эдгар Аллан По – знаменитый американский поэт, прозаик, критик, журналист. Человек ослепительного таланта и горестной судьбы. Ненавистники и почитатели, подражатели и последователи – всем им, и уже не один век, не дает покоя наследие Эдгара По. \"Золотой жук\", \"Убийства на улице Морг\", \"Тайна Мари Роже\", \"Похищенное письмо\", \"Заживо погребенные\", \"Сердце-обличитель\" и другие рассказы, представленные в настоящем сборнике, являются ярчайшими образцами прозы Эдгара По, в которой писатель обнаружил блистательное мастерство и достиг вершины художественного совершенства.', 1, 10, '2023-06-16 16:52:39');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(19, 'user', '5fe043b201c6461038730812e9bc64de9e1c8229'),
(20, 'Allor', '5fe043b201c6461038730812e9bc64de9e1c8229');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `AUTHORS`
--
ALTER TABLE `AUTHORS`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `CATEGORIES`
--
ALTER TABLE `CATEGORIES`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `POSTS`
--
ALTER TABLE `POSTS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`,`author_id`),
  ADD KEY `authors` (`author_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `AUTHORS`
--
ALTER TABLE `AUTHORS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `CATEGORIES`
--
ALTER TABLE `CATEGORIES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `POSTS`
--
ALTER TABLE `POSTS`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `POSTS`
--
ALTER TABLE `POSTS`
  ADD CONSTRAINT `authors` FOREIGN KEY (`author_id`) REFERENCES `AUTHORS` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `categories` FOREIGN KEY (`category_id`) REFERENCES `CATEGORIES` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;