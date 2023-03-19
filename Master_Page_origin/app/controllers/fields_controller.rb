
class FieldsController < ApplicationController

  def index
    @fields = Field.where(ancestry:nil)
  end

  def show
    @field = Field.find(params[:id])
    @children = @field.children
    respond_to do |format|
      format.html
      format.json{
        render json: @children
      }
    end
  end

end
