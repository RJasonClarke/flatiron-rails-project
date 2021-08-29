class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :tools
    has_many :rec_tools, through: :tools, source: :job

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

end
