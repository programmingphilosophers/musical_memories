class Validations < ActiveRecord::Base

  include BCrypt

  # setter
  def password=(pwd)
    self.pass_digest = BCrypt::Password.create(pwd)
  end

  def password
    BCrypt::Password.new(self.pass_digest)
  end

  def self.authenticate(user_name, password)
    current_user = Validations.find_by(user_name: user_name)
    if (current_user != nil)
      if (current_user.password == password)
        return current_user
      end
    else
      return nil
    end
  end
end
