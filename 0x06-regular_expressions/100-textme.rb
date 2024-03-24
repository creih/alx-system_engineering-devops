#!/usr/bin/env ruby
# advanced task pour Guillame
p_fil = ARGV[0]
txt_sms = File.read(p_fil)
patt = /sender: (.+?), Receiver: (.+?), Flags: (.+)/
tst_sms.scan(patt) do |sender, receiver, flags|
  puts "#{sender}, #{receiver}, #{flags}"
end
