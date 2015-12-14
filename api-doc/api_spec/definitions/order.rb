# coding: utf-8
module ApiSpec
  module Definitions
    class Order
      include Swagger::Blocks

      swagger_schema :Order do
        key :type, :object
        key :description, '注文エンティティ'
        property :id do
          key :type, :integer
          key :format, :int64
          key :description, 'ID'
        end
        property :petId do
          key :type, :integer
          key :format, :int64
          key :description, 'ペットID'
        end
        property :quantity do
          key :type, :integer
          key :format, :int32
          key :description, '数量'
        end
        property :shipDate do
          key :type, :string
          key :format, :'date-time'
          key :description, '数量'
        end
        property :status do
          key :type, :string
          key :description, '注文状況'
        end
        property :complete do
          key :type, :boolean
          key :description, '完了しているか？'
        end
      end
    end
  end
end
