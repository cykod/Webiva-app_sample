


class AppSample::ThingsController < ModuleAppController

  component_info 'app_sample'

  # GET things_url
  def index
    # return all things
    @things = AppSampleThing.all
  end

  # GET new_thing_url
  def new
    # return an HTML form for describing a new thing
  end

  # POST things_url
  def create
    # create a new thing
  end

  # GET thing_url(:id => 1)
  def show
    # find and return a specific thing
    @thing = AppSampleThing.find(params[:id])
  end

  # GET edit_thing_url(:id => 1)
  def edit
    # return an HTML form for editing a specific thing
  end

  # PUT thing_url(:id => 1)
  def update
    # find and update a specific thing
  end

  # DELETE thing_url(:id => 1)
  def destroy
    # delete a specific thing
  end


end
