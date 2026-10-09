#!/bin/bash

# Цвета для вывода
GREEN='\e[32m'
YELLOW='\e[33m'
RED='\e[31m'
NC='\e[0m'

echo -e "${GREEN}Установка auto_command_downloader...${NC}"

# 1. Проверяем, что мы на Arch Linux
if ! command -v pacman &>/dev/null; then
    echo -e "${RED}Ошибка: этот скрипт работает только на Arch Linux.${NC}"
    exit 1
fi

# 2. Копируем сам скрипт в домашнюю папку
cp .bash_command_not_found ~/
echo -e "${GREEN}Файл .bash_command_not_found скопирован в ~/${NC}"

# 3. Устанавливаем pkgfile, если его нет
if ! command -v pkgfile &>/dev/null; then
    echo -e "${YELLOW}Устанавливаем pkgfile...${NC}"
    sudo pacman -S --needed --noconfirm pkgfile
fi

# 4. Обновляем базу pkgfile
echo -e "${YELLOW}Обновляем базу данных pkgfile...${NC}"
sudo pkgfile --update

# 5. Добавляем строку в .bashrc, если её там ещё нет
if ! grep -q "bash_command_not_found" ~/.bashrc; then
    echo 'source ~/.bash_command_not_found' >> ~/.bashrc
    echo -e "${GREEN}Строка добавлена в ~/.bashrc${NC}"
else
    echo -e "${YELLOW}Строка уже есть в ~/.bashrc, пропускаем.${NC}"
fi

echo -e "${GREEN}Готово! Перезапустите терминал или выполните: source ~/.bashrc${NC}"
