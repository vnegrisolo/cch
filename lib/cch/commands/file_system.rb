module Cch
  module Commands
    module FileSystem
      def filter_files(files, patterns)
        filtered_files = patterns.flat_map do |pattern, transform|
          find_matched_files(files, pattern, transform)
        end

        existing_files(filtered_files)
      end

      private

      def find_matched_files(files, pattern, transform)
        files.flat_map do |file|
          matched = file.match(pattern)
          transform ? transform.call(matched) : file if matched
        end
      end

      def existing_files(files)
        files.flatten.compact.sort.uniq.select { |f| File.exist?(f) }
      end
    end
  end
end
