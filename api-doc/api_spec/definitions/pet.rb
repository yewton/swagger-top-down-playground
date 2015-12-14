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
              key :description, '識別子'
            end
          end
        end
      end

      swagger_schema :NewPet do
        key :required, [:name]
        key :description, '新規ペット'
        property :name do
          key :type, :string
          key :description, '名前'
        end
        property :colors do
          key :description, '色'
          key :type, :array
          items do
            key :type, :string
          end
        end
      end
    end
  end
end
