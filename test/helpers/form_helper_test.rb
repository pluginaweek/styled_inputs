require File.dirname(__FILE__) + '/../test_helper'

class FormHelperTest < ActionView::TestCase
  class Person
    attr_accessor :name,
                  :agree,
                  :picture,
                  :secret
  end
  
  def setup
    @person = Person.new
  end
  
  def test_should_style_text_field
    assert_equal '<input class="text" id="person_name" name="person[name]" size="30" type="text" />', text_field(:person, :name)
  end
  
  def test_should_style_password_field
    assert_equal '<input class="password" id="person_secret" name="person[secret]" size="30" type="password" />', password_field(:person, :secret)
  end
  
  def test_should_not_style_hidden_field
    assert_equal '<input id="person_name" name="person[name]" type="hidden" />', hidden_field(:person, :name)
  end
  
  def test_should_style_file_field
    assert_equal '<input class="file" id="person_picture" name="person[picture]" size="30" type="file" />', file_field(:person, :picture)
  end
  
  def test_should_style_check_box
    expected =
      '<input class="checkbox" id="person_agree" name="person[agree]" type="checkbox" value="1" />' +
      '<input name="person[agree]" type="hidden" value="0" />'
    assert_equal expected, check_box(:person, :agree)
  end
  
  def test_should_style_radio_button
    assert_equal '<input class="radio" id="person_agree_1" name="person[agree]" type="radio" value="1" />', radio_button(:person, :agree, 1)
  end
end
