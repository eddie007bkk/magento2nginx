# Magento2nginx

This project is build docker images for Magento2 that useing nginx and php-fpm.
Not only local enviroment but also build Multi-binary for Asia charactors.

# Required

* Docker for Mac

# Environment

* Magento2.3
* PHP7.3
* MySql5.7
* phpMyAdmin4.9

# How To Run

## コンテナを実行してサンプル・プロジェクトを作成
```bash
# イメージ生成・コンテナ作成・実行
docker-compose up -d

＃実行中のコンテナ確認
docker ps

# phpコンテナへ入る
docker exec -it nginx /bin/sh


# License

MIT License.
See [LICENSE](LICENSE).

