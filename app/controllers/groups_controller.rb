class GroupsController < ApplicationController
  def index
    @groups = Group.where(user_id: current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    @group_expenses = @group.expenses.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.create(group_params)
    if @group.save
      flash[:notice] = 'Category created succesfully'
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    authorize! :destroy, @group
    flash[:notice] = if @group.destroy
                       'Category deleted'
                     else
                       'An error ocurred'
                     end
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
