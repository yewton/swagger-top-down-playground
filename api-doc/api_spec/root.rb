# coding: utf-8
require_relative 'paths'
require_relative 'definitions'

module ApiSpec
  class Root
    include Swagger::Blocks
    using Swagger::BlocksExt::NodeExt

    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Swagger ペットショップ (' + (ENV['RAILS_ENV'] == 'production' ? '本番' : 'ステージング') + ')'
        key :description, md('description') + "\n\n" + md(ENV['RAILS_ENV'])
        key :termsOfService, 'http://swagger.io/terms/'
        contact do
          key :name, 'Swagger API チーム'
          key :email, 'foo@example.com'
          key :url, 'http://madskristensen.net'
        end
        license do
          key :name, 'Apache 2.0'
          key :url, 'http://www.apache.org/licenses/LICENSE-2.0.html'
        end
      end
      key :host, 'petstore.swagger.io'
      key :basePath, '/api'
      key :schemes, ['http']
      key :consumes, ['application/json']
      key :produces, ['application/json']
      security_definition :api_key do
        key :description, '共通鍵による認証を提供します'
        key :type, :apiKey
        key :name, :api_key
        key :in, :header
      end
      security_definition :petstore_auth do
        key :description, 'OAuth 2.0による認可を提供します'
        key :type, :oauth2
        key :authorizationUrl, 'http://swagger.io/api/oauth/dialog'
        key :flow, :implicit
        scopes do
          key 'write:pets', '自分のアカウントでペットを変更する'
          key 'read:pets', '自分のペットを参照する'
        end
      end
      tag do
        key :name, 'pet'
        key :description, 'ペット関連'
      end
      tag do
        key :name, 'store'
        key :description, '店舗関連'
      end
      tag do
        key :name, 'user'
        key :description, 'ユーザ関連'
      end

      # TODO: support int swagger-blocks
      # external_docs do
      #   key :description, 'Find out more about Swagger'
      #   key :url, 'http://swagger.io'
      # end
    end
  end
end
