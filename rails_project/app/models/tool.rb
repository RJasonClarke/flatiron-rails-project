class Tool < ApplicationRecord
    belongs_to :job_tools
    has_many :jobs, through: :job_tools
end
