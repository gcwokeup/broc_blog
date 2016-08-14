class Entry < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, :user_id, { presence: true }

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
