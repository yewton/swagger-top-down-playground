module ApiSpec
  class Paths
    include Swagger::Blocks
    using Swagger::BlocksExt::NodeExt

    swagger_path '/pets' do
      operation :get do
        key :description, md('get_pets')
        key :operationId, 'findPets'
        key :produces, [
              'application/json',
              'application/xml',
              'text/xml',
              'text/html',
            ]
        parameter do
          key :name, :tags
          key :in, :query
          key :description, 'tags to filter by'
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
          key :description, 'maximum number of results to return'
          key :required, false
          key :type, :integer
          key :format, :int32
        end
        response 200 do
          key :description, 'pet response'
          schema do
            key :type, :array
            items do
              key :'$ref', :Pet
            end
          end
        end
        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
      operation :post do
        key :description, 'Creates a new pet in the store.  Duplicates are allowed'
        key :operationId, 'addPet'
        key :produces, [
              'application/json'
            ]
        parameter do
          key :name, :pet
          key :in, :body
          key :description, 'Pet to add to the store'
          key :required, true
          schema do
            key :'$ref', :NewPet
          end
        end
        response 200 do
          key :description, 'pet response'
          schema do
            key :'$ref', :Pet
          end
        end
        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
    end

    swagger_path '/pets/{id}' do
      operation :get do
        key :description, 'Returns a user based on a single ID, if the user does not have access to the pet'
        key :operationId, 'findPetById'
        key :produces, [
              'application/json',
              'application/xml',
              'text/xml',
              'text/html',
            ]
        parameter do
          key :name, :id
          key :in, :path
          key :description, 'ID of pet to fetch'
          key :required, true
          key :type, :integer
          key :format, :int64
        end
        response 200 do
          key :description, 'pet response'
          schema do
            key :'$ref', :Pet
          end
        end
        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
        security do
          key :api_key, []
        end
        security do
          key :petstore_auth, ['write:pets', 'read:pets']
        end
      end
      operation :delete do
        key :description, 'deletes a single pet based on the ID supplied'
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
        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
    end
  end
end
