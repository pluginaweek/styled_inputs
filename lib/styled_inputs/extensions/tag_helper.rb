module PluginAWeek #:nodoc:
  module StyledInputs
    module Extensions #:nodoc:
      # Adds support for hooking calls to +tag+
      module TagHelper
        def self.included(base) #:nodoc:
          base.class_eval do
            alias_method_chain :tag, :styled_inputs
          end
        end
        
        # Ensure that the options are updated for input tags before generating
        # the html for the tag
        def tag_with_styled_inputs(name, options = nil, *args) #:nodoc:
          tag_without_styled_inputs(name, styled_input(name, options), *args)
        end
      end
    end
  end
end

ActionView::Helpers::TagHelper.class_eval do
  include PluginAWeek::StyledInputs::Extensions::TagHelper
end
