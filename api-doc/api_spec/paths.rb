Dir.glob(File.join(__dir__, 'paths') + '/*').each do |file|
  require_relative "paths/#{File.basename(file, '.*')}"
end
