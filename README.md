## 方針
Google Cloud Runにデプロイ

## セットアップ
### git clone
`# git clone git@github.com:ikmnjrd/<this-repository-name>.git`

`# rm -rf .git/`

`# npm install`

`# npm run build`

### Docker確認
`# docker build . -t <container-name>`

`# docker run -it --rm <container-name> bash`

## アプリをコンテナ化して Container Registry にアップロードする
### 現在のアクティブコンフィギュレーションのリスト
`# gcloud config configurations list`

### 使用するコンフィグレーションをアクティベート
`# gcloud config configurations activate <configuration-name>`

### プロジェクトの確認
`# gcloud projects list`

### プロジェクトの新規作成
`# gcloud projects create <your-project-id> --name <your-project-name>`

### プロジェクトをセット
`# gcloud config set project <your-project-id>`

### [請求先をプロジェクトに設定](https://console.cloud.google.com/billing?hl=JA&_ga=2.176095202.1572758307.1641690169-660800505.1641690169&_gac=1.221938410.1641787854.CjwKCAiArOqOBhBmEiwAsgeLmUKyxFVA2G-PbQiGDcDshQWOkuOjierEGVir-P0Usxx6Q719ysIrXhoCfvkQAvD_BwE)

### Artifact Registryを有効化
`# gcloud services enable  artifactregistry.googleapis.com cloudbuild.googleapis.com`

### Artifact RegistryでDockerリポジトリを作成する
`# gcloud artifacts repositories create <repository-name> --repository-format=docker --location=asia-northeast1 --description="Docker repository hoge"`

### 作成したリポジトリを確認
`# gcloud artifacts repositories list`

### Cloud Buildを使用してコンテナイメージをビルド
`# gcloud builds submit --tag asia-northeast1-docker.pkg.dev/<you-project-id>/<repository-name>/<image-name>:tag1`

### Cloud Run へのデプロイ
`# gcloud run deploy <service-name> --image asia-northeast1-docker.pkg.dev/<you-project-id>/<repository-name>/<image-name>:tag1 --region asia-northeast1 --platform managed --allow-unauthenticated`

APIサーバとして運用するなら未認証での接続許可は不都合かと思うので、適宜変えてください。