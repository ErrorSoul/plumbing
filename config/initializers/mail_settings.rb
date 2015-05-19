Settings.mailer.base.to_hash.each do |method, value|
  ActionMailer::Base.send "#{method}=", value
end
