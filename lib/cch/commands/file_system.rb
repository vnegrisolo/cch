module Cch
  module Commands
    module FileSystem
      def filter_files(files, patterns)
        filtered_files = patterns.flat_map { |pattern| files.grep(pattern) }
        puts "=> #{filtered_files.size.to_s.color(:yellow)} files=#{filtered_files}"

        filtered_files.sort.uniq.select { |f| File.exist?(f) }
      end
    end
  end
end
