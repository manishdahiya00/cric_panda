class EventController < ApplicationController

  def index
    @events = Event.all
  end
  def show
  end
  def new
  end
  def create
    if @event.save
      render plain: "creates",notice: "Event was successfully created."
    end
    render :new
  end
  def edit
  end
  def update
    if @event.update(event_params)
      render plain: "updated",notice: "Event was successfully updated."
    else
      render :edit
    end
  end
  def destroy
    @event.destroy!
    render plain: "deleted",notice: "Event was successfully destroyed."
  end
  private

  def event_params
    params.require(:event).permit(:event_title,:event_amount,:pay_type,:event_order)
  end
end