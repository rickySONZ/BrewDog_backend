class Cap < ApplicationRecord

    def add_request
        self.amount += 1
        self.save
    end

    def daily_reset
        # self.updated_at.day !== Date
    end
end
