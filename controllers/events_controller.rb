class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_current_member
  before_action :set_event2, only: [:destroy]
  #after_action :new, only: [:destroy]
  
  # GET /events
  # GET /events.json
  def index
    if  !params[:commit].present? 
    @Member_id = Member.where(membername: Member.current).pluck(:id)[0].to_i
    @Applysection_id = Member.where(id: @Member_id).pluck(:Applysection_id)[0].to_i
    @PjMaster_id = 2
    #flash.now[:notice] = "1"
    end
     
    if params[:Member_id].present? 
    @Member_id =params[:Member_id].to_i    
    #flash.now[:notice] = "#{@Member_id}o"
    end
    
    if params[:Applysection_id].present?     
    @Applysection_id = params[:Applysection_id].to_i
    #flash.now[:notice] = "#{@Applysection_id}p"
    end
    
    if params[:PjMaster_id].present? #&& params[:commit].present? && params[:commit]== "抽　出"    
    @PjMaster_id = params[:PjMaster_id].to_i
    #flash.now[:notice] = "#{@PjMaster_id}q"
    end
    
    if params[:commit].present? && params[:commit]== "クリア"
    @Member_id =22
    @Applysection_id = 1
    @PjMaster_id = 2
    #flash.now[:notice] = "51"
    end
    
    
    if @Applysection_id.to_i !=1
    @events =Event.includes(:Member).where(members: { Applysection_id:@Applysection_id })
    #flash.now[:notice] = "6"
    else
    @events = Event.all
    #flash.now[:notice] = "7"
    end
    
    if @Member_id.to_i !=22
    @events = @events.where(Member_id:@Member_id)
    #flash.now[:notice] = "8"
    end
    
    if @PjMaster_id == 2 || @PjMaster_id.nil?
    #flash.now[:notice] = "10"
    else
    @events = @events.where(PjMaster_id:@PjMaster_id)
    #flash.now[:notice] = "#{@PjMaster_id}"
    end
    
    @@Member_id =@Member_id  
    @@Applysection_id = @Applysection_id 
    @@PjMaster_id = @PjMaster_id
    #SelectBox
      #@books=Book.select(:publish,:id).distinct
      #@field=Field.where(book_id:1)
      #@Members =Member.where(Applysection_id:@Applysection_id )
      #flash.now[:notice] = "5"
    end
  
  def result
      @Applysection=Applysection.where(id:params[:Applysection_id].to_i)
      @Members=Member.where(Applysection_id:params[:Applysection_id].to_i)
  end


  # GET /events/1
  # GET /events/1.json
  def show
    @Applysection_id = params[:Applysection_id].to_i
    @Member_id = params[:Member_id].to_i
    @PjMaster_id = params[:PjMaster_id].to_i
    @members = Member.all
    @Applysection = Applysection.all
    @eventsall = Event.all
  end

  # GET /events/new
  def new
    if params[:start_time].present?
    @day = params[:start_time]
    
    @y = @day[0..3]
    @M = @day[5..6]
    @d = @day[8..9]
    @h =Time.now.hour
    @m =Time.now.min
    @s = Time.now.sec
    require "date"
    @day = Time.new(@y.to_i, @M.to_i, @d.to_i, @h, @m, @sec)
    @eday = Time.new(@y.to_i, @M.to_i, @d.to_i, @h+1, @m, @sec)
    #flash.now[:notice] = "ようこそ。本日は#{@M}です。"
    end
    #---------------------------------------------------------------------------------------------------->
    @Applysection_id = params[:Applysection_id].to_i
    @Member_id = params[:Member_id].to_i
    @PjMaster_id = params[:PjMaster_id].to_i
    @members = Member.all
    @Applysection = Applysection.all
    @eventsall = Event.all
    
    #@@Member_id =@Member_id  
    #@@Applysection_id = @Applysection_id 
    #@@PjMaster_id = @PjMaster_id
    #---------------------------------------------------------------------------------------------------->
    
    
    if @@Member_id== 22 && @@Applysection_id==1 && @@PjMaster_id != 2
    @eventsall = @eventsall.where(PjMaster_id:@@PjMaster_id)
    #flash.now[:notice] = "ようこ"
    end
        
    if @@Member_id== 22 && @@Applysection_id==1 && @@PjMaster_id == 2
    @eventsall = @eventsall
    end
    
    if @@Member_id == 22 && @@Applysection_id!=1 && @@PjMaster_id == 2
    @eventsall = Event.includes(:Member).where(members: { Applysection_id:@@Applysection_id })
    @members = @members.where(Applysection_id:@Applysection_id)
    @Applysection = @Applysection.where(id:@Applysection_id)
    end
    
    if @@Member_id == 22 && @@Applysection_id!=1 && @@PjMaster_id != 2
    @eventsall = Event.includes(:Member).where(members: { Applysection_id:@@Applysection_id })
    @eventsall = @eventsall.where(PjMaster_id:@@PjMaster_id)
    @members = @members.where(Applysection_id:@@Applysection_id)
    @Applysection = @Applysection.where(id:@@Applysection_id)
    end
    
    
    if @@Member_id != 22 && @@Applysection_id==1 && @@PjMaster_id == 2
    @eventsall = @eventsall.where(Member_id:@@Member_id)
    @Applysection_id = Member.where(id:@@Member_id).pluck(:Applysection_id)[0]
    end
    
    if @@Member_id != 22 && @@Applysection_id==1 && @@PjMaster_id != 2
    @eventsall = @eventsall.where(Member_id:@@Member_id)
    @eventsall =@eventsall.where(PjMaster_id:@@PjMaster_id)
    @Applysection_id = Member.where(id:@@Member_id).pluck(:Applysection_id)[0]
    end
    
    if @@Member_id != 22 && @@Applysection_id!=1 && @@PjMaster_id == 2
    @eventsall = Event.includes(:Member).where(members: { Applysection_id:@@Applysection_id })
    @eventsall = @eventsall.where(Member_id:@@Member_id)
    @members = @members.where(Applysection_id:@@Applysection_id)
    @Applysection = @Applysection.where(id:@@Applysection_id)
    end
    
     if @@Member_id != 22 && @@Applysection_id!=1 && @@PjMaster_id != 2
     @eventsall = Event.includes(:Member).where(members: {Applysection_id:@@Applysection_id })
     @eventsall = @eventsall.where(Member_id:@@Member_id,PjMaster_id:@@PjMaster_id)   
     @members = @members.where(Applysection_id:@@Applysection_id)
     @Applysection = @Applysection.where(id:@@Applysection_id)
    end
    
    @event = Event.new(:start_time =>@day, :end_time => @eday, :kosu => 1, :Member_id => @Member_id,:PjMaster_id => @PjMaster_id) 
    
    if params[:start_time].present? 
    @@day =  params[:start_date]
    #flash.now[:notice] = "1#{@@day}"
    
    elsif !@@day.nil?
    #flash.now[:notice] = "2#{@@day}"
    else
    @@day =  Time.now()
     #flash.now[:notice] = "3#{@@day}"
    end
  end

  # GET /events/1/edit
  def edit
  
  
   @eventsall = Event.all
   @Applysection = Applysection.all
   #---------------------------------------------------------------------------------------------------->
    if !params[:Members_id].present? && params[:id].present?
    @Member_id = Event.where(id: params[:id]).pluck(:Member_id)[0]
    @Applysection_id = Member.where(id:@Member_id).pluck(:Applysection_id)[0]
    @PjMaster_id = Event.where(id: params[:id]).pluck(:PjMaster_id)[0]
    #flash.now[:notice] = "k"
    else
     #flash.now[:notice] = "y"
    @Applysection_id = params[:Applysection_id].to_i
    @Member_id = params[:Member_id].to_i
    @PjMaster_id = params[:PjMaster_id].to_i
    
    
    #@@Member_id =@Member_id  
    #@@Applysection_id = @Applysection_id 
    #@@PjMaster_id = @PjMaster_id
    end
    #---------------------------------------------------------------------------------------------------->
    
    if @@Member_id== 22 && @@Applysection_id==1 && @@PjMaster_id != 2
    @eventsall = @eventsall.where(PjMaster_id:@@PjMaster_id)
    #flash.now[:notice] = "ようこ"
    end
        
    if @@Member_id== 22 && @@Applysection_id==1 && @@PjMaster_id == 2
    @eventsall = @eventsall
    end
    
    if @@Member_id == 22 && @@Applysection_id!=1 && @@PjMaster_id == 2
    @eventsall = Event.includes(:Member).where(members: { Applysection_id:@@Applysection_id })
    @members = @members.where(Applysection_id:@Applysection_id)
    @Applysection = @Applysection.where(id:@Applysection_id)
    end
    
    if @@Member_id == 22 && @@Applysection_id!=1 && @@PjMaster_id != 2
    @eventsall = Event.includes(:Member).where(members: { Applysection_id:@@Applysection_id })
    @eventsall = @eventsall.where(PjMaster_id:@@PjMaster_id)
    @members = @members.where(Applysection_id:@@Applysection_id)
    @Applysection = @Applysection.where(id:@@Applysection_id)
    end
    
    
    if @@Member_id != 22 && @@Applysection_id==1 && @@PjMaster_id == 2
    @eventsall = @eventsall.where(Member_id:@@Member_id)
    @Applysection_id = Member.where(id:@@Member_id).pluck(:Applysection_id)[0]
    end
    
    if @@Member_id != 22 && @@Applysection_id==1 && @@PjMaster_id != 2
    @eventsall = @eventsall.where(Member_id:@@Member_id)
    @eventsall =@eventsall.where(PjMaster_id:@@PjMaster_id)
    @Applysection_id = Member.where(id:@@Member_id).pluck(:Applysection_id)[0]
    end
    
    if @@Member_id != 22 && @@Applysection_id!=1 && @@PjMaster_id == 2
    @eventsall = Event.includes(:Member).where(members: { Applysection_id:@@Applysection_id })
    @eventsall = @eventsall.where(Member_id:@@Member_id)
    @members = @members.where(Applysection_id:@@Applysection_id)
    @Applysection = @Applysection.where(id:@@Applysection_id)
    end
    
     if @@Member_id != 22 && @@Applysection_id!=1 && @@PjMaster_id != 2
     @eventsall = Event.includes(:Member).where(members: {Applysection_id:@@Applysection_id })
     @eventsall = @eventsall.where(Member_id:@@Member_id,PjMaster_id:@@PjMaster_id)   
     @members = @members.where(Applysection_id:@@Applysection_id)
     @Applysection = @Applysection.where(id:@@Applysection_id)
    end
    
    #params[:start_date] = @@day
    #flash.now[:notice] = "edit#{@@day}"    
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
  flash.now[:notice] = "create#{@@day}"
    respond_to do |format|
      if @event.save
        format.html {redirect_to edit_event_path(@event,:Member_id =>@Member_id,:PjMaster_id =>@PjMaster_id, :Applysection_id =>@Applysection_id,:start_date => @@day), notice:'登録しました。' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
  #flash.now[:notice] = "update#{@@day}"
    respond_to do |format|
      if @event.update(event_params)
        format.html {redirect_to edit_event_path(@event,:Member_id =>@Member_id,:PjMaster_id =>@PjMaster_id, :Applysection_id =>@Applysection_id,:start_date => @@day), notice:'更新しました。'}
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

   # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    
    #@event = Event.new(:kosu => 1, :Member_id => @Member_id,:PjMaster_id => @PjMaster_id,:start_date => @@day)      
    @day = Time.now  
    @Member_id = @@Member_id 
    @PjMaster_id = @@PjMaster_id
    @Applysection_id= @@Applysection_id
    respond_to do |format|
      if @event.save
        
        format.html {redirect_to new_event_path(:start_time => @day,:Member_id =>@Member_id,:PjMaster_id =>@PjMaster_id, :Applysection_id =>@Applysection_id,:start_date => @@day), notice:'削除しました。' }
        
        #format.html { render :new }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event2
      #@Member_id = params[:Member_id]  
      #@PjMaster_id = params[:PjMaster_id]
      #@Applysection_id= params[:Applysection_id]
      @eventsall = Event.all.where(Member_id:@Member_id)      
    end
    def set_event
      @event = Event.find(params[:id])     
      @day = Time.now() 
         
      @members = Member.all  
      @eventall = Event.all
      @Applysection = Applysection.all
      #flash.now[:notice] = "ようこそ。本日は#{@Member_id}yo"
      
      
      @@day =  Event.where(id: params[:id]).pluck(:start_time)[0]
      #flash.now[:notice] = "R#{@@day}"
      @start_date =@@day 
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time,:loginname ,:kosu,:PjMaster_id, :Fsesagyo_id, :Member_id)
    end
    
    def set_current_member
      if member_signed_in?
      Member.current = current_member.membername
      end
      
    end
    def search_events
     #flash.now[:notice] = "ようこそ。本日は"	
     #@events = Event.find(params[:Applysection_id])
     @events = Event.includes(:Member).where(members: { Applysection_id:params[:Applysection_id] })
     #@members = Member.where(id:params[:Applysection_id].to_id)
     @Member_id = params[:Member_id].to_i
     #@@day = params[:date]
     render layout: false	
    
    end


    
end
