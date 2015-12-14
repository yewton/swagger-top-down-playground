# coding: utf-8
module ApiSpec
  module Paths
    class User
      include Swagger::Blocks
      using Swagger::BlocksExt::NodeExt

      swagger_path '/users' do
        operation :post do
          key :tags, ['user']
          key :summary, 'ユーザの作成'
          key :description, '新規ユーザを作成します。'
          key :operationId, 'createUser'
          parameter do
            key :name, :body
            key :in, :body
            key :description, '作成するユーザ'
            key :required, true
            schema do
              key :'$ref', :User
            end
          end
          response :default do
            key :description, '成功'
          end
        end
      end
      swagger_path '/user/login' do
        operation :get do
          key :tags, ['user']
          key :summary, 'ログイン'
          key :description, 'ユーザをシステムにログインさせます。'
          key :operationId, 'loginUser'
          parameter do
            key :name, :username
            key :in, :query
            key :description, 'ログインユーザ名'
            key :required, true
            key :type, :string
          end
          parameter do
            key :name, :password
            key :in, :query
            key :description, 'ログインパスワード'
            key :required, true
            key :type, :string
          end
          response 200 do
            key :description, '成功'
            schema do
              key :type, :string
            end
            header :'X-Rate-Limit' do
              key :type, :integer
              key :format, :int32
              key :description, 'ユーザ毎の最大呼び出し数制限(毎時)'
            end
            header :'X-Expires-After' do
              key :type, :string
              key :format, :'date-time'
              key :description, 'トークンの有効期限(UTC)'
            end
          end
          response 400 do
            key :description, '無効なユーザ名、またはパスワード'
          end
        end
      end
      swagger_path '/user/logout' do
        operation :get do
          key :tags, ['user']
          key :summary, 'ログアウト'
          key :description, '現在ログイン中のユーザセッションをログアウトします。'
          key :operationId, 'logoutUser'
          response :default do
            key :description, '成功'
          end
        end
      end
      swagger_path '/users/{name}' do
        operation :get do
          key :tags, ['user']
          key :summary, 'ユーザの取得'
          key :description, 'ユーザを取得します。'
          key :operationId, 'getUserByName'
          parameter do
            key :name, :name
            key :in, :path
            key :description, '取得するユーザ名。テストには `user1` を使ってください。'
            key :required, true
            key :type, :string
          end
          response 200 do
            key :description, '成功'
            schema do
              key :'$ref', :User
            end
          end
          response 400 do
            key :description, '無効なユーザ名'
          end
          response 404 do
            key :description, 'ユーザが見つからない'
          end
        end
      end
    end
  end
end
