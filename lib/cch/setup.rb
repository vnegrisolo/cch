module Cch
  class Setup
    def configure
      %w(watchers runners).each do |config_file|
        require "cch/config/#{config_file}"
      end

      if File.exist?('Cchfile')
        Cch.logger.warning('Deprecated => please rename the config file "Cchfile" to "cchfile.rb"')
        load('Cchfile', true)
      end
      load('cchfile.rb', true) if File.exist?('cchfile.rb')
    end
  end
end
