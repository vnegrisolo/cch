module Cch
  class Setup
    def configure
      %w(logger watchers runners).each do |config_file|
        require "cch/config/#{config_file}"
      end

      load('Cchfile', true) if File.exist?('Cchfile')
    end
  end
end
