# Модифицированный baystation12
[![Build Status](https://travis-ci.org/infinitystation/Baystation12.svg?branch=master)](https://travis-ci.org/infinitystation/Baystation12)
[![CodeFactor](https://www.codefactor.io/repository/github/infinitystation/baystation12/badge)](https://www.codefactor.io/repository/github/infinitystation/baystation12)

[**Код:**](https://github.com/infinitystation/Baystation12/) https://github.com/infinitystation/Baystation12
[**Сайт разработчика:**](https://infinity-ss13.info/) https://infinity-ss13.info/
[**Discord:**](https://discord.gg/N4atUkH/) https://discord.gg/N4atUkH
**Используемые карты:** Sierra, Модифицированный Bearcat

**Сайт оригинального разработчика:** https://baystation12.net  
**Оригинальный код:** https://github.com/Baystation12/Baystation12  

---

## ЗАГРУЗКА

Есть несколько способов скачать билд проекта.
<ul>
<li>Вариант 1:
<ul>
<li>1. Скачать здесь в *.zip файле.  
<li>2. Кнопка в правой части экрана.
</ul>
<li>Вариант 2:  
<ul>
<li>1. Установить любой другой git-клиент.  
<a href="https://gitforwindows.org/">Git Bash</a>, SmartGit, Sourse Tree, git-scm, TortoiseGit или любой другой.
<li>2<ul> 
  <li>2.1. Зайти в клиент и клонировать репозиторий по ссылке: https://github.com/infinitystation/Baystation12.git. Обычно кнопка клонирования находится в левом-верхнем углу.
  <li>2.2. (Для Git Bash)<ul>
   <li>1. Нажмите ПКМ по папке в которой хотите создать папку с репозиторием и нажмите опцию "Git Bash Here"
   <li>2. Введите в консоль команду `git clone https://github.com/infinitystation/Baystation12.git`
  </ul>
  </ul>
</ul>
</ul>

## УСТАНОВКА
0. Убедитесь, что у вас есть BYOND. Скачать можно здесь: http://www.byond.com/.  
1. Откройте файл baystation12.dme с помощью Dream Maker.
2. Нажмите Build, затем на Compile или нажмите Ctrl + K.
3. Дождитесь сообщения:  
```
...
saving baystation12.dmb (DEBUG mode)
baystation12.dmb - 0 errors, 0 warnings
```  
Если будут проблемы, пишите в дискорд.

## СОДЕЙСТВИЕ РАЗРАБОТКЕ БИЛДА
Обратиться разработчикам здесь:  
https://discord.gg/N4atUkH  

## ЗАПУСК
0. Убедитесь, что у вас есть BYOND. Скачать можно здесь: http://www.byond.com/.  
1. Откройте BYOND и нажмите на Menu (Шестеренка), затем на Start Dream Daemon. Или нажмите Ctrl + D.
2. Выберите с файл с помощью кнопки [...].
3. Напишите порт и нажмите кнопку [GO].
4. Как только появится строка "Initializations Complete" нажмите кнопку входа, которая обозначена стрелкой.

## ЗАПУСК БЕЗ БАЗЫ ДАННЫХ
На случай если вы не имеете базу данных на СУБД MySQL или MariaDB, вам нужно будет изменить конфигурацию билда для запуска.  
1. Закомментируйте ENABLE_STAT_TRACKING в файле config/dbconfig.txt при помощи #. Должно получится вот так `#ENABLE_STAT_TRACKING`.
2. Закомментируйте SQL_ENABLED в файле config/config.txt при помощи #. Должно получится вот так `#SQL_ENABLED`.  

## ПОЛНОМОЧИЯ АДМИНИСТРАТОРА
Для получения полномочий администратора на вашем сервере, необходимо дописать файл config/admins.txt таким образом:  
`byond-логин - GameMaster`  
При этом, byond-логин должен быть в нижнем регистре и содержать только буквы и цифры.

## ОБНОВЛЕНИЕ ОТВЕТВЛЕНИЯ БИЛДА ИСПОЛЬЗУЯ BATCH (Fork)
1. Для обновления форка, найдите в папке tools/ утилиту fork-update.bat и запустите её.
2. Введите ветвь билда с которой желаете синхронизироваться.
3. Введите название по которому будет идентифицироваться удалённый репозиторий.
4. Введите ветвь локального репозитория которую желаете обновить.
5. Введите 1 для обновления ветви в удалённом репозитории форка.

## ОБНОВЛЕНИЕ ОТВЕТВЛЕНИЯ БИЛДА ИСПОЛЬЗУЯ GUI И PYTHON (Fork)
1. В корневой директории репозитория найдите и запустите программу mergetool.py
2. После запуска вы увидите окно в котором вы должны ввести 4 параметра. <img src="https://pp.userapi.com/c857436/v857436830/1499d/TR6XdraONeA.jpg" alt="Mergetool GUI" style="float: right; margin-right: 10px;">
3. В поле Remote Repo name введите любое значение, необязательно осмысленное.
4. В поле Remote Repo Link введите <i>"https://github.com/infinitystation/Baystation12"</i>
5. В поле Remote Repo Branch введите master.<details>или другую ветку изменения которой вы хотите перенести на свою ветвь.</details>
6. В поле Local Repo Branch введите master.<details>или другую ветку которую вы хотите обновить.</details>
7. Нажмите кнопку <u>"TOGGLE UPDATE MODE"</u> для коректного обновления.
8. Нажмите кнопку <font color='#00ff00'>GO!</font> и ожидайте завершения.
9. Дождавшись окончания, нажмите кнопку <font color='#ff0000'>End</font>.

## ЛИЦЕНЗИЯ
Весь исходный код после 8-го Января 2015-го года в 03:00 по Московскому времени лицензируется на условиях лицензионного соглашения [GNU Affero General Public License v3](http://www.gnu.org/licenses/agpl.html).  
в том числе и инструменты, если в их файле readme не указано другое. Подробнее в файлах LICENSE или GPLv3.txt.  

Исходный код клиентской стороны tgui лицензируется как подпроект на условиях лицензионного соглашения MIT.  
Файлы шрифтов Font Awesome, исползуемые tgui, лицензируется на условиях лицензионного соглашения SIL Open Font License v1.1  
Ресурсы tgui лицензируется на условиях лицензионного соглашения Creative Commons BY-SA 4.0 [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).  
Подробнее в файлах tgui/LICENSE.md и tgui/assets/fonts/SIL-OFL-1.1-LICENSE.md.  

Все содержимое, включая иконки и звуки, лицензируется на условиях лицензионного соглашения [Creative Commons 3.0 BY-SA license](http://creativecommons.org/licenses/by-sa/3.0/).
