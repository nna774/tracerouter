require 'mail'

str = ""
$*.each do |s|
  str += s
  str += " "
end

mailbody = `#{str}`

mail = Mail.new do
  from    'tracerouter@nona7.kmc.gr.jp'
  to      'nona7@kmc.gr.jp'
  subject "#{$*}"
  body    mailbody
end



mail.delivery_method :smtp, { address:   'localhost',
                              port:      2525,
                              domain:    'sharp'}
mail.deliver!
