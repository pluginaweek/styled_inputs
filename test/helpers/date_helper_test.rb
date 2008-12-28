require File.dirname(__FILE__) + '/../test_helper'

class DateHelperTest < ActionView::TestCase
  def test_should_not_style_hidden_date_fields_if_using_hidden
    assert_equal '<input id="date_year" name="date[year]" type="hidden" value="1980" />', select_year(1980, :use_hidden => true).strip
  end
  
  def test_should_not_style_hidden_date_fields_if_not_using_hidden
    expected = <<-end_str
<select id="date_year" name="date[year]">
<option selected="selected" value="1980">1980</option>
<option value="1981">1981</option>
</select>
end_str
    assert_equal expected, select_year(1980, :start_year => 1980, :end_year => 1981)
  end
end
