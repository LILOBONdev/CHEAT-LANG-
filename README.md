![C.H.BANNER](https://cdn.discordapp.com/attachments/1271329696377733186/1272694733822627920/CheatlangBannerTo.png?ex=66bbe8d6&is=66ba9756&hm=85fec716dfc348f8373c596e6013b64273791047ef1c8d8379a4fca3ae7e7e95&)
# UPDATE V.1.09 - CHEAT LANG (ЧИТ ТУТ)
* Добавлен функционал измнения среды, а именно изменения аттрибутов, изменения колизии игрока ;
* Добавлены циклы в команду `/createprogress` ;
* В этой версии есть кусок кода по созданию своего чита, но пока-что это в бете + я не писал по этому поводу доку ;
* loadstring(game:HttpGet('https://raw.githubusercontent.com/LILOBONdev/CHEAT-LANG-/main/sys.lua'))()

# ФАСТ ИНФА
* Обновления каждое воскресенье, патчи-новые библиотеки, новые команды и т.п. Все делается мной в одиночку, но с идеями мне помогает мой кент, так-что не в одиночку, просто текст лень переписывать, юзайте скрипт через loadstring. Потому-что я не думаю, что каждый захочет копировать эту громадину и вставлять в инжектор.
* [Disocrd Server создателей](https://discord.gg/eyP9RuXq5J) - Нас много )

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
Движок постепенно прибовляет библиотеки, вот метод получения библиотеки с помощью команды `/import library`. Для начала вы импортируете библиотеку с помощью функции `import`, затем идет название библиотеки а после всех прописанных аргументов вы подключаете ее с помощью значения `true`. Но не исключено, что вы также можете отключить включенную библиотеку с помощью значения `false`. Пример кода:` /import library aipath true` >> кратковременная загрузка >> вы загрузили библиотеку, поздравляю!

**Список акутальных библиотек CHEAT LANG:**
`aipath` - Библиотека импортирует AI, а с помощью стрктуры PathFinding она направляет вашего И.Персонажа прямо на игрока ;
`transferobject` - Библиотека помогает редактировать позицию объекта A до позиции объекта B.

**TransferObject**
Неполное использование библиотеки:

`/transferobject lowerall part1 part2` - Здесь мы указываем объект A и объект B, а также с помощью конструкции `lowerall` мы исключаем все заглавные буквы из имен объектов, тем самым у нас появляется возможность использовать его, так как по правилам движка, все буквы в аргументах должны быть строчными. В бибилотеке уже все сделано за вас. вам не надо указывать позицию A и B.
Вы просто вписываете аргументы двух имен объектов и получаете результат, что A переместился в B.

Полное использование библиотеки:

`/transferobject lowerall part1 part2 classpro 10 20 30 cframeangles true`. Как мы видим, мы уже указываем класс PRO, который дает возможность выбирать, на сколько стадов отклонится парт от первоначальной траектории. Базовый математический график присутсвтует в библиотеке, а именно: x,y,z. X - Прямо, Y - Вверх, Z - Вперед, назад. `cframeangles` Мы видим, что мы выбрали график: Angles. Это значит, что мы вращаем объект относительно его позиции по заданным кординатам. Но по мимо графика Angles, есть также `cframebasic` - С помщью этого графика, мы можем двигать наш обхект в 3х направлениях, как я уже говорил: x,y,z. Также в конце мы видим bool значение, которое говорит нам о том, что будет ли объект закреплен или нет. Если нет, то: False, если да, то: True

**Bind любимой команды-кода**
Использование команды `bind` сэкономит вам время, по скольку вы задаете имя команды и ее начальный код в 3ем аргументе. Навзание команды может быть любым. Пример: `/bind mycommandname print lol` >> `/mycommandname` >> `print lol`. Не забывайте соблюдать синтаксис движка, пишите все строчными буквами.

:warning:  - Бинд команда только 1 к сожалению, это будет постпенно меняться с наличием обновлений. Также когда срабатывает бинд вашей команды вы должны убрать 1 лишний пробел в самом начали кода. Простите за такие неудобства :frowning:


**createprogress**
Данная функция создает процесс. Всего есть несколько аттрибутов-циклов, с помощью которых вы оборачиваете свой процесс в изолируемый цикл. `While`  `for`. Подробнее о цикле `for` [здесь](https://create.roblox.com/docs/tutorials/fundamentals/coding-4/intro-to-for-loops). О While [тут](https://create.roblox.com/docs/tutorials/fundamentals/coding-4/repeating-code-with-while-loops). Но я думаю, это вам не понадобиться. Вкратце: если `for` то вы задаете повторения. Если `while`, то процесс бесконечный. Есть также метод `run`, это в скоращении `RunService`. Он бесконечен, его нельзя остановить. Будьте осторожны при множекственном вызове данного метода.

**Примеры с циклом while**
`/createprogress While true` - Здесь вы задаете бесконечный цикл, и включаете его с помощью аргумента `true`.

**Примеры с циклом for**
`/createprogress for 10 0.1 @printablemethod hello_World!` - Аргмент 3 это повторения кода, аргумент 4 это время ожидания между кодом, аргумент 5 это метод, 6 - сообщение.

`/createprogress for 10 0.1 @getpart attachme Part` - Аргумент 6 - метод вызова метода `@getpart`, аргумент 7 - имя целевого объкта. (Только парт!)

**Примеры использования run**
* `/createprogress run @editattribute mehandler` - Аргумент 3 - метод изминения, аргумент 4 - Путь до вашего `Humanoid` в вашем персонаже.
* `/createprogress run @editattribute memodelhandler` - Аргумент 4 - ваша модель игрока, немного разное.
* `/createprogress run @colission true` - Аргумент 3 - метод изменения колизии игрока, аргумент 4  - запуск. (Кстати, это ноуклип на cheatLang!)

Вот список методов для цикла `for`:
* `@printablemethod` - Имеет свойство отправки сообщения;
* `@getpart` - Получает имя объекта из аргумента 7 и притягивает деталь до игрока.

© CHEAT LANG™ - Все права при себе.
