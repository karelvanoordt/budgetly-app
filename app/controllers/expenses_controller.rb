class ExpensesController < ApplicationController
  def new
    @user = User.where(user_id: current_user.id)
    @group = Group.find(params[:group_id])
    @expense = Expense.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.create(name: expense_params[:name], amount: expense_params[:amount],
                                       user_id: current_user.id, group_id: @group.id)
    if @expenses.save
      flash[:notice] = 'Expense created succesfully'
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    authorize! :destroy, :expense
    flash[:notice] = if @expense.destroy
                       'Expense deleted'
                     else
                       'An error ocurred'
                     end
    redirect_to root_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
