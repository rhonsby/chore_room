# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  uid        :string(255)      not null
#  email      :string(255)      not null
#  photo      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.photo = auth["info"]["image"]
      user.email = auth["info"]["email"]
    end
  end
end
