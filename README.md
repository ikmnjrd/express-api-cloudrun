# 方針

# セットアップ
## git clone
`# git clone git@github.com:ikmnjrd/このリポジトリ.git`

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
`# gcloud projects create プロジェクトID --name <project-name>`

## プロジェクトをセット
`# gcloud config set project <project-name>`

## Dockerfile を含むディレクトリから次のコマンドを実行し、Cloud Build を使用してコンテナ イメージをビルドします
`# gcloud builds submit --tag asia.gcr.io/<you-project-id>/<docker-image>`

## Cloud Run へのデプロイ
`# gcloud run deploy helloworld --image asia.gcr.io/PROJECT-ID/helloworld --region asia-northeast1 --platform managed --allow-unauthenticated`
`# gcloud run deploy hello-express --image asia.gcr.io/express-test-444/hello-express --region asia-northeast1 --platform managed --allow-unauthenticated`

