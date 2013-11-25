class Course < ActiveRecord::Base
  attr_accessible :title, :content, :tag_list
  acts_as_taggable_on :tags
  def self.all_grades
    %W(A A- B+ B B- C+ C C- D+ D D- F)
  end

  #getter
  def render_content
    require 'redcarpet'
    renderer    = Redcarpet::Render::HTML.new
    extensions  = {fenced_code_blocks: true}
    redcarpet   = Redcarpet::Markdown.new(renderer, extensions)

    @rendered_body = redcarpet.render self.content
    return @rendered_body
  end
end
