class TermsOfUse < SitePrism::Page
  element :language_select, '.languageSelected'

  def effective_as_of_date
    page.find('.herotextwrap').text.split("Effective as of ").last
  end
end
