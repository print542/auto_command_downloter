# auto_command_downloader

Скрипт для Bash, который перехватывает ненайденные команды и предлагает установить нужный пакет через pacman.

## Что это даёт

Раньше, если вы вводили команду, которой нет в системе, терминал просто отвечал `command not found`. Теперь он подскажет, в каком пакете лежит эта команда, и предложит её установить.
## Установка
 ### Ручная
1. Скопируйте файл в домашнюю папку:

  ``` cp .bash_command_not_found ~/```

2. Установите pkgfile и обновите базу:

    sudo pacman -S pkgfile
    sudo pkgfile --update

3. Добавьте строку в ~/.bashrc:

    source ~/.bash_command_not_found

4. Перезапустите терминал или выполните:

    source ~/.bashrc
## Автоматический (рекомендуемый)

Склонируйте репозиторий и запустите установочный скрипт:

git clone https://github.com/print542/auto_command_downloader
cd auto_command_downloader
chmod +x install.sh
./install.sh
## Использование

Введите несуществующую команду, например:
bash

$ firefox

Скрипт ответит:

Команда 'firefox' не найдена. Она есть в пакете: firefox
Установить? [y/N]

## Удаление

Чтобы отключить скрипт:

Удалите файл:
rm ~/.bash_command_not_found
