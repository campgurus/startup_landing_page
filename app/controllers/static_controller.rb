class StaticController < ApplicationController
  def thank_you
    @visitor = Visitor.find(session[:visitor_id])
  end
end
