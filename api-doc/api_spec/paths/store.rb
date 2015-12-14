# coding: utf-8
module ApiSpec
  module Paths
    class Store
      include Swagger::Blocks
      using Swagger::BlocksExt::NodeExt

      swagger_path '/store/inventry' do
        operation :get do
          key :tags, ['store']
          key :summary, '状況毎の在庫の確認'
          key :description, '在庫状況と数量のマップを返します。'
          key :operationId, 'getInventry'
          response 200 do
            key :description, '取得成功'
            schema do
              key :type, :object
              # TODO: support in swagger-blocks
              # additionalProperties do
              #   key :type, :integer
              #   key :format, :int32
              # end
            end
          end
          response 400 do
            key :description, '無効な注文'
          end
        end
      end
      swagger_path '/store/order' do
        operation :post do
          key :tags, ['store']
          key :summary, 'ペットの発注'
          key :description, 'ペットを発注します。'
          key :operationId, 'placeOrder'
          parameter do
            key :name, :body
            key :in, :body
            key :description, 'ペット購入の注文'
            key :required, false
            schema do
              key :'$ref', :Order
            end
          end
          response 200 do
            key :description, '発注成功'
            schema do
              key :'$ref', :Order
            end
          end
          response 400 do
            key :description, '無効な注文'
          end
        end
      end
      swagger_path '/store/orders/{orderId}' do
        operation :get do
          key :tags, ['store']
          key :summary, '注文の確認'
          key :description, md('get_an_order')
          key :operationId, 'getOrderById'
          parameter do
            key :in, :path
            key :name, :orderId
            key :description, '取得する注文ID'
            key :required, true
            key :type, :integer
            key :format, :int64
          end
          response 200 do
            key :description, '発注成功'
            schema do
              key :'$ref', :Order
            end
          end
          response 400 do
            key :description, '無効な注文'
          end
        end
      end
    end
  end
end
