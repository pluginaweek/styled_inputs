module PluginAWeek #:nodoc:
  module StyledInputs
    module Extensions #:nodoc:
      module InstanceTag
        def self.included(base) #:nodoc:
          base.class_eval do
            alias_method_chain :tag, :styled_inputs
          end
        end
        
        def tag_with_styled_inputs(name, options) #:nodoc:
          tag_without_styled_inputs(name, styled_input(name, options))
        end
      end
    end
  end
end

ActionView::Helpers::InstanceTag.class_eval do
  include PluginAWeek::StyledInputs::Extensions::InstanceTag
end
