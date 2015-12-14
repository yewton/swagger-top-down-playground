# coding: utf-8
module ApiSpec
  module Definitions
    class Pet
      include Swagger::Blocks

      swagger_schema :Pet do
        key :type, :object
        key :description, 'ペットエンティティ'
        allOf do
          schema do
            key :'$ref', :NewPet
          end
          schema do
            key :required, [:id]
            property :id do
              key :type, :integer
              key :format, :int64
              key :description, 'ID'
            end
          end
        end
      end

      swagger_schema :NewPet do
        key :type, :object
        key :required, [:name]
        key :description, '新規ペット'
        property :category do
          key :'$ref', :Category
        end
        property :name do
          key :type, :string
          key :description, '名前'
        end
        property :photoUrls do
          key :type, :array
          key :description, '写真URL'
          items do
            key :type, :string
          end
        end
        property :tags do
          key :type, :array
          key :description, 'タグ'
          items do
            key :'$ref', :Tag
          end
        end
        property :status do
          key :type, :string
          key :description, '店舗におけるペットの状態'
        end
      end

      swagger_schema :Tag do
        key :type, :object
        key :description, 'タグエンティティ'
        key :required, [:id]
        property :id do
          key :type, :integer
          key :format, :int64
          key :description, 'ID'
        end
        property :name do
          key :type, :string
          key :description, 'タグ名'
        end
      end

      swagger_schema :Category do
        key :type, :object
        key :description, 'カテゴリエンティティ'
        key :required, [:id]
        property :id do
          key :type, :integer
          key :format, :int64
          key :description, 'ID'
        end
        property :name do
          key :type, :string
          key :description, 'カテゴリ名'
        end
      end
    end
  end
end
