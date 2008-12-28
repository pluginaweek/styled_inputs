# ActiveRecordHelper chains InstanceTag's +tag+ implementation.  As a result,
# in order to add styled inputs, that re-implementation needs to be chained
# again.
ActionView::Helpers::InstanceTag.class_eval do
  alias_method_chain :tag, :styled_inputs
end
