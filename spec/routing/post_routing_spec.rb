require 'rails_helper'

RSpec.describe "PostsRouting", :type => :routing do

    it "routes /posts#index" do
      expect(get:('api/v1/posts')).to route_to( format:'json', controller:'api/v1/posts', action:'index')
    end
    it "routes /posts#show" do
      expect(get:('api/v1/posts/:id')).to route_to( format:'json', controller:'api/v1/posts', action:'show', 'id':':id')
    end
end


