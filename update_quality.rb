require 'award'

def update_quality(awards)
  awards.each do |award|
    if award.normal?
      award.decrease_quality
    elsif award.blue_star?
      award.decrease_quality_twice
    else
        award.increase_quality
        if award.blue_compare? && award.expires_in < 11
          award.increase_quality
          if award.expires_in < 6
            award.increase_quality
          end
        end
    end

    award.decrease_expiration

    if award.expired?
      case 
      when award.blue_first?
        award.increase_quality
      when award.blue_compare?
        award.quality = 0
      when award.blue_star?
        award.decrease_quality_twice
      when award.normal?
        award.decrease_quality
      end
    end
  end
end
