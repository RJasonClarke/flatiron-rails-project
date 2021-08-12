class JobTool < ApplicationRecord
    belongs_to :job, optional: true
    belongs_to :tool, optional: true
end
