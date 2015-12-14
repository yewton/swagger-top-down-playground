# coding: utf-8
module ApiSpec
  module Definitions
    class User
      include Swagger::Blocks

      swagger_schema :User do
        key :type, :object
        key :description, 'ユーザエンティティ'
        property :id do
          key :type, :integer
          key :format, :int64
          key :description, 'ID'
        end
        property :username do
          key :type, :string
          key :description, 'ユーザ名'
          key :example, 'user1'
        end
        property :firstName do
          key :type, :string
          key :description, '名前'
          key :example, '太郎'
        end
        property :lastName do
          key :type, :string
          key :description, '名字'
          key :example, '諏訪賀'
        end
        property :email do
          key :type, :string
          key :description, 'メールアドレス'
          key :example, 'foo@example.com'
        end
        property :password do
          key :type, :string
          key :description, 'パスワード'
          key :example, 'pa55w0rd'
        end
        property :phone do
          key :type, :string
          key :description, '電話番号'
          key :example, '+81-90-9999-9999'
        end
        property :userStatus do
          key :type, :integer
          key :format, :int32
          key :description, 'ユーザ状態'
          key :example, 1
        end
      end
    end
  end
end
