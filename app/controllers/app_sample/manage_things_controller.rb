


class AppSample::ManageThingsController < ModuleController

  component_info "app_sample"

  permit :app_sample_manage
  
  active_table :things_table, AppSampleThing, [ :check, :name, :description ]

  cms_admin_paths "content",
    "App Sample Things" => { :action => 'index' }

  def display_things_table(display=true)

    active_table_action(:things) do |act,tids|
      case act
      when 'delete': AppSampleThing.destroy(tids)
      end
    end

    @tbl = things_table_generate params
    render :partial => 'things_table' if display
  end

  def index
    cms_page_path ["Content"],"App Sample Things" 

    display_things_table(false)
  end


  def edit
    @thing = AppSampleThing.find_by_id(params[:path][0]) || AppSampleThing.new

    cms_page_path [ "Content", "App Sample Things"],@thing.new_record? ? 'Create Thing' : 'Edit Thing' 

    if request.post? && params[:thing]
      if params[:commit] && @thing.update_attributes(params[:thing])
        redirect_to :action => :index, :notice => 'Saved Thing'
      elsif !params[:commit]
        redirect_to :action => :index
      end
    end


  end
end
