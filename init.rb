require_plugin 'set_or_append'

require 'styled_inputs'

ActionController::Base.class_eval do
  helper PluginAWeek::Helpers::StyledInputHelper
end