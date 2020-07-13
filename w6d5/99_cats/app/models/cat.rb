require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    COLORS = [
        'orange',
        'periwinkle',
        'green',
        'brown',
        'pink',
        'yellow',
        'blue',
        'purple',
        'calico',
        'bloodtype'
    ]

    validates :birth_date, :name, :description, presence: true
    validates :color, presence: true, inclusion: { in: COLORS, 
        message: "#{:color} is not a valid a color" }
    validates :sex, presence: true, inclusion: { in: ['M', 'F'],
        message: "#{:sex} must be 'M' or 'F'" }
    
    def age 
        time_ago_in_words(birth_date)
    end 
end
