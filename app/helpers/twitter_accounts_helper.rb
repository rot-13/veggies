module TwitterAccountsHelper
  def twitter_link_to(anchor_text)
    link_to "@#{anchor_text}", "https://www.twitter.com/#{anchor_text}", :target => '_blank'
  end
end
