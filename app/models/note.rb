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
      self.viewers.build(user_id: user.id, note_id: self.id)
    end
    self.save
  end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end

end
