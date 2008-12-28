require File.dirname(__FILE__) + '/../test_helper'

class StyledInputsTest < ActionView::TestCase
  def test_should_not_style_input_if_tag_is_not_input
    expected = {}
    assert_equal expected, styled_input('td', expected)
  end
  
  def test_should_not_style_input_if_correct_type_but_tag_is_not_input
    expected = {'type' => 'text'}
    assert_equal expected, styled_input('td', expected)
  end
  
  def test_should_style_input_if_tag_is_input
    expected = {'type' => 'text', 'class' => 'text'}
    assert_equal expected, styled_input('input', {'type' => 'text'})
  end
  
  def test_should_style_input_if_tag_is_symbolic_input
    expected = {'type' => 'text', 'class' => 'text'}
    assert_equal expected, styled_input(:input, {'type' => 'text'})
  end
  
  def test_should_not_style_input_if_tag_is_input_but_type_not_specified
    expected = {}
    assert_equal expected, styled_input('input', expected)
  end
  
  def test_should_append_style_if_class_is_already_populated
    expected = {'type' => 'text', 'class' => 'selected text'}
    assert_equal expected, styled_input('input', {'type' => 'text', 'class' => 'selected'})
  end
  
  def test_should_style_general_tag_builder
    assert_equal '<input class="text" type="text" />', tag('input', {'type' => 'text'})
  end
end
