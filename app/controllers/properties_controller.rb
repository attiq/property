class PropertiesController < ApplicationController

  def add_image
    puts "in createeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
    puts "1----------------------------- #{params[:image][:uploaded_data]}"
    @image = Image.new(params[:image])
   
    @property = Property.find(@image.property_id)
    if @image.save

      puts "4"
      flash[:notice] = 'Image was successfully uploaded.'
      puts "5"
#      @allimages = @image
      puts "6"
      @image = Image.new
      puts "7"
      redirect_to :action => "view_property" , :id=>@property.id

    else
      flash[:notice] = 'Image was not uploaded.'
      render :action => "new_image"
    end
  end
  def new_property
    
    @image = Image.new
    @image1 = Image.new
    @image2 = Image.new
    @image3 = Image.new
    @image4 = Image.new
    @image5 = Image.new
    @image6 = Image.new
    @image7 = Image.new
    @image8 = Image.new
    @image9 = Image.new
   
  end
  def new_image
    @image = Image.new
    @property = Property.find_by_id(params[:id])
  end
  
def delete_image
  @imagefordeletion = Image.find_by_id(params[:id])
  @property = Property.find(@imagefordeletion.property_id)
  @images = @property.images.paginate(:page => params[:page],:per_page => 5,:conditions => ["parent_id IS NULL"])
  @image = Image.find_by_id(@images.first.id)
  @imagefordeletion.destroy
  redirect_to :action => "view_property", :id => @property.id
end

  def create

    
    has_error = false

    @agent = User.new
    @agent.is_agent = true
    @agent.first_name = params[:agent_name]

    if params[:agent_name] == ""
      flash[:notice]= "Agent name can't be blank"
      has_error = true
    end

    if !has_error

      @status = Status.new
      @status.name = "Home for Sale"

     

      @property = Property.new(params[:property])
      if !params[:image].nil?
        @property.images << Image.new(params[:image])
      end
      if !params[:image1].nil?
        @property.images << Image.new(params[:image1])
      end
      if !params[:image2].nil?
        @property.images << Image.new(params[:image2])
      end
      if !params[:image3].nil?
        @property.images << Image.new(params[:image3])
      end
      if !params[:image4].nil?
        @property.images << Image.new(params[:image4])
      end
      if !params[:image5].nil?
        @property.images << Image.new(params[:image5])
      end
      if !params[:image6].nil?
        @property.images << Image.new(params[:image6])
      end
      if !params[:image7].nil?
        @property.images << Image.new(params[:image7])
      end
      if !params[:image8].nil?
        @property.images << Image.new(params[:image8])
      end
      if !params[:image9].nil?
        @property.images << Image.new(params[:image9])
      end
     
      
      if @property.save
        @status.save
        @agent.save

        @property = Property.find_by_id(@property.id)
        @property.user_id = @agent.id
        @property.status_id = @status.id

        @property.save
        

      else
        has_error = true
      end
    end
    
    if !has_error
      flash[:notice] = ""
      redirect_to :action=>"view_property", :id=>@property.id
    else
      render :action=>"new_property"
    end
  end
  
  def view_property
    
    @property = Property.find_by_id(params[:id])
    if @property.images.size > 0
      @images = @property.images.paginate(:page => params[:page],:per_page => 5,:conditions => ["parent_id IS NULL"])
      @image = Image.find_by_id(@images.first.id)
      puts "-----------------> #{@images}"
    end

  end

  def get_thumbnail
    puts "----------------in get thumbnail"
    @image = Image.find_by_id(params[:id])
    puts @image.inspect
    render :update do |page|
      page["mainvehicleImages"].replace_html :partial=>'main_image'
    end
  end

  def home
    @properties = Property.find(:all)
  end

  def edit_property
    @property = Property.find_by_id(params[:id])
  end

  def update

    has_error = false

    @agent = User.find_by_id(params[:property][:user_id])
    @agent.first_name = params[:agent_name]

    if params[:agent_name] == ""
      flash[:notice]= "Agent name can't be blank"
      has_error = true
    end

    if !has_error    
      @property = Property.find_by_id(params[:property][:id])
      @property.update_attributes(params[:property])
      if @property.save
        @agent.save
      else
        has_error = true
      end
    end

    if has_error
      render :action=>"edit_property"
    else
      redirect_to :controller=>"properties", :action=>"home"
    end

  end

end
