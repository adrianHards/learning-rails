class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # tell Rails once which formats to handle, rather than inside each action
  respond_to :html
  # set flash messages in respond_with, customised in config/locales/responders.en.yml
  responders :flash

  # GET /tasks
  def index
    @tasks = Task.all
    # argument passed to respond_with is used to generate the redirect url for successful html requests
    # https://stackoverflow.com/questions/6620864/ruby-on-rails-whats-the-difference-between-respond-to-and-respond-with
    # https://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    respond_with(@tasks)
  end

  # GET /tasks/1
  def show
    # before_action
    respond_with(@task)
  end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_with(@task)
  end

  # GET /tasks/1/edit
  def edit
    # before_action
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.save
    respond_with(@task)
    # no need for flash[:notice] = "Task was successfully created." if @task.save as we are using responders
  end

  # PATCH/PUT /tasks/1
  def update
    # before_action
    @task.update(task_params)
    respond_with(@task)
  end

  # DELETE /tasks/1
  def destroy
    # before_action
    @task.destroy
    # neither redirect_to tasks_path nor :location => tasks_path needed
    respond_with(@task)
  end

  # indicates actions are not accessible via any routes
  # you can only use private methods with other methods from inside the same class
  private

  # Use callbacks to share common setup or constraints between actions
  # find instance of task from id of task in params
  def set_task
    @task = Task.find(params[:id])
  end

  # find the task based on the given id, and load it in the task variable
  # only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :status)
  end
  # params in a controller looks like a Hash, but it's actually an instance of ActionController::Parameters which
  # provides several methods such as require and permit. The require method ensures that a specific parameter is present
  # if it's not provided, the require method throws an error. The permit method returns a copy of the parameters object,
  # returning only the permitted keys and values
  # https://stackoverflow.com/questions/18424671/what-is-params-requireperson-permitname-age-doing-in-rails-4
end
