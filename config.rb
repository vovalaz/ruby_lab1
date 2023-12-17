module ParserApp
  module Config
    class << self
      attr_accessor :condition
      def config
        yield self

        @program ||= self
      end
    end
  end
end
