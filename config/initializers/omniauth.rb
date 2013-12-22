OmniAuth.config.on_failure do |env|
    [302, {'Location' => "/auth/#{env['omniauth.error.strategy'].name}/failure?message=#{env['omniauth.error.type']}"}, ["Redirecting..."]]
end


Rails.application.config.middleware.use OmniAuth::Builder do
=begin  
  if Rails.env.production?
    provider :weibo, '3344979966', '38916955682ab0eb4ae7f3841a57b5aa'#ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  elsif Rails.env.development?
    provider :weibo, '3344979966', '38916955682ab0eb4ae7f3841a57b5aa'#ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  end
=end
provider :weibo, '3344979966', '38916955682ab0eb4ae7f3841a57b5aa'

provider :identity, fields: [:name, :email], on_failed_registration: lambda { |env|
  IdentitiesController.action(:new).call(env)
}
OmniAuth.config.logger = Rails.logger

end
