require 'healthcheck/version'
require 'healthcheck/configuration'
require 'healthcheck/report'
require 'healthcheck/utils'
require 'healthcheck/checks/abstract_check'
require 'active_support/core_ext/module/attribute_accessors'

module Healthcheck
  class << self
    def configure(&_blk)
      yield(configuration)
      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration!
      @configuration = nil
    end
  end
end

require 'healthcheck/rails' if defined? Rails::Railtie
