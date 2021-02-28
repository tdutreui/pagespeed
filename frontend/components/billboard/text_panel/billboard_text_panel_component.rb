# frozen_string_literal: true

module BillboardTextPanelComponent
  extend ComponentHelper

  def items
    webm_posts_url = 'https://webmasters.googleblog.com/search/label/speed'
    email_link = mail_to Rails.configuration.emails[:staff], 'Email me'
    lighthouse_url='https://github.com/GoogleChrome/lighthouse'
    [
      {
        title: "Get notified",
        text: "Receive an email on the next day if anything goes wrong with your pages performance. View daily tests' report history."
      },
      {
        title: "What's new",
        text: "Search engines performance evaluation criteria are constantly changing. Read the latest #{link_to 'Google Webmaster Central posts about performance & speed.', webm_posts_url, target: :blank}"
      },
      {
        title: "Give feedback",
        text: "Suggest a feature or anything to ask ? #{email_link}"
      },
      {
        title: "How does it work ?",
        text: "#{link_to 'Google Lighthouse', lighthouse_url, target: :blank} is used to generate performance reports"
      }
    ]
  end
end
