module Oxymoron
  class Configuration
    attr_accessor :tmp_folder_path

    def initialize
      @tmp_folder_path = "/tmp"
    end
  end
end