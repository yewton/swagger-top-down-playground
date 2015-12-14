# coding: utf-8
module ApiSpec
  module Paths
    class Pet
      include Swagger::Blocks
      using Swagger::BlocksExt::NodeExt

      default_response = %Q{
        response :default do
          key :description, '想定外のエラー'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      }

      swagger_path '/pets' do
        operation :post do
          key :tags, ['pet']
          key :summary, 'ペットの追加'
          key :description, '店舗にペットを追加します。重複可。'
          key :operationId, 'addPet'
          key :produces, [
                'application/json'
              ]
          parameter do
            key :name, :body
            key :in, :body
            key :description, '追加するペットオブジェクト'
            key :required, true
            schema do
              key :'$ref', :NewPet
            end
          end
          response 200 do
            key :description, '追加されたペットエンティティ'
            schema do
              key :'$ref', :Pet
            end
          end
          response 405 do
            key :description, '無効な入力'
          end
          eval(default_response)
          security do
            key :api_key, []
          end
          security do
            key :petstore_auth, ['read:pets', 'write:pets']
          end
        end
        operation :put do
          key :tags, ['pet']
          key :summary, 'ペットの更新'
          key :description, '既存のペット情報を更新します。'
          key :operationId, 'updatePet'
          parameter do
            key :name, :body
            key :in, :body
            key :description, '更新するペットオブジェクト'
            key :required, true
            schema do
              key :'$ref', :Pet
            end
          end
          response 400 do
            key :description, '無効なIDが与えられた'
          end
          response 404 do
            key :description, 'ペットが見つからない'
          end
          response 405 do
            key :description, 'バリデーション例外'
          end
          eval(default_response)
          security do
            key :api_key, []
          end
          security do
            key :petstore_auth, ['read:pets', 'write:pets']
          end
        end
        operation :get do
          key :tags, ['pet']
          key :description, md('get_pets')
          key :operationId, 'findPets'
          key :summary, 'ペットの検索'
          parameter do
            key :name, :tags
            key :in, :query
            key :description, '絞り込むタグ'
            key :required, false
            key :type, :array
            items do
              key :type, :string
            end
            key :collectionFormat, :csv
          end
          parameter do
            key :name, :limit
            key :in, :query
            key :description, '結果の上限'
            key :required, false
            key :type, :integer
            key :format, :int32
          end
          response 200 do
            key :description, 'ペットエンティティの配列'
            schema do
              key :type, :array
              items do
                key :'$ref', :Pet
              end
            end
          end
          eval(default_response)
        end
      end
      swagger_path '/pets/{id}' do
        operation :get do
          key :tags, ['pet']
          key :summary, 'ペットの取得'
          key :description, '指定されたIDを持つペットエンティティを返します。'
          key :operationId, 'findPetById'
          parameter do
            key :name, :id
            key :in, :path
            key :description, '取得するペットのID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response 200 do
            key :description, 'ペットエンティティ'
            schema do
              key :'$ref', :Pet
            end
          end
          eval(default_response)
          security do
            key :api_key, []
          end
          security do
            key :petstore_auth, ['read:pets']
          end
        end
        operation :post do
          key :tags, ['pet']
          key :summary, 'ペットの更新'
          key :description, 'フォームからペット情報を更新します。'
          key :operationId, 'updatePetWithFoorm'
          key :consumes, ['application/x-www-form-urlencoded']
          parameter do
            key :name, :id
            key :in, :path
            key :description, '更新するペットのID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, :name
            key :in, :formData
            key :description, '更新後のペットの名前'
            key :required, false
            key :type, :string
          end
          parameter do
            key :name, :status
            key :in, :formData
            key :description, '更新後のペットの状態'
            key :required, false
            key :type, :string
          end
          response 200 do
            key :description, 'ペットエンティティ'
            schema do
              key :'$ref', :Pet
            end
          end
          eval(default_response)
          security do
            key :api_key, []
          end
          security do
            key :petstore_auth, ['write:pets', 'read:pets']
          end
        end
        operation :delete do
          key :tags, ['pet']
          key :summary, 'ペットの削除'
          key :description, '指定されたIDを持つペットエンティティを削除します。'
          key :operationId, 'deletePet'
          parameter do
            key :name, :id
            key :in, :path
            key :description, 'ID of pet to delete'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response 204 do
            key :description, 'pet deleted'
          end
          eval(default_response)
        end
      end

      swagger_path '/pets/{id}/photos' do
        operation :post do
          key :tags, ['pet']
          key :summary, 'ペット写真の追加'
          key :description, 'ペットの写真を追加します。'
          key :operationId, 'uploadFile'
          key :consumes, ['multipart/form-data']
          parameter do
            key :name, :id
            key :in, :path
            key :description, '写真を追加するペットのID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          parameter do
            key :name, :additionalMetadata
            key :in, :formData
            key :description, '写真の付加情報'
            key :required, false
            key :type, :string
          end
          parameter do
            key :name, :file
            key :in, :formData
            key :description, 'アップロードするファイル'
            key :required, true
            key :type, :file
          end
          response 200 do
            key :description, 'アップロード成功'
            schema do
              key :'$ref', :ApiResponse
            end
          end
          eval(default_response)
          security do
            key :api_key, []
          end
          security do
            key :petstore_auth, ['write:pets', 'read:pets']
          end
        end
      end
    end
  end
end
