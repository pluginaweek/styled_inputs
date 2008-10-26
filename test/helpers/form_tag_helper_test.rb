require File.dirname(__FILE__) + '/../test_helper'

class FormTagHelperTest < ActionView::TestCase
  tests PluginAWeek::StyledInputs
  
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
    def path_to_image(source)
      source
    end
end
