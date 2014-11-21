Award = Struct.new(:name, :expires_in, :quality) do

	QUALITY_MAX = 50
	QUALITY_MIN = 0

	def below_quality_max?
		quality < QUALITY_MAX
	end

	def above_quality_min?
		quality > QUALITY_MIN
	end

	def expired?
		expires_in < 0
	end

	def blue_distinction_plus?
		name == 'Blue Distinction Plus'
	end

	def blue_first?
		name == 'Blue First'
	end

	def blue_compare?
		name == 'Blue Compare'
	end

	def normal?
		!self.blue_distinction_plus? && !self.blue_first? && !self.blue_compare?
	end

	def decrease_expiration
		if !self.blue_distinction_plus?
			self.expires_in -= 1
		end
	end

	def increase_quality
		if self.below_quality_max?
			self.quality += 1
		end
	end

	def decrease_quality
		if self.above_quality_min?
			self.quality -= 1
		end
	end

end
