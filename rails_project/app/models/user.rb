class User < ApplicationRecord
    has_secure_password
    has_many :added_jobs, class_name: 'Job'
    has_many :tools
    has_many :jobs, through: :tools

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

end
