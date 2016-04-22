module Cch
  class Setup
    LOCAL_CONFIG_FILE = '.cchfile.rb'.freeze
    CONFIG_FILES = %w(watchers runners).freeze

    def configure
      CONFIG_FILES.each do |file|
        require "cch/config/#{file}"
      end

      generate_local_config unless File.exist?(LOCAL_CONFIG_FILE)

      load(LOCAL_CONFIG_FILE, true)
    end

    private

    def generate_local_config
      file_content = "#{Runner.name}.run #{Runner.runners.keys}"
      File.open(LOCAL_CONFIG_FILE, 'w') { |f| f.write file_content }
    end
  end
end
