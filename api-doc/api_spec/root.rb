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
        key :title, 'Swagger☆ペットショップ (' + (ENV['RAILS_ENV'] == 'production' ? '本番' : 'ステージング') + ')'
        key :description, md('description') + "\n\n" + md(ENV['RAILS_ENV'])
        key :termsOfService, 'http://swagger.io/terms/'
        contact do
          key :name, 'Swagger API Team'
          key :email, 'foo@example.com'
          key :url, 'http://madskristensen.net'
        end
        license do
          key :name, 'MIT'
          key :url, 'http://github.com/gruntjs/grunt/blob/master/LICENSE-MIT'
        end
      end
      key :host, 'petstore.swagger.io'
      key :basePath, '/api'
      key :schemes, ['http']
      key :consumes, ['application/json']
      key :produces, ['application/json']
      security_definition :api_key do
        key :type, :apiKey
        key :name, :api_key
        key :in, :header
      end
      security_definition :petstore_auth do
        key :type, :oauth2
        key :authorizationUrl, 'http://swagger.io/api/oauth/dialog'
        key :flow, :implicit
        scopes do
          key 'write:pets', 'modify pets in your account'
          key 'read:pets', 'read your pets'
        end
      end
      tag do
        key :name, 'pet'
        key :description, 'Pets operations'
        externalDocs do
          key :description, 'Find more info here'
          key :url, 'https://swagger.io'
        end
      end
    end
  end
end
