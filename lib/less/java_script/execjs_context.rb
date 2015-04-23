module Less
  module JavaScript
    class ExecjsContext

      def self.instance
        return new
      end

      def initialize(globals = nil)
      end

      def unwrap
        ExecJS
      end

      def exec(&block)
        ExecJS.exec yield
      end

      def eval(source, options = nil) # passing options not supported
        source = source.encode('UTF-8') if source.respond_to?(:encode)

        ExecJS.eval("(#{source})")
      end

      def call(properties, *args)
        args.last.is_a?(::Hash) ? args.pop : nil # extract_options!

        ExecJS.eval(properties).call(*args)
      end

      def method_missing(symbol, *args)
        super
      end
    end
  end
end
