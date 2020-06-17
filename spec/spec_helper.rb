require 'pathname'
ROOT = Pathname.new(File.expand_path('../../', __FILE__))
$:.unshift((ROOT + 'lib').to_s)
$:.unshift((ROOT + 'spec').to_s)

require 'bundler/setup'
require 'bacon'
require 'mocha-on-bacon'
require 'pretty_bacon'
require 'pathname'
require 'cocoapods'

Mocha::Configuration.prevent(:stubbing_non_existent_method)

require 'cocoapods_plugin'

#-----------------------------------------------------------------------------#

module Pod

  # Disable the wrapping so the output is deterministic in the tests.
  #
  UI.disable_wrap = true

  # Redirects the messages to an internal store.
  #
  module UI
    @output = ''
    @warnings = ''

    class << self
      attr_accessor :output
      attr_accessor :warnings

      def puts(message = '')
        @output << "#{message}\n"
      end

      def warn(message = '', actions = [])
        @warnings << "#{message}\n"
      end

      def print(message)
        @output << message
      end
    end
  end
end

#-----------------------------------------------------------------------------#

#-- disable execute_command -------------------------------------------------------#

module Pod
  module Downloader
    class Base
      # Override hook to suppress executables output.
      #
      def execute_command(executable, command, raise_on_failure = false)
        ''
      end

      def ui_action(_)
        yield
      end

      def ui_sub_action(_)
        yield
      end

      def ui_message(_)
      end
    end
  end
end

#-----------------------------------------------------------------------------#
