require "oxymoron/version"
require "oxymoron/configuration"
require "oxymoron/local_resource"

module Oxymoron
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
