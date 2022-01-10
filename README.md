# 方針
Google Cloud Runにデプロイ

# セットアップ
## git clone
`# git clone git@github.com:ikmnjrd/<this-repository-name>.git`

`# rm -rf .git/`

`# npm install`

## Docker確認
`# docker build . -t <container-name>`

`# docker run -it --rm <container-name> bash`

# アプリをコンテナ化して Container Registry にアップロードする
## 現在のアクティブコンフィギュレーションのリスト
`# gcloud config configurations list`

## 使用するコンフィグレーションをアクティベート
`# gcloud config configurations activate <configuration-name>`

## プロジェクトの確認
`gcloud projects list`

## プロジェクトの新規作成
`# gcloud projects create <your-project-id> --name <your-project-name>`

## プロジェクトをセット
`# gcloud config set project <your-project-name>`

## Dockerfile を含むディレクトリから次のコマンドを実行し、Cloud Build を使用してコンテナ イメージをビルドします
`# gcloud builds submit --tag asia.gcr.io/<you-project-id>/<docker-image>`

## Cloud Run へのデプロイ
`# gcloud run deploy <service-name> --image asia.gcr.io/<your-project-id>/<docker-image> --region asia-northeast1 --platform managed --allow-unauthenticated`