-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 08 2024 г., 20:48
-- Версия сервера: 5.7.33
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shek605-31`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_categories`, `name`, `id_user`) VALUES
(1, 'Горячие', 1),
(2, 'Холодные', 2),
(3, 'Салаты', 3),
(4, 'Бодрые', 1),
(5, 'Заморское', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dishes`
--

CREATE TABLE `dishes` (
  `id_dishes` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cooking_Method` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cooking_Time_in_min` int(20) NOT NULL,
  `id_categories` int(11) NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `dishes`
--

INSERT INTO `dishes` (`id_dishes`, `name`, `Cooking_Method`, `Cooking_Time_in_min`, `id_categories`, `id_user`) VALUES
(1, 'Шашлык - Мясной обитель - свиной', 'Копчение на углях', 120, 1, 1),
(2, 'Шашлык - Благосклонность природы - грибной', 'Копчение на углях', 120, 1, 1),
(3, 'Шашлык - Рай из глубин - рыбный', 'Копчение на углях', 120, 1, 1),
(4, 'Суп - Котёл тысячи сердец - борщ', 'Варка', 90, 2, 2),
(5, 'Суп - Всё из ничего - солянка', 'Варка', 90, 2, 2),
(6, 'Суп - Сногсшибательный - Гороховый', 'Варка', 90, 2, 2),
(7, 'Салат - Новогодний - Цезарь', 'Смешивание ингредиентов', 25, 3, 3),
(8, 'Салат - Деревенский - Ёжик', 'Смешивание ингредиентов', 15, 3, 3),
(9, 'Салат - Поход дьявола - Винегрет', 'Смешивание ингредиентов', 40, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(9) NOT NULL,
  `name` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `measurement` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `measurement`) VALUES
(1, '1)Свиной ошеек\r\n2)Сухое шампанское\r\n3)Лук репчатый\r\n', '1)Килограмм\r\n2)Бутылки\r\n3)Штуки'),
(2, '1)Шампиньоны\r\n2)Смородина черная \r\n3)Мед жидкий\r\n4)Паприка молотая\r\n5)Соль (по желанию)\r\n', '1)Граммы\r\n2)Граммы\r\n3)Столовые ложки\r\n4)Столовые ложки\r\n5)Чайные ложки\r\n'),
(3, '3)Филе семги\r\n2)Масло оливковое\r\n3)Порошок карри\r\n4)Соль\r\n\r\n', '1)Грамм\r\n2)Столовые ложки\r\n3)Чайные ложки\r\n'),
(4, '1)Свиные ребра для бульона\r\n2)Лук репчатый \r\n3)Морковь средняя \r\n4)Свекла \r\n5)Капуста \r\n6)Картофель средний\r\n7)Болгарский перец\r\n8)Баклажан небольшой \r\n9)Зеленая фасоль \r\n10)Помидоры \r\n11)Томатная паста \r\n12)Лавровый лист \r\n13)Черный перец горошком \r\n14)Соль\r\n15)Жир (смалец, сливочное или растительное масло) \r\n16)Чеснок\r\n17)Зелень', '1)Килограммы\r\n2)Штуки\r\n3)Штуки\r\n4)Штуки\r\n5)Граммы\r\n6)Штуки\r\n7)Штуки\r\n8)Штуки\r\n9)Граммы\r\n10)Штуки\r\n11)Граммы\r\n12)Штуки\r\n13)Горошины\r\n15)Столовые ложки\r\n16)Зубчики\r\n17)По желанию'),
(5, '1)Грудинка копчёная\r\n2)Колбаса сырокопченая\r\n3)Морковь \r\n4)Лук репчатый \r\n5)Картофель \r\n6)Огурцы солёные \r\n7)Растительное масло\r\n8)Томатная паста \r\n9)Лавровый лист \r\n10)Соль \r\n11)Сахар (по желанию) \r\n12)Маслины \r\n13)Укроп\r\n14)Лимон\r\n15)Сметана', '1)Граммы\r\n2)Граммы\r\n3)Граммы\r\n4)Граммы\r\n5)Граммы\r\n6)Граммы\r\n7)Миллилитры\r\n8)Граммы\r\n9)Штуки\r\n10)Столовая ложка\r\n11)Чайная ложка\r\n12)Граммы\r\n13)Пучки\r\n14)Дольки\r\n'),
(6, '1)Горох Лущёный \r\n2)Ребрышки копченые \r\n3)Сосиски копченые \r\n4)Картофель\r\n5)Морковь\r\n6)Лук репчатый \r\n7)Масло растительное \r\n8)Соль\r\n9)Перец\r\n10)Зелень \r\n11)Вода ', '1)Граммы\r\n2)Килограммы\r\n3)Штуки\r\n4)Штуки\r\n5)Штуки \r\n6)Штуки\r\n7)Граммы\r\n11)Литры'),
(7, '1)Филе куриное \r\n2)Салат айсберг или романо \r\n3)Батон или багет \r\n4)Сыр пармезан \r\n5)Помидоры черри (или коктейльные)\r\n6)Яйца перепелиные \r\n7)Перец чёрный молотый\r\n8)Соль\r\n9)Масло растительное\r\n   Для соуса:\r\n10)Яйцо куриное\r\n11)Чеснок \r\n12)Каперсы (по желанию)\r\n13)Сыр пармезан\r\n14)Масло растительное \r\n15)Сок лимонный \r\n16)Соус вустерский (по желанию) \r\n17)Горчица \r\n18)Сахар\r\n\r\n', '1)Граммы\r\n2)Граммы\r\n3)Граммы\r\n4)Граммы\r\n5)Штуки\r\n6)Штуки\r\n9)Столовые ложки\r\n   Для соуса:\r\n10)Штуки\r\n11)Зубчики\r\n12)Штуки\r\n13)Граммы\r\n14)Миллилитры\r\n15)Чайные ложки\r\n16)Чайные ложки\r\n17)Чайные ложки\r\n18)Щепотки'),
(8, '1)Колбаса копченая \r\n2)Сыр твердый \r\n3)Кукуруза консервированная\r\n4)Яйца вареные \r\n5)Чеснок \r\n6)Майонез', '1)Граммы\r\n2)Граммы\r\n3)Граммы\r\n4)Штуки\r\n5)Зубчики\r\n6)Граммы'),
(9, '1)Свекла \r\n2)Морковь\r\n3)Картофель \r\n4)Горошек замороженный\r\n5)Лук салатный белый \r\n6)Сок лимона \r\n7)Соль \r\n8)Растительное масло \r\n', '1)Граммы\r\n2)Граммы\r\n3)Граммы\r\n4)Граммы\r\n5)Граммы\r\n6)Чайные ложки\r\n7)Чайные ложки\r\n8)Столовые ложки\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `recipe`
--

CREATE TABLE `recipe` (
  `id_recipe` int(11) NOT NULL,
  `Quantity` varchar(1600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ingredients` int(11) NOT NULL,
  `id_dishes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `recipe`
--

INSERT INTO `recipe` (`id_recipe`, `Quantity`, `id_ingredients`, `id_dishes`) VALUES
(1, '1)2,5\r\n2)1\r\n3)5\r\n4)По вкусу\r\n5)По вкусу\r\n\r\n', 1, 1),
(2, '1)300\r\n2)100\r\n3)1\r\n4)2\r\n5)1', 2, 2),
(3, '1)400\r\n2)4\r\n3)2\r\n4)По вкусу\r\n', 3, 3),
(4, '1)0,5\r\n2)3\r\n3)2\r\n4)2\r\n5)500\r\n6)4\r\n7)1\r\n8)1\r\n9)250\r\n10)2\r\n11)200\r\n12)2-3\r\n13)5-6\r\n14)По вкусу\r\n15)2\r\n16)4\r\n17)По вкусу', 4, 4),
(5, '1)250\r\n2)150\r\n3)150\r\n4)50\r\n5)200\r\n6)200\r\n7)20\r\n8)50\r\n9)1\r\n10)0,5\r\n11)0,5-1\r\n12)100\r\n13)1\r\n14)По вкусу\r\n15)По вкусу', 5, 5),
(6, '1)300\r\n2)1\r\n3)2-3\r\n4)2-3\r\n5)1\r\n6)1\r\n7)30\r\n8)По вкусу\r\n9)По вкусу\r\n10)По вкусу\r\n11)3', 6, 6),
(7, '1)400\r\n2)300\r\n3)160\r\n4)70\r\n5)10\r\n6)10\r\n7)По вкусу\r\n8)По вкусу\r\n9)3\r\n10)1\r\n11)1\r\n12)7\r\n13)10\r\n14)70\r\n15)1\r\n16)0,5\r\n17)1\r\n18)1', 7, 7),
(8, '1)100\r\n2)100\r\n3)140\r\n4)3\r\n5)1\r\n6)80', 8, 8),
(9, '1)300\r\n2)150\r\n3)150\r\n4)150\r\n5)100\r\n6)4-5\r\n7)0,25\r\n8)4-5', 9, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `md5password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `firstname`, `lastname`, `email`, `md5password`) VALUES
(1, 'Шехеров', 'Олег', 'ssheherov@gmail.com', 'lhwkjfhwerhu21'),
(2, 'Иванов', 'Иван', 'shekherovoi@gmail.com', 'lhwkjfhwerhu21'),
(3, 'Петров', 'Дмитрий', 'telotelesnoe@gmail.com', 'lhwkjfhwerhu21');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id_dishes`) USING BTREE,
  ADD KEY `id_categories` (`id_categories`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id_recipe`),
  ADD KEY `id_ingredients` (`id_ingredients`),
  ADD KEY `id_dishes` (`id_dishes`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id_dishes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `dishes_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ограничения внешнего ключа таблицы `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`id`) REFERENCES `recipe` (`id_ingredients`);

--
-- Ограничения внешнего ключа таблицы `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_3` FOREIGN KEY (`id_ingredients`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `recipe_ibfk_4` FOREIGN KEY (`id_dishes`) REFERENCES `dishes` (`id_dishes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
