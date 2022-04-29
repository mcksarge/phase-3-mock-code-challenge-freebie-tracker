class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item)
        result = false
        freebies.each do |freebie|
            if freebie.item_name.downcase == item.downcase
                result = true
            end
        end
        result
    end

    def give_away(new_dev, item)
        if self.id != item.dev_id
            return "You do not own this item."
        end
        item.update(dev_id: new_dev.id)
    end

end
