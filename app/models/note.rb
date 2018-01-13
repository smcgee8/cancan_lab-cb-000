class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    array = self.viewers.collect do |viewer|
      User.find(viewer.user_id).name
    end
    binding.pry
  end

  def visible_to=(names)
    names.split(',').each do |name|
      user = User.find_by(name: name.strip)
      user.viewers.build(user_id: user.id, note_id: self.id)
    end
    user.save
  end

end
