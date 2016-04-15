module Cch
  module Commands
    module FileSystem
      def filter_files(files, patterns)
        filtered_files = patterns.flat_map do |pattern, transform|
          find_matched_files(files, pattern, transform)
        end

        filtered_files = existing_files(filtered_files)
        compact(filtered_files)
      end

      private

      def find_matched_files(files, pattern, transform)
        files.flat_map do |file|
          matched = file.match(pattern)
          if matched
            transform ? transform.call(matched) : file
          end
        end
      end

      def existing_files(files)
        files.flatten.compact.sort.uniq.select { |f| File.exist?(f) }
      end

      def compact(files)
        files.map { |file| file unless sub_file?(files, file) }.compact
      end

      def sub_file?(files, file)
        files.each { |f| return true if file != f && file.start_with?(f) }

        false
      end
    end
  end
end
