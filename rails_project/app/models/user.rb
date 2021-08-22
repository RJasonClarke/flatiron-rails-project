class User < ApplicationRecord
    has_secure_password
    has_many :jobs
    has_many :tools
    has_many :listed_tools, through: :jobs, source: :tools

    validates :email, :password, presence: true

end
