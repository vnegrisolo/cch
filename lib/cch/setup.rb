module Cch
  class Setup
    class << self
      def config
        @config ||= load_config('cch.yml')
      end

      private

      def load_config(name)
        file = File.expand_path("../../../config/#{name}", __FILE__)
        config = YAML.load_file(file)
        puts "=> config='#{config}'" if config['debug']
        config['cch']
      end
    end
  end
end
