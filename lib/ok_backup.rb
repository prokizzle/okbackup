module OKBackup
  Dir[File.dirname(__FILE__) + '/backup/*.rb'].each do |file|
    require file
  end
end