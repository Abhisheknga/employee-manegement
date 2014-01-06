class RecordsController < ApplicationController
  def index
    @records=Record.all
    @order="ASC"
  end

  def new
    @record=Record.new
  end

  def create
    #render text: params[:record].inspect
    #@record=record.new(params[:record])
    @record=Record.new(record_params)
    if @record.save
      redirect_to @record
    else
      render 'new'
    end
  end

  def show
    @record=Record.find(params[:id])
  end

  def edit
    @record=Record.find(params[:id])
  end

  def update
    @record=Record.find(params[:id])
    if @record.update(params[:record].permit(:title,:due_date,:priority,:description))
      redirect_to @record
    else
      render 'edit'
    end
  end

  def destroy
    @record=Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  def sortById
    @records=Record.all
    redirect_to records_path
  end

  def sortByDueDate
    @records=Record.order('due_date')
    @order="ASC"
    render 'index'
  end

  def sortByPriority
    puts "hellooooooooooooooooooooooooooooooooooooo"

    puts params[:sort]
    @klass = case params[:sort]
    when "ASC"
      # [Record.all, "foo"]
      @records=Record.all.reorder('priority')
      @order="DESC"
      puts @order
    else
      # [Record.all, "bar"]
      @records=Record.all.reorder('priority').reverse_order
      @order="ASC"
      puts @order
    end

    # clickeditem.update_attribute(:click_count, clickeditem.click_count + 1)
    # @records=Record.all.reorder('priority').reverse_order
    render 'index'
  end

  def priority_sort_ajax
    puts "11111111111111111111111111111111111111111111111111111111111111111111111111111111111"
    puts "Priority Sort"
    puts params[:sort_as];
    puts params.inspect;

    @records = Record.order('priority '+params[:sort_as]);
    respond_to do |format|
    # format.html  { render :xml => @records }
      format.json { render json: @records }
    end
  # render 'index'
  end

  def due_date_sort
    puts "Due Date Sort"
    @tasks = Task.order('task_due_on')
    render 'index'
  end

  private

  def record_params
    params.require(:record).permit(:title,:due_date,:priority,:description)
  end
end