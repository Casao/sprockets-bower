require "sprockets/bower/version"

module Sprockets
  module Bower
    # Internal: Local .bowerrc filenames
    POSSIBLE_BOWER_RCS = ['.bowerrc']

    # Enable .bowerrc reading by checking for possible .bowerrc files.
    #
    # Returns nothing.

    def use_bowerrc
      POSSIBLE_BOWER_RCS.map { |file| File.join(@root, file) }.each { |fn| read_bowerrc(fn) if self.file?(fn) }
    end

    # Internal: Read bower configuration file to find the bower path.
    #
    # filename - String path to .bowerrc
    #
    # Returns nothing.

    def read_bowerrc(filename)
      bower = JSON.parse(File.read(filename))
      directory = bower['directory']
      stat = self.stat(File.join(@root, directory))

      if stat && stat.directory?
        append_path(directory)
      else
      end
    end
  end
end
