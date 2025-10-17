class Planet < ApplicationRecord
    has_many :planet_infos, dependent: :destroy
end
