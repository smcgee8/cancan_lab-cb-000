class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    array = self.viewers.collect do |viewer|
      User.find(viewer.user_id).name
    end
    array.join(', ')
  end

  def visible_to=(names)
    names.split(',').each do |name|
      user = User.find_by(name: name.strip)
      user.viewers.build(user_id: user.id, note_id: self.id)
      binding.pry
    end
    binding.pry
    user.save
  end

end
