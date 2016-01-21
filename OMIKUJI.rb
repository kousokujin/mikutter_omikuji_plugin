# -*- coding: utf-8 -*-

Plugin.create(:OMIKUJI) do

	on_appear do |ms|
		ms.each do |m|
			
			if Time.now - m[:created] > 5
        			next
     			 end
		
			if m.message.to_s =~ /^@#{Service.primary.user.to_s} おみくじ/
					post_tweet =  "@#{m.user.to_s} "+ get_omikuji()
        			Service.primary.post :message => post_tweet, :replyto => m.message
			end
		end
	end

	def get_omikuji
		r = rand(120)
		
		if (1 <= r)&&(20 >= r) then
			return "大吉"
		end

		if (21 <= r)&&(40 >= r) then
			return "吉"
		end

		if (41 <= r)&&(60 >= r) then
			return "中吉"
		end

		if (61 <= r)&&(80 >= r) then
			return "小吉"
		end

		if (81 <= r)&&(100 >= r) then
			return "凶"
		end

		if (101 <= r)&&(120 >= r) then
			return "大凶"
		end

		return "大大凶"
		
	end


end
