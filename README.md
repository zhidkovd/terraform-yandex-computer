Перед запуском, необходимо узнать параметры аккаунта Yandex Cloud, а именно:

- token;

- cloud-id;

- folder-id;

===Install YC===
curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash - после чего reboot

===Настройка профиля YC===

Получение OAuth-токена для того, чтобы аутентифицироваться в CLI, 
нужно выбрать аккаунт Yandex и нажать Разрешить:

https://oauth.yandex.ru/authorize?response_type=token&client_id=1a6990aa636648e9b2ef855fa7bec2fb

Запуск настройки профиля:

yc init

Проверка настройки профиля CLI:

yc config list

Результат:

token: ****

cloud-id: ****

folder-id: ****

compute-default-zone: ru-central1-a

Также для подключения к VM нужен публичный ssh key, для это выполнить команду:

ssh-keygen   -   на все интерактивные предложения нажать Enter
