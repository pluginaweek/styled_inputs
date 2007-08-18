require File.dirname(__FILE__) + '/test_helper'

class Person
  attr_accessor :name,
                :agree,
                :picture,
                :secret
end

class StyledInputsTest < Test::Unit::TestCase
  include PluginAWeek::Helpers::StyledInputsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormHelper
  
  def setup
    @person = Person.new
  end
  
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
  
  # FormHelper tests
  
  def test_should_style_text_field
    assert_equal '<input class="text" id="person_name" name="person[name]" size="30" type="text" />', text_field(:person, :name)
  end
  
  def test_should_style_password_field
    assert_equal '<input class="password" id="person_secret" name="person[secret]" size="30" type="password" />', password_field(:person, :secret)
  end
  
  def test_should_style_hidden_field
    assert_equal '<input class="hidden" id="person_name" name="person[name]" type="hidden" />', hidden_field(:person, :name)
  end
  
  def test_should_style_file_field
    assert_equal '<input class="file" id="person_picture" name="person[picture]" size="30" type="file" />', file_field(:person, :picture)
  end
  
  def test_should_style_check_box
    expected =
      '<input class="checkbox" id="person_agree" name="person[agree]" type="checkbox" value="1" />' +
      '<input class="hidden" name="person[agree]" type="hidden" value="0" />'
    assert_equal expected, check_box(:person, :agree)
  end
  
  def test_should_style_radio_button
    assert_equal '<input class="radio" id="person_agree_1" name="person[agree]" type="radio" value="1" />', radio_button(:person, :agree, 1)
  end
  
  # FormTagHelper tests
  
  def test_should_style_text_field_tag
    assert_equal '<input class="text" id="name" name="name" type="text" />', text_field_tag('name')
  end
  
  def test_should_style_hidden_field_tag
    assert_equal '<input class="hidden" id="name" name="name" type="hidden" />', hidden_field_tag('name')
  end
  
  def test_should_style_file_field_tag
    assert_equal '<input class="file" id="picture" name="picture" type="file" />', file_field_tag('picture')
  end
  
  def test_should_style_password_field_tag
    assert_equal '<input class="password" id="secret" name="secret" type="password" />', password_field_tag('secret')
  end
  
  def test_should_style_check_box_tag
    assert_equal '<input class="checkbox" id="agree" name="agree" type="checkbox" value="1" />', check_box_tag('agree')
  end
  
  def test_should_style_radio_button_tag
    assert_equal '<input class="radio" id="agree_1" name="agree" type="radio" value="1" />', radio_button_tag('agree', 1)
  end
  
  def test_should_style_submit_tag
    assert_equal '<input class="submit" name="commit" type="submit" value="Submit" />', submit_tag('Submit')
  end
  
  def test_should_style_image_submit_tag
    assert_equal '<input class="image" src="button.png" type="image" />', image_submit_tag('button.png')
  end
  
  private
  def image_path(source)
    source
  end
end
