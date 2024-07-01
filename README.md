# UPDATE V.1 - CHEAT LANG
* Шаблонный движок версии 1, добавлена базовая математика, базовый функционал и т.п, читать в документации в разделе "БАЗА"

# ФАСТ ИНФА
* Обновления каждое воскресенье, патчи-новые библиотеки, новые команды и т.п. Все делается мной в одиночку, юзайте скрипт через loadstring. Потому-что я не думаю, что каждый захочет копировать эту громадину и вставлять в инжектор.
* Язык шаблонный и сделан для малых задач, по типу WallHack и т.п. Также со временем будут добавляться библиотеки, которые можно будет импортировать, например библиотека: CheatPackCounterBlox.
* Читайте документацию, она единый ваш помощник, а по отдельным багам и вопросам писать сюда: nl1754 DISCORD или https://discord.gg/SYACB5DCZd. - Сервер студии, где находится разработчик.


# CheatLang - шаблонный движок для выполнения скромных задач. :books: 
**База**
Представляет из себя маленький терминал для ввода команд или для написания кода, инжект команд распознается при нажатии `LeftAlt`. Команды-код прописываются через префикс: `/`. В движок встроена базовая математика, вот все операторы: `+`   `-`   `/`   `*`   `<`   `>`. Чтобы посчитать, не нужно писать префикс  команду. Пример: 2 + 2. Обязательно после каждого аргумента ставить пробел!

**синтаксис**
К примеру возьмем команду: /print. Она распечатывает 2ой аргумент, но вы можете заменить аргумент на функцию. Список базовых функций:
*  `placeversion` - показывает версию плейса, где вы находитесь в данный момент ;
*  `placeid` - показывает идентификатор плейса, где вы находитесь в данный момент ;
*  `aboutlocal` - выводит информацию о локальном игроке ;
*  `commands` - показывает список базовых команд.

Эти функции также могут понадобиться когда вы будете писать код, через команду: /script

**Начало кодинга**
Стартовая позиция написания кода: `game`. С помощью данного кусочка кода вы получаете доступ к игре и непосредственно к объектно-ориентированному синтаксису.

__:loadasett__ - Загружает все, что есть в вашей игре с интервалом остановки в 0.1 сек. В этот момент процесс нельзя остановить, нужно ждать завершения загрузки асеттов. Не рекомендуется использовать во время игровой сессии, где объекты превышают +30К.

__:getplayers__ - Получает всех текущих игроков в игре. В случае использование этой функции вам необходимо указать параметры и островки кода. Пример ниже: `/script game :getplayers {fromcharacter} filter: isn't-me-teamcolor instance sound rbxassetid://4809574295 10 play`

Как мы видим мы получаем игроков как Character и с помощью функции: `filter:` мы фильтруем себя и игроков в нашей команде, а к игрокам не из нашей команды мы добавляем `sound` и выставляем громкость 10 и проигрываем его.


# CheatLang  - страница: 2 :clipboard: 
**Методы**
Все аргумента находясь в {фигурных скобках} называются методами, методы эта основа кодинга на CheatLang. С помощью методов вы можете конструировать код как вам нужно, список методов CheatLang:
*  `{fromcharacter}` - Получает игрока-игроков как Character ;
*  `{fromplayer}` - Получает игрока-игроков ;
*  `{fromplayername}` - Получает имя 1го игрока ;

**функции с пакетом game**
Как на первой странице, я продолжу перечислять функции которые идут после `game`:
__:getstuctures__ - Получает доступ к структурам всей игры, в зависимости от фильтра объектов: `filter:`. Если фильтровать все парты, то: `filter: allparts`. Если все меш парты, то: `filter: allmesh`. В это бете движка вы можете менять прозрачность фильтрованным объектам. Пример: 

`/script game :getstuctures filter: allparts 0 true` - Аргумент после фильтрации это прозрачность.

__:spawn__ - Спавнит объект по типу part и т.д. Пример: `/script game :spawn part`. Объект спавнится относительно вашей позиции, в бета версии еще не предусмотрена многозадачность для спавна объектов.


# CheatLang - страница 3 :clipboard: 
**Импорт библиотек**/
Движок постепенно прибовляет библиотеки, вот метод получения библиотеки с помощью команды `/script`. Для начала вы импортируете библиотеку с помощью функции `importlibrary`, затем идет название библиотеки а после всех прописанных аргументов вы подключаете ее с помощью значения `true`. Но не исключено, что вы также можете отключить включенную библиотеку с помощью значения `false`. Пример кода:` /script importlibrary pathai true` >> кратковременная загрузка >> вы загрузили библиотеку, поздравляю!

**Bind любимой команды-кода**
Использование команды `bind` сэкономит вам время, по скольку вы задаете имя команды и ее начальный код в 3ем аргументе. Навзание команды может быть любым. Пример: `/bind mycommandname print lol` >> `/mycommandname` >> `print lol`. Не забывайте соблюдать синтаксис движка, пишите все строчными буквами.

:warning:  - Бинд команда только 1 к сожалению, это будет постпенно менять с наличием обновлений. Также когда срабатывает бинд вашей команды вы должны убрать 1 лишний пробел в самом начали кода. Простите за такие неудобства :frowning:

© CHEAT LANG™ - Все права при себе.
