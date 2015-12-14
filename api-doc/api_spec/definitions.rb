# coding: utf-8
Dir.glob(File.join(__dir__, 'definitions') + '/*').each do |file|
  require_relative "definitions/#{File.basename(file, '.*')}"
end

module ApiSpec
  module Definitions
    class Other
      include Swagger::Blocks

      swagger_schema :ApiResponse do
        key :type, :object
        key :description, 'API応答のコンテナ'
        property :code do
          key :type, :integer
          key :format, :int32
        end
        property :type do
          key :type, :string
        end
        property :message do
          key :type, :string
        end
      end
    end
  end
end
