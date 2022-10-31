#
# Adds a bootstrap error styling to form fields with errors
#
ActionView::Base.field_error_proc = proc do |html_tag, element|
  case element
  when ActionView::Helpers::Tags::TextField, ActionView::Helpers::Tags::TextArea
    new_tag = html_tag.gsub("form-control", "form-control is-invalid")
    new_tag += <<~EOS
      <div class="invalid-feedback">
        #{element.error_message.join(", ")}
      </div>
    EOS
    new_tag.html_safe
  else
    html_tag
  end
end
