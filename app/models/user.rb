class User < ApplicationRecord
    has_secure_password

    validates :username, :email, presence: true
    validates :email, format: {multiline: true, with: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/}
end
