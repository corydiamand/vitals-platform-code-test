require 'award'

def update_quality(awards)
  awards.each do |award|
    if !award.blue_first? && !award.blue_compare?
      if award.above_quality_min?
        if !award.blue_distinction_plus?
          award.decrease_quality
        end
      end
    else
      if award.below_quality_max?
        award.increase_quality
        if award.blue_compare?
          if award.expires_in < 11
            if award.below_quality_max?
              award.increase_quality
            end
          end
          if award.expires_in < 6
            if award.below_quality_max?
              award.increase_quality
            end
          end
        end
      end
    end
    if !award.blue_distinction_plus?
      award.decrease_expiration
    end
    if award.expires_in < 0
      if !award.blue_first?
        if !award.blue_compare?
          if award.above_quality_min?
            if !award.blue_distinction_plus?
              award.decrease_quality
            end
          end
        else
          award.quality = award.quality - award.quality
        end
      else
        if award.below_quality_max?
          award.increase_quality
        end
      end
    end
  end
end
