require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	describe "#index" do
    it "renders index.html.erb" do
      get :index, xhr: true, format: :html
      response.should render_template 
    end
  end

  describe "#edit" do
    it "renders edit.html.erb" do
      get :edit, xhr: true, format: :html
      response.should render_template 
    end
  end

	describe "#show" do
    it "renders show.html.erb" do
      get :show, xhr: true, format: :html
      response.should render_template 
    end
  end


end
