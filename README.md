# Модифицированный baystation12
[![Build Status](https://travis-ci.org/infinitystation/Baystation12.svg?branch=master)](https://travis-ci.org/infinitystation/Baystation12)  

**Код**: https://github.com/infinitystation/Baystation12  
**Сайт разработчика:** https://infinity-ss13.ru/  
**Discord**: https://discord.gg/N4atUkH  
**Используемые карты:** Модифицированный Torch  

**Сайт оригинального разработчика:** https://baystation12.net  
**Оригинальный код:** https://github.com/Baystation12/Baystation12  

---

## ЗАГРУЗКА

Есть несколько способов скачать билд проекта.

Вариант 1:  
Скачать здесь в *.zip файле.  
Кнопка в правой части экрана.

Вариант 2:  
1. Установить любой другой GIT-клиент.  
Github for Windows, TortoiseGit, git-scm, SourceTree, или любой другой.  
2. Зайти в клиент и клонировать репозиторий по ссылке:  
https://github.com/infinitystation/-tg-station.git

## УСТАНОВКА
0. Убедитесь, что у вас есть BYOND. Скачать можно здесь: http://www.byond.com/.  
1. Откройте файл tgstation.dme с помощью Dream Maker.
2. Нажмите Build -> Compile или нажмите Ctrl + K.
3. Дождитесь сообщения:  
...  
saving tgstation.dmb (DEBUG mode)  
tgstation.dmb - 0 errors, 0 warnings  
Если будут проблемы, пишите в дискорд.

## СОДЕЙСТВИЕ РАЗРАБОТКЕ БИЛДА.
Обратиться разработчикам здесь:  
https://discord.gg/N4atUkH  

## ЗАПУСК
0. Убедитесь, что у вас есть BYOND. Скачать можно здесь: http://www.byond.com/.  
1. Нажмите на Menu (Шестеренка) -> Start Dream Daemon. Или нажмите Ctrl + D.
2. Выберите с файл с помощью кнопки [...].
3. Напишите порт и нажмите кнопку [GO].
4. Как только появится строка "Initializations Complete" нажмите кнопку входа, которая обозначена стрелкой.

## ЗАПУСК БЕЗ БАЗЫ ДАННЫХ
На случай если вы не имеете базу данных на СУБД MySQL или MariaDB, вам нужно будет изменить конфигурацию билда для запуска.  
1. Закомментируйте ENABLE_STAT_TRACKING в файле config/dbconfig.txt при помощи #. Должно получится вот так `#ENABLE_STAT_TRACKING`.
2. Закомментируйте SQL_ENABLED в файле config/config.txt при помощи #. Должно получится вот так `#SQL_ENABLED`.  

## ЛИЦЕНЗИЯ
Весь исходный код после 8-го Января 2015-го года в 03:00 по Московскому времени лицензируется на условиях лицензионного соглашения [GNU Affero General Public License v3](http://www.gnu.org/licenses/agpl.html).  
в том числе и инструменты, если в их файле readme не указано другое. Подробнее в файлах LICENSE-AGPLv3.txt или LICENSE-GPLv3.txt.  

Исходный код клиентской стороны tgui лицензируется как подпроект на условиях лицензионного соглашения MIT.  
Файлы шрифтов Font Awesome, исползуемые tgui, лицензируется на условиях лицензионного соглашения SIL Open Font License v1.1  
Ресурсы tgui лицензируется на условиях лицензионного соглашения Creative Commons BY-SA 4.0 [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).  
Подробнее в файлах tgui/LICENSE.md и tgui/assets/fonts/SIL-OFL-1.1-LICENSE.md.  

Все содержимое, включая иконки и звуки, лицензируется на условиях лицензионного соглашения [Creative Commons 3.0 BY-SA license](http://creativecommons.org/licenses/by-sa/3.0/).