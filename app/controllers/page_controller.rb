class PageController < ApplicationController

  def index
    Time.zone = 'Europe/Minsk'
    @per_page = params[:limit] || 5
    @pages=Page.all.order(priority: :desc).where("published_at <= :start_date",
                                                 {start_date: Time.zone.now})
    .paginate(:page => params[:page], :per_page => @per_page)

    @not_published = Page.all.order(priority: :desc).where("published_at > :start_date",
                                                           {start_date: Time.zone.now})
  end


  def show
    @page = Page.find_by(slug: params[:id])
        if(@page.nil?)
          redirect_to root_path
        end
  end

  def edit
    @page = Page.find_by(slug: params[:id])
    if(@page.nil?)
      redirect_to root_path
    end
  end


  def create
    req = params[:page]
    if(!req[:published_at_date].empty? && !req[:published_at_hour].empty?)
      date = Date.strptime(req[:published_at_date])
      time = Time.parse(req[:published_at_hour])

      t = date.year.to_s + "." + date.month.to_s + "." + date.day.to_s + " " + time.hour.to_s +
      ":" + time.min.to_s + ":" + time.sec.to_s

      Time.zone = 'Europe/Minsk'
      newdate = Time.zone.parse(t)

    end

    @page = Page.new(
        title: req[:title],
        description: req[:description],
        slug: req[:slug],
        h1: req[:h1],
        content: req[:content],
        published_at: newdate,
        priority: req[:priority]
    )
    if @page.save()
      redirect_to page_show_path(@page[:slug])
    else
      flash.now[:error] = @page.errors.full_messages
      render :action => 'new'
    end
  end


  def update
    req = params[:page]
    @page = Page.find(params[:id])
    if(!req[:published_at_date].empty? && !req[:published_at_hour].empty?)
      date = Date.strptime(req[:published_at_date])
      time = Time.parse(req[:published_at_hour])
      t = date.year.to_s + "." + date.month.to_s + "." + date.day.to_s + " " + time.hour.to_s +
         ":" + time.min.to_s + ":" + time.sec.to_s
      p (t)
    Time.zone = 'Europe/Minsk'
    newdate = Time.zone.parse(t)
    end

    if @page.update(
        title: req[:title],
        description: req[:description],
        slug: req[:slug],
        h1: req[:h1],
        content: req[:content],
        published_at: newdate,
        priority: req[:priority]
    )
      redirect_to @page
    else
      render 'edit'
    end
  end


  def destroy
    @page = Page.find_by(id: params[:id])
    if(@page.nil?)
      redirect_to root_path
    else
      @page.destroy
    end
    redirect_to root_path

  end
end
