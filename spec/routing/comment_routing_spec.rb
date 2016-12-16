require 'rails_helper'

RSpec.describe "CommentsRouting", type: :routing do
  it "routes /comments#index" do
    expect(get:('/api/v1/posts/:post_id/comments')).to route_to( format:'json', controller:'api/v1/comments', action:'index', 'post_id':':post_id')
  end
end


