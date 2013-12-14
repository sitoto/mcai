Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :weibo, '3344979966', '38916955682ab0eb4ae7f3841a57b5aa'#ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  elsif Rails.env.development?
    provider :weibo, '3344979966', '38916955682ab0eb4ae7f3841a57b5aa'#ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  end
  OmniAuth.config.logger = Rails.logger
end
