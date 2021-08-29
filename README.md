
<h1 align="center">
  <br>
  <a href="https://wiki.infinity-ss13.info"><img src="https://user-images.githubusercontent.com/46600554/106483353-03da7600-64e1-11eb-9723-7a1765815a7d.png" width="200"></a>



  <br>
  Infinity Station
  <br>
</h1>

<h4 align="center">Сборка игры Space Station 13 на основе сборки <a href="https://github.com/Baystation12/Baystation12">Baystation12</a>.</h4>

<p align="center">
  <a href="https://github.com/infinitystation/Baystation12/actions">
    <img src="https://github.com/infinitystation/Baystation12/actions/workflows/test.yml/badge.svg"
         alt="Build Status">
  </a>
  <a href="https://www.codefactor.io/repository/github/infinitystation/baystation12">
    <img src="https://www.codefactor.io/repository/github/infinitystation/baystation12/badge"
         alt="CodeFactor">
  </a>
  <a href="https://github.com/infinitystation/Baystation12/commits/master">
    <img src="https://img.shields.io/github/last-commit/infinitystation/Baystation12"
         alt="Last Commit">
  </a>
  <a href="https://github.com/infinitystation/Baystation12/issues">
    <img src="https://img.shields.io/github/issues/infinitystation/Baystation12"
         alt="Issues">
  </a>
  <a href="https://discord.com/channels/194724102496321537/428189836717850624/602476813788381215">
    <img src="https://img.shields.io/badge/₽-донат-ff69b4.svg?maxAge=2592000&amp;style=flat"
         alt="Donate">
  </a>
  <a href="https://github.com/infinitystation/Baystation12/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/infinitystation/Baystation12"
         alt="License">
  </a>
</p>

<p align="center">
  <a href="#ссылки">Ссылки</a> •
  <a href="#загрузка">Загрузка</a> •
  <a href="#установка">Установка</a> •
  <a href="#запуск-локального-сервера">Запуск локального сервера</a> •
  <a href="#лицензия">Лицензия</a>
</p>


---


## ССЫЛКИ

* [Веб-сайт](https://infinity-ss13.info/);
* [Wiki-энциклопедия](https://wiki.infinity-ss13.info/) — это база знаний проекта и внутриигровой вселенной;
* [Репозиторий (GitHub)](https://github.com/infinity/Baystation12/) — здесь можно получить копию сборки или помочь в разработке;
* [Discord-сервер](https://discord.gg/N4atUkH/) — для обращения к разработчикам сборки по любым вопросам и общения заинтересованных.


## ЗАГРУЗКА

Эта инструкция написана для применения в ОС Windows.  
Для загрузки копии сборки нашего проекта, пожалуйста, выберите один из перечисленных ниже вариантов.

<li> <b>Вариант №1</b>
<ul>
1. Клонируйте git-репозиторий сборки нашего проекта на локальное устройство напрямую с сайта: <br>
  <ul>
<li> Перейдите на <a href="https://github.com/infinitystation/Baystation12/">сайт репозитория</a>, нажмите по зелёной кнопке «Code» в правом верхнем углу, и затем нажмите по кнопке «Download ZIP» чуть ниже. Должна начаться загрузка репозиторя, упакованной в формате zip-архива.
  </ul>
</ul>

<li> <b>Вариант №2</b>
<ul>
1. Проверьте наличие, и установите в случае отсутствия, приложение git-клиента для ПК: <br>
  <ul>
<a href="https://gitforwindows.org/">Git Bash</a>, 
<a href="https://www.syntevo.com/smartgit/">SmartGit</a>, 
<a href="https://www.sourcetreeapp.com/">Sourcetree</a>, 
<a href="https://git-scm.com/">git-scm</a>, 
<a href="https://tortoisegit.org/">TortoiseGit</a>, 
или аналогичный на ваш выбор.
  </ul> 
2. Откройте приложение выбранного и установленного вами git-клиента. <br>
3. Клонируйте git-репозиторий сборки нашего проекта на локальное устройство с помощью git-клиента: <br>
  <ul>
<li> Перейдите на <a href="https://github.com/infinitystation/Baystation12/">сайт репозитория</a>, нажмите по зелёной кнопке «Code» в правом верхнем углу, и затем нажмите по маленькой иконке доски с зажимом справа.
  </ul>
  <ul>
<li> Или скопируйте эту ссылку: <a href="https://github.com/infinitystation/Baystation12.git">https://github.com/infinitystation/Baystation12.git</a>.
  </ul>
3.1. Если вы используйте Git Bash:
  <ul>
3.1.1. Нажмите ПКМ по папке, в которой хотите создать папку с репозиторием и выберите опцию "Git Bash Here" <br>
3.1.2. Введите в консоль команду `git clone https://github.com/infinitystation/Baystation12.git`
  </ul>
</ul>


## УСТАНОВКА

Эта инструкция написана для применения в ОС Windows.  

1. Проверьте наличие, и установите в случае отсутствия, **приложение <a href="http://www.byond.com/">BYOND</a>**.
2. С помощью приложения **Dream Maker**, идущего в комплекте с <a href="http://www.byond.com/">BYOND</a>, откройте файл <a href="https://github.com/infinitystation/Baystation12/blob/master/baystation12.dme">baystation12.dme</a>.
3. Нажмите **Build** («Собрать»), затем на **Compile** («Скомпилировать»), или используйте комбинацию горячих клавиш _Ctrl + K_.
4. После того, как Dream Maker скомпилирует сборку, в консольном окне в нижней части, должно появится **сообщение**:  
```
...
saving baystation12.dmb (DEBUG mode)
baystation12.dmb - 0 errors, 0 warnings
```  
Где errors — ошибки, warnings — предупреждения. При наличии ошибок, пожалуйста, обратитесь <a href="#ссылки">к разработчикам</a>.


## ЗАПУСК ЛОКАЛЬНОГО СЕРВЕРА

1. Проверьте наличие, и установите в случае отсутствия, **приложение <a href="http://www.byond.com/">BYOND</a>**.
2. Запустите **BYOND (Hub)**. Нажмите на кнопку Menu (иконка в виде шестерёнки) в правом верхнем углу, затем выберите «**Start Dream Daemon...**», или используйте комбинацию горячих клавиш _Ctrl + D_.
3. В Dream Daemon нажмите на кнопку «**...**» в правой нижней части окна, и выберите скомпилированный ранее файл мира игры в формате «**.dmb**».
4. Выберите порт, уровень безопастности и видимость, после чего нажмите кнопку «**GO**». Начнётся запуск локального сервера.
5. Dream Daemon оповестит вас о завершении загрузки сервера путём появления в консольном окне строки «**Initializations Complete**». С этого момента вы можете войти на сервер и играть. Для быстрого захода на локальный сервер, вы можете нажать кнопку входа, обозначенной стрелкой в окне самого Dream Daemon.


### ЗАПУСК БЕЗ БАЗЫ ДАННЫХ

На случай, если вы не имеете базу данных под управление **СУБД MySQL** или **MariaDB**, вам нужно будет изменить конфигурацию сборки для запуска.
1. Закомментируйте **ENABLE_STAT_TRACKING** в файле <a href="https://github.com/infinitystation/Baystation12/blob/master/config/dbconfig.txt">**config/dbconfig.txt**</a> при помощи добавления символа «#» в начало строки. Должно получится так: `#ENABLE_STAT_TRACKING`.
2. Закомментируйте **SQL_ENABLED** в файле <a href="https://github.com/infinitystation/Baystation12/blob/master/config/config.txt">**config/config.txt**</a> при помощи добавления символа «#» в начало строки. Должно получится так: `#SQL_ENABLED`.  


### ПОЛНОМОЧИЯ АДМИНИСТРАТОРА
Для получения полномочий администратора на вашем локальном сервере, необходимо добавить в файл <a href="https://github.com/infinitystation/Baystation12/blob/master/config/admins.txt">**config/admins.txt**</a> новую запись, где нужно указать целевой никнейм, зарегистрированный в системе BYOND, и через символ «-» добавить любое из возможных званий из файла <a href="https://github.com/infinitystation/Baystation12/blob/master/config/example/admin_ranks.txt">**config/example/admin_ranks.txt**</a>, например:  
`BYONDnickname - GameMaster`  
**Обратите внимание!** Каждый целевой никнейм BYOND, указанный здесь, должен быть в **нижнем регистре**, содержать только **буквы** и **цифры**.


## ОБНОВЛЕНИЕ СБОРКИ
### ОБНОВЛЕНИЕ С ИСПОЛЬЗОВАНИЕМ BATCH

1. Для обновления форка, найдите в папке <a href="https://github.com/infinitystation/Baystation12/tree/master/tools">tools/</a> утилиту <a href="https://github.com/infinitystation/Baystation12/blob/master/tools/fork-update.bat">**fork-update.bat**</a> и запустите её.
2. Введите ветвь сборки, с которой желаете синхронизироваться.
3. Введите название, по которому будет идентифицироваться удалённый репозиторий.
4. Введите ветвь локального репозитория, которую желаете обновить.
5. Введите 1, для обновления ветви в удалённом репозитории форка.


### ОБНОВЛЕНИЕ С ИСПОЛЬЗОВАНИЕМ GUI И PYTHON

![screenshot](https://pp.userapi.com/c857436/v857436830/1499d/TR6XdraONeA.jpg)

1. В корневой директории репозитория найдите и запустите программу <a href="https://github.com/infinitystation/Baystation12/blob/master/mergetool.py">**mergetool.py**</a>.
2. После запуска вы увидите окно, в котором вы должны ввести **4 параметра**.  
2.1. В поле «**Remote Repo name**» введите любое значение, необязательно осмысленное.  
2.2. В поле «**Remote Repo Link**» введите "<a href="https://www.codefactor.io/repository/github/infinitystation/baystation12">**https://github.com/infinitystation/Baystation12**</a>"  
2.3. В поле «**Remote Repo Branch**» введите **master** или другую ветку изменения, которой вы хотите перенести на свою ветвь.  
2.4. В поле «**Local Repo Branch**» введите **master** или другую ветку, которую вы хотите обновить.
3. Нажмите кнопку **"TOGGLE UPDATE MODE"** для коректного обновления.
4. Нажмите кнопку <font color='#00ff00'>**GO!**</font> и ожидайте завершения.
5. Дождавшись окончания, нажмите кнопку <font color='#ff0000'>**End**</font>.

## ЛИЦЕНЗИЯ
Весь исходный код после 8-го Января 2015-го года в 03:00 по Московскому времени лицензируется на условиях лицензионного соглашения [GNU Affero General Public License v3](http://www.gnu.org/licenses/agpl.html).  
В том числе и инструменты, если в их файле readme не указано другое. Подробнее в файлах LICENSE или GPLv3.txt.  

Исходный код клиентской стороны tgui лицензируется как подпроект на условиях лицензионного соглашения MIT.  
Файлы шрифтов Font Awesome, исползуемые tgui, лицензируется на условиях лицензионного соглашения SIL Open Font License v1.1  
Ресурсы tgui лицензируется на условиях лицензионного соглашения Creative Commons BY-SA 4.0 [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).  
Подробнее в файлах tgui/LICENSE.md и tgui/assets/fonts/SIL-OFL-1.1-LICENSE.md.  

Все содержимое, включая иконки и звуки, лицензируется на условиях лицензионного соглашения [Creative Commons 3.0 BY-SA license](http://creativecommons.org/licenses/by-sa/3.0/).

[![CC0](https://licensebuttons.net/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/)
