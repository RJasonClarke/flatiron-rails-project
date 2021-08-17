class Tool < ApplicationRecord
    belongs_to :user
    belongs_to :job

    validates :title, presence: true
end
