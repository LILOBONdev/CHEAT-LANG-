![Название изображения](https://cdn.discordapp.com/attachments/1257964986408374346/1258100694913646692/2el1_s.png?ex=6686d114&is=66857f94&hm=ad6f5fe15cc0195f47d70295675917196983cd4c329020d66ce31d036656674a&)
# UPDATE V.1.05 - CHEAT LANG (ЧИТ ТУТ)
* Шаблонный движок версии 1, добавлена базовая математика, базовый функционал и т.п, читать в документации в разделе "БАЗА"
* loadstring(game:HttpGet('https://raw.githubusercontent.com/LILOBONdev/CHEAT-LANG-/main/MainInCode.lua'))()

* 🟢 ~~Библиотека `aipath` повреждена в этой версии но ее код уже исправлен и будет залит на гит хаб через некоторое время.~~ - Пофикшено и работает стабильно

# ФАСТ ИНФА
* Обновления каждое воскресенье, патчи-новые библиотеки, новые команды и т.п. Все делается мной в одиночку, юзайте скрипт через loadstring. Потому-что я не думаю, что каждый захочет копировать эту громадину и вставлять в инжектор.
* Язык шаблонный и сделан для малых задач, по типу WallHack и т.п. Также со временем будут добавляться библиотеки, которые можно будет импортировать, например библиотека: CheatPackCounterBlox.
* Читайте документацию, она единый ваш помощник, а по отдельным багам и вопросам писать сюда: nl1754 DISCORD или https://discord.gg/FT6u863dhM. - Официльный сервер CHEAT LANG™.


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
__:getstuctures__ - Получает доступ к структурам всей игры, в зависимости от фильтра объектов: `filter:`. Если фильтровать все парты, то: `filter: allparts`. Если все меш парты, то: `filter: allmesh`. В этой бете движка вы можете менять прозрачность фильтрованным объектам. Пример: 

`/script game :getstuctures filter: allparts 0 true` - Аргумент после фильтрации это прозрачность.

__:spawn__ - Спавнит объект по типу part и т.д. Пример: `/script game :spawn part`. Объект спавнится относительно вашей позиции, в бета версии еще не предусмотрена многозадачность для спавна объектов.


# CheatLang - страница 3 :clipboard: 
**Импорт библиотек**/
Движок постепенно прибовляет библиотеки, вот метод получения библиотеки с помощью команды `/script`. Для начала вы импортируете библиотеку с помощью функции `importlibrary`, затем идет название библиотеки а после всех прописанных аргументов вы подключаете ее с помощью значения `true`. Но не исключено, что вы также можете отключить включенную библиотеку с помощью значения `false`. Пример кода:` /script importlibrary aipath true` >> кратковременная загрузка >> вы загрузили библиотеку, поздравляю!

**Список акутальных библиотек CHEAT LANG:**
`aipath` - Библиотека импортирует AI, а с помощью стрктуры PathFinding она направляет вашего И.Персонажа прямо на игрока ;
`transferobject` - Библиотека помогает редактировать позицию объекта A до позиции объекта B.

**TransferObject**
Неполное использование библиотеки:

`/transferobject lowerall part1 part2` - Здесь мы указываем объект A и объект B, а также с помощью конструкции `lowerall` мы исключаем все заглавные буквы из имен объектов, тем самым у нас появляется возможность использовать его, так как по правлам движка, все буквы в аргументах должны быть строчными. В бибилотеке уже все сделано за вас. вам не надо указывать позицию A и B.
Вы просто вписываете аргументы двух имен объектов и получаете результат, что A переместился в B.

Полное использование библиотеки:

`/transferobject lowerall part1 part2 classpro 10 20 30 cframeangles true`. Как мы видим, мы уже указываем класс PRO, который дает возможность выбирать, на сколько стадов отклонится парт от первоначальной траектории. Базовый математический график присутсвтует в библиотеке, а именно: x,y,z. X - Прямо, Y - Вверх, Z - Вперед, назад. `cframeangles` Мы видим, что мы выбрали график: Angles. Это значит, что мы врашаем объект относительно его позиции по заданным кординатам. Но по мимо графика Angles, есть также `cframebasic` - С помщью этого графика, мы можем двигать наш обхект в 3х направлениях, как я уже говорил: x,y,z. Также в конце мы видим bool значение, которое говорит нам о том, что будет ли объект закреплен или нет. Если нет, то: False, если да, то: True

**Bind любимой команды-кода**
Использование команды `bind` сэкономит вам время, по скольку вы задаете имя команды и ее начальный код в 3ем аргументе. Навзание команды может быть любым. Пример: `/bind mycommandname print lol` >> `/mycommandname` >> `print lol`. Не забывайте соблюдать синтаксис движка, пишите все строчными буквами.

:warning:  - Бинд команда только 1 к сожалению, это будет постпенно меняться с наличием обновлений. Также когда срабатывает бинд вашей команды вы должны убрать 1 лишний пробел в самом начали кода. Простите за такие неудобства :frowning:

© CHEAT LANG™ - Все права при себе.
