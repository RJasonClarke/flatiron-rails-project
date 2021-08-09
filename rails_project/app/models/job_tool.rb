class JobTool < ApplicationRecord
    belongs_to :job
    has_many :tools
end
