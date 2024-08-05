require 'minitest/reporters'

module Minitest
  module Reporters
    class AwesomeReporter < DefaultReporter
      GREEN = '1;32'
      RED = '1;31'

      def color_up(string, color)
        color? ? "\e\[#{ color }m#{ string }#{ ANSI::Code::ENDCODE }" : string
      end

      def red(string)
        color_up(string, RED)
      end

      def green(string)
        color_up(string, GREEN)
      end
    end
  end
end

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::AwesomeReporter.new(reporter_options)]