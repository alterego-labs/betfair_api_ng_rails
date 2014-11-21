require 'yaml'

class BaseYamlLoader
  attr_reader :data

  def initialize(file_name)
    @data = YAML.load_file(file_path(file_name))
  end

  def fetch(resource_name)
    data.fetch resource_name, {}
  end

  private

  def file_path(file_name)
    File.join(File.dirname(__FILE__), "data/#{file_name}.yml")
  end
end
