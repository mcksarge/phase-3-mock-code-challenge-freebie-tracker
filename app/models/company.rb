class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item, value)
        Freebie.create(
            item_name: item,
            value: value,
            company_id: self.id,
            dev_id: dev.id
        )
        Freebie.save
    end

    def self.oldest_company
        oldest = Company.minimum(:founding_year)
        Company.find_by(founding_year: oldest)
    end

end
