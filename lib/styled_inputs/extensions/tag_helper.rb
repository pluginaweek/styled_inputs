# The TagHelper module is re-opened directly instead of including additional
# modules in order for the chained behavior to be applied to other, unanticipated
# classes that include ActionView::Helpers::TagHelper directly.
ActionView::Helpers::TagHelper.class_eval do
  # Appends the input type to the value currently stored in the html options
  # for the tag.
  def styled_input(name, options = nil)
    options = (options || {}).stringify_keys
    options['class'] = "#{options['class']} #{options['type']}".strip if name.to_s == 'input' && options.include?('type')
    options
  end
  
  # Ensure that the options are updated for input tags before generating
  # the html for the tag
  def tag_with_styled_inputs(name, options = nil, *args) #:nodoc:
    tag_without_styled_inputs(name, styled_input(name, options), *args)
  end
  alias_method_chain :tag, :styled_inputs
end
