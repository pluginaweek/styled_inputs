module PluginAWeek #:nodoc:
  module Helpers #:nodoc:
    module StyledInputHelper
      #
      #
      def styled_input(name, options)
        options = options.stringify_keys
        
        if name.to_s == 'input' && options.include?('type')
          options.set_or_append('class', options['type'])
        end
        
        options
      end
    end
  end
end

module ActionView #:nodoc:
  module Helpers #:nodoc:
    module TagHelper #:nodoc:
      def tag_with_styled_input(name, options = nil, open = false) #:nodoc:
        tag_without_styled_input(name, styled_input(name, options), open)
      end
      alias_method_chain :tag, :styled_input
    end
    
    class InstanceTag #:nodoc:
      include PluginAWeek::Helpers::StyledInputHelper
      
      def tag_with_styled_input(name, options) #:nodoc:
        tag_without_styled_input(name, styled_input(name, options))
      end
      alias_method_chain :tag, :styled_input
    end
  end
end