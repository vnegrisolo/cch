module Cch
  class Setup
    def configure
      %w(watchers runners).each do |config_file|
        require "cch/config/#{config_file}"
      end

      load('Cchfile', true) if File.exist?('Cchfile')
    end
  end
end
