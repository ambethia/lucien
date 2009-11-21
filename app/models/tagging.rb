class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
  belongs_to :tagger, :polymorphic => true
  validates_presence_of :context

  after_save :set_taggable_delta_flag

  private

  def set_taggable_delta_flag
    taggable.delta = true
    taggable.save
  end
end