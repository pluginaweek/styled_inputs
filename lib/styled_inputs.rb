require 'styled_inputs/extensions/tag_helper'
require 'styled_inputs/extensions/instance_tag'

module PluginAWeek #:nodoc:
  # Automatically adds css classes to input tags so that fields can be
  # easily styled.
  # 
  # == Tag examples
  #   
  #   text_field_tag('name')        # => <input class="text" id="name" name="name" type="text" />
  #   hidden_field_tag('name')      # => <input class="hidden" id="name" name="name" type="hidden" />
  #   radio_button_tag('agree', 1)  # => <input class="radio" id="agree_1" name="agree" type="radio" value="1" />
  # 
  # == Form helper examples
  # 
  #   text_field(:person, :name)        # => <input class="text" id="person_name" name="person[name]" size="30" type="text" />
  #   hidden_field(:person, :name)      # => <input class="hidden" id="person_name" name="person[name]" type="hidden" />
  #   radio_button(:person, :agree, 1)  # => <input class="radio" id="person_agree_1" name="person[agree]" type="radio" value="1" />
  # 
  # == Merging options
  # 
  # If you specify additional classes when creating a tag, the automated css
  # classes will be prepended to the current ones.  For example,
  # 
  #   text_field_tag('name', :class => 'selected')        # => <input class="text selected" id="name" name="name" type="text" />
  #   text_field_tag('name', :class => 'selected shadow') # => <input class="text selected shadow" id="name" name="name" type="text" />
  module StyledInputs
    # Appends the input type to the value currently stored in the html options
    # for the tag.
    def styled_input(name, options = nil)
      options = (options || {}).stringify_keys
      
      if name.to_s == 'input' && options.include?('type')
        options['class'] = (options['class'].to_s + " #{options['type']}").strip
      end
      
      options
    end
  end
end

ActionController::Base.class_eval do
  helper PluginAWeek::StyledInputs
end

ActionView::Helpers::InstanceTag.class_eval do
  include PluginAWeek::StyledInputs
end
