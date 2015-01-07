module Sprockets
  module Bowerrc
    module Bowerrc
      POSSIBLE_BOWER_RCS = [File.absolute_path('.bowerrc', '/'), File.absolute_path('.bowerrc', ENV['HOME']), File.absolute_path('.bowerrc', @root)]

      def append_bowerrc
        append_path bower_config['directory'] if File.directory?(bower_config['directory'])
      end

      def prepend_bowerrc
        prepend_path bower_config['directory'] if File.directory?(bower_config['directory'])
      end

      alias :use_bowerrc, :append_bowerrc

      def bower_config
        @bowerrc ||= POSSIBLE_BOWER_RCS.inject({}) { |memo, file|
          if File.exists?(file)
            hash = JSON.parse(File.read(file))
            memo.merge! hash
          end
          memo
        }
      end
    end
  end
end