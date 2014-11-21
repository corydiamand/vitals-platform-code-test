Award = Struct.new(:name, :expires_in, :quality) do

	QUALITY_MAX = 50
	QUALITY_MIN = 0

	def below_quality_max?
		quality < QUALITY_MAX
	end

	def above_quality_min?
		quality > QUALITY_MIN
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

	def decrease_expiration
		self.expires_in -= 1
	end

	def increase_quality
		self.quality += 1
	end

	def decrease_quality
		self.quality -= 1
	end

end
