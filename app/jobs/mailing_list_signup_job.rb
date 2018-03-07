class MailingListSignupJob < ApplicationJob
  def perform(user)
    logger.info "signing up #{user.email}"
    subscribe(user)
  end

  def subscribe(user)
    mailchimp = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    list_id = ENV['MAILCHIMP_LIST_ID']
    result = mailchimp.lists(list_id).members.create(
      body: {
        email_address: user.email,
        status: 'subscribed'
    })
    Rails.logger.info("Subscribed #{user.email} to MailChimp") if result
  end
end
