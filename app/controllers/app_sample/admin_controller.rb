
class AppSample::AdminController < ModuleController

 component_info 'AppSample', :description => 'App Sample support', 
                              :access => :public
                              
 # Register a handler feature
 register_permission_category :app_sample, "AppSample" ,"Permissions related to App Sample"
  
 register_permissions :app_sample, [ [ :manage, 'Manage App Sample', 'Manage App Sample' ],
                                  [ :config, 'Configure App Sample', 'Configure App Sample' ]
                                  ]
 cms_admin_paths "options",
    "App Sample Options" => { :action => 'index' },
    "Options" => { :controller => '/options' },
    "Modules" => { :controller => '/modules' }

 permit 'app_sample_config'

 content_model :things

 def self.get_things_info
   [
     { :name => 'Things', :url => { :controller => '/app_sample/manage_things' },
       :permissino => 'app_sample_manage'
   }
   ]
 end

 public 
 
 def options
    cms_page_path ['Options','Modules'],"App Sample Options"
    
    @options = self.class.module_options(params[:options])
    
    if request.post? && @options.valid?
      Configuration.set_config_model(@options)
      flash[:notice] = "Updated App Sample module options".t 
      redirect_to :controller => '/modules'
      return
    end    
  
  end
  
  def self.module_options(vals=nil)
    Configuration.get_config_model(Options,vals)
  end
  
  class Options < HashModel
   # Options attributes 
   # attributes :attribute_name => value
  
  end
  
end
