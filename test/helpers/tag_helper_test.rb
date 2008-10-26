require File.dirname(__FILE__) + '/../test_helper'

class TagHelperTest < ActionView::TestCase
  tests PluginAWeek::StyledInputs
  
  def test_should_allow_no_options_to_be_specified
    assert_equal '<br />', tag('br')
  end
  
  def test_should_allow_options_to_be_specified
    assert_equal '<input class="text" disabled="disabled" type="text" />', tag('input', {:type => 'text', :disabled => true})
  end
  
  def test_should_allow_open_to_be_specified
    assert_equal '<br>', tag('br', nil, true)
  end
  
  def test_should_allow_escape_to_be_specified
    assert_equal '<img src="open &amp; shut.png" />', tag('img', {:src => 'open &amp; shut.png'}, false, false)
  end
end
