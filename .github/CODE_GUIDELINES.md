# Правила оформления кода

Учтите, эти правила не применимы к коду оригинального разработчика, мы не можем полноценно редактировать их код, из-за конфликтов при слиянии.

## ТАБУЛЯЦИЯ

Отступы слева должны соответствовать уровню вложенности кода и должны быть единообразны во всём коде.
Рекомендуемый одинарный отступ - одна табуляция. Пробелы для отступов слева использовать нельзя.

```dm
// Неправильно

/obj/item/clothing/glasses/sunglasses
    name = "sunglasses"
  desc = "Glasses."
    icon_state = "sun"
 item_state = "sunglasses"
```

```dm
// Правильно

/obj/item/clothing/glasses/sunglasses
    name = "sunglasses"
    desc = "Glasses."
    icon_state = "sun"
    item_state = "sunglasses"
```

## ИМЕНОВАНИЕ ПЕРЕМЕННЫХ

Все переменные должны быть названы в змеином регистре без прописных букв (lower_snake_case). Исключения составляют константы и макросы которые должны именоваться прописными буквами в змеином регистре (SCREAMING_SNAKE_CASE).

Имя должно описывать что в себе хранит переменная, без сокращений.

```dm
// Неправильно

var/myvrbl = 100

var/myvariable = 100

var/myVariable = 100

var/MyVariable = 100
```

```dm
// Правильно

var/my_variable = 100
```

## ИМЕНОВАНИЕ ФУНКЦИЙ

Названия функций (проков) должны содержать глагол и четко отвечать на вопрос: “Что делает эта функция?”. Используемый регистр - змеиный (lower_snake_case).

```dm
// Неправильно

/obj/item/teleport/proc/SUPER-NAME(var/target, var/destination)

/obj/item/bomb/proc/killer_queen(var/target)
```

```dm
// Правильно

/obj/item/teleport/proc/teleport_to(var/target, var/destination)

/obj/item/bomb/proc/explode(var/target)
```

## ИМЕНОВАНИЕ КЛАССОВ

Названия классов должны быть в змеином регистре, логичны и передавать суть класса.

```dm
// Неправильно

/obj/item/weapon

/obj/item/weapon/pew

/obj/item/weapon/pew_pew_pew

/obj/item/weapon/boom_boom
```

```dm
// Правильно

/obj/item/weapon

/obj/item/weapon/pistol

/obj/item/weapon/smg

/obj/item/weapon/rocket_launcher
```

## ОБЪЯВЛЕНИЕ ФУНКЦИЙ И КЛАССОВ

Функции и классы должны объявляться и применяться через полный путь, это не распространяется на переменные.

```dm
// Неправильно

/datum
    proc/foo()
    proc
        foo2()
        foo3()
    Object/var/list
        name_pool = "Object"
        dictionary = list()
    Object3
        New()
            . = ..()
            foo()
```

```dm
// Правильно

/datum/proc/foo()

/datum/proc/foo2()

/datum/proc/foo3()

/datum/Object
    var/list/name_pool = "Object"
    var/list/dictionary = list()

/datum/Object3/New()
    . = ..()
    foo()
```

## ОФОРМЛЕНИЕ IF, ELSE, FOR

`if`, `else`, `for` не должны оформляться в строчном виде, даже если они нужны ради вызова всего одной функции.

```dm
// Неправильно

if(condition) foo()

for(var/object in objects){foo(object);if(condition2) break}
```

```dm
// Правильно

if (condition)
    foo()

for (var/object in objects)
    foo(object)
    if (condition2)
        break
```

## ЛОГИЧЕСКИЕ ПЕРЕМЕННЫЕ

Логические переменные и константы должны быть оформлены через `TRUE` и `FALSE`, не через 1 и 0.

```dm
// Неправильно

obj/item/gun
    var/broken = 0
    var/ready_to_shoot = 1
```

```dm
// Правильно

obj/item/gun
    var/broken = FALSE
    var/ready_to_shoot = TRUE
```

## ПРОБЕЛЫ

Пробелы между аргументами функций (и в объявлении и в применении), математическими операторами и оператором присвоения обязательны. Исключением являются унарные операции (`A--`, `A++`, `!A` и так далее). Пробелы не обязательны у скобок, но если это требуется для читабельности выражения, можете спокойно их ставить (никто не хочет тысячу лет разбирать выражение с более чем тремя не организованными парами скобок, например `(A || (B && C) && (B || ((A && C) || D)))`).

```dm
// Неправильно

/datum/fire(var/user,var/target)
    if (CanFire()&&target)
        fuel --
        var/corpse=target
```

```dm
// Правильно

/datum/fire(var/user, var/target)
    if(CanFire() && target)
        fuel--
        var/corpse = target
```

## ИСПОЛЬЗОВАНИЕ RETURN

Не оставляйте в конце методов бесполезные `return`, в это входят пустые `return` и значения которые не имеют смысла.

```dm
// Неправильно

/proc/do_thing()
    <do_thing>
    . = <result_of_doing_thing>
    return

/proc/do_thing()
    <do_thing>
    . = <result_of_doing_thing>
    return .

/proc/do_thing()
    <do_thing>
    <do_other_thing>
    return
```

```dm
// Правильно

/proc/do_thing()
    <do_thing>
    return <result_of_doing_thing>

/proc/do_thing()
    <do_thing>
    . = <result_of_doing_thing>

/proc/do_thing()
    <do_thing>
    <do_other_thing>
```

## ИСПОЛЬЗОВАНИЕ ДВОЕТОЧИЯ

Использование двоеточия (:) для доступа к свойствам объекта и процедурам не рекомендуется.

```dm
// Неправильно

var/obj = new obj()

if(hasvar(obj, "count"))
    var/count = obj:count
```

```dm
// Правильно

var/obj = new obj()
var/count = obj.count
```

## ИСПОЛЬЗОВАНИЕ МАКРОСОВ

"Сырое" использование `<<` и `>>` запрещено, вместо этого используйте макросы или функции на подобии `to_chat`, вместо использования `\green`, то есть встроенных текстовых макросов оформления используйте HTML, желательно макросы серии `SPAN_SOMETHING()`.

```dm
// Неправильно

player << "\blue Everything is OK."

to_chat(player, "<span class="notice">There's something wrong...</span>")

player << "\red \bold Everything is fucked up!"
```

```dm
// Правильно

to_chat(player, SPAN_NOTICE("Everything is OK."))

to_chat(player, SPAN_WARNING("There's something wrong..."))

to_chat(player, SPAN_DANGER("Everything is fucked up!"))
```

## ИСПОЛЬЗОВАНИЕ DEL()

Использовать del() не рекомендуется, вместо него используйте qdel() если требуется.

```dm
// Неправильно

del(src)
```

```dm
// Правильно

qdel(src)
```

## ПЕРЕМЕННЫЕ И АРГУМЕНТЫ ФУНКЦИИ

Не используйте `src.` и не приводите метод в состояние в котором он требует этого, то есть не называйте аргументы и переменные метода одинаковыми именами с переменными класса, для уверенности можно использовать нижнее подчёркивание в начале имени переменной.

```dm
// Правильно

/obj/SetName(var/new_name)
    name = new_name

/obj/SetName(var/_name)
    name = _name
```

```dm
// Неправильно

/obj/SetName(var/name)
    name = name

/obj/SetName(var/name)
    src.name = name
```

## РЕДАКТИРОВАНИЕ ОРИГИНАЛЬНОГО КОДА

При работе с файлами вне папки `infinity/` рекомендуется оставлять специальные комментарии.

### ДОБАВЛЕНИЕ К ОРИГИНАЛУ

```dm
// Однострочный вариант

    (наш однострочный код) //inf
```

```dm
// Многострочный вариант

//[INF]
    (наш многострочный код)
//[/INF]
```

### ЗАМЕНА ОРИГИНАЛА

```dm
// Однострочный вариант
    if(rules == 2 && !cas)  //inf, was:    if(rule == 1)
```

```dm
// Многострочный вариант

/* [ORIG]
   if(rule == 1) заменить на if(rules == 2 && !cas)
[/ORIG] */
```

### ОТКЛЮЧЕНИЕ ОРИГИНАЛЬНОГО КОДА

```dm
// Однострочный вариант

//inf.exclude    (однострочный код)
```

```dm
// Многострочный вариант

/* [inf.exclude]
    (Многострочный код Бея)
[/inf.exclude] */
```

## КОММЕНТИРОВАНИЕ

Комментирование кода служит для облегчения понимания читаемого кода, в случае если алгоритм не читается явно или требуется объяснение реализации в коде.

* Также, при помощи комментария, можно оставить долгосрочную неприоритетную задачу.
* Комментирование разрешено вести на русском или английском языке.
* Приветствуется указание автора комментария в его конце.

```dm
// Однострочный вариант

// Дискорд не допускает пустых строк в эмбеде, и удаляет его, по этому лучше уж [ДАННЫЕ УДАЛЕНЫ] ~Laxesh
if(!data["setter"])
    data["setter"] = "ДАННЫЕ УДАЛЕНЫ"
```

```dm
// Многострочный вариант

/* Weapons
 * Contains:
 *  Sword
 *  Classic Baton
 */
```

Комментарии также имеют несколько требований к оформлению.

```md
В комментариях запрещено:

* Использование юникодных хитростей, символов-обманок и стэков символов с эротическим содержанием.
* Мат в любом проявлении, слово "сука" хоть и литературное, но в коментариях расценивается как мат.
* Оскорбление игроков и коллег.
* Оставлять бессмысленные, не читабельные коментарии.
* Перенос стро
    ки в середине слов.

(с) Искусство комментирования (Автор: Элар-чан)
```
