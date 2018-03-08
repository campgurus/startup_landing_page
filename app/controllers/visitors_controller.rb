class VisitorsController < ApplicationController

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params.require(:visitor).permit(:email))
    if @visitor.save
      session[:visitor_id] = @visitor.id
      redirect_to thank_you_path, notice: "Signed up #{@visitor.email}."
    else
      render :new
    end
  end

end
