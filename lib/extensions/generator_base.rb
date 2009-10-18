Rails::Generator::Base.class_eval do
  # Return true if file exists
  def file_exist?(relative_destination)     
    File.exist?(destination_path(relative_destination))
  end

  # Return true if directory exists and  exists relative_destination is a directory
  def directory_exists?(relative_destination)
    File.exist?(destination_path(relative_destination))&& File.directory?(destination_path(relative_destination))
  end
end