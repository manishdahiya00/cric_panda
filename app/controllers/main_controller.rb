class MainController < ApplicationController
  require 'rest-client'
  def index
    @app_offers = AppOffer.all.where(status: true).order("id DESC")
    session[:referral_code] ||= SecureRandom.hex(4)
    @app_banners = AppBanner.all.where(status: true)
  end
  
  def postback
    @referrer = Referrer.find_by(click_id:params[:click_id])
    @postback = Postback.find_by(paytm_number:params[:paytm_number])
    if !@postback.present?
      puts "Postback Not Found"
      Postback.create(click_id:params[:click_id],referrer_id:@referrer.id,paytm_number:params[:paytm_number],upi_id:params[:upi_id])
    end
    if @referrer.present?
      puts "Referrer Present"
      @app_offer = AppOffer.find(@referrer.app_offer_id)
      if @app_offer.status == true
      puts "App Offer Status True"
        if @app_offer.event_offer == true
      puts "Event Offer Status True"
          @event_title = params[:event_title]
          @event = Event.find_by(event_title:@event_title)
          puts @event
          if @event
            puts "Event Found"
            @event_postback = EventPostback.find_by(event_id:@event.id,event_title:@event.event_title,click_id:params[:click_id])
            if @event_postback.present?
              puts "Event Postback Present"
              puts "Created Duplicate"
              EventPostback.create(referrer_id:@referrer.id,click_id:params[:click_id],event_title:params[:event_title],app_offer_id:@app_offer.id,source_ip:request.remote_ip,duplicate:true,event_id:@event.id,event_amount:@event.event_amount)
            else
              puts "Event Postback Not Found"
              EventPostback.create(referrer_id:@referrer.id,click_id:params[:click_id],event_title:params[:event_title],app_offer_id:@app_offer.id,source_ip:request.remote_ip,duplicate:false,event_id:@event.id,event_amount:@event.event_amount)
              @event_status = false
              @current_event = @event
              if @current_event.event_order == 1
                puts "Event Order 1"
                @event_status = true
              else
                app_offer = AppOffer.find(@referrer.app_offer_id)
                last_events = app_offer.events.where("event_order < ?",@current_event.event_order)
                last_events.each do |last_event|
                  is_event_done = EventPostback.where("referrer_id = ? AND event_id = ?",@referrer.id,last_event.id,true).last
                  if is_event_done
                    puts "Last Event Done"
                    @event_status = true
                  else
                    puts "Last Event Not Done"
                    @event_status = false
                  end
                end
                if @event_status
                  if @event.pay_type == "auto"
                    puts "Event Status Auto"
                    if @event.event_amount > 1
                      # payment
                    else
                      @event_postback.update(paid:true)
                      @referrer.update(ref_status:true)
                    end
                  end
                end
              end
            end
          else
            puts "Event Not Found"
            @new_event_postback = EventPostback.new(referrer_id:@referrer.id,click_id:params[:click_id],event_title:"U - #{params[:event_title]}",app_offer_id:@app_offer.id,source_ip:request.remote_ip,duplicate:true,event_amount:0)
            if @new_event_postback.save
            puts "New Event Postback Created"
            else
            puts "New Event Postback Not Created"
            puts @new_event_postback.errors.full_messages
            end
          end
        end
      end
    else
      puts "Referrer Not Found"
      @paid_user = Referrer.where("paytm_number = ? AND app_offer_id = ? AND ref_status = ?",params[:paytm_number],@app_offer_id,true)
      if !@paid_user.present?
        puts "Paid User Not Found"
        if @app_offer
          if @app_offer.payout_amount > 1
          puts "App Offer Amount > 1"
          # payment
        end
        end
      end
    end
  end

  def offer
    @app_offer = AppOffer.find(params[:app_offer_id])
    @referral_code = session[:referral_code]
  end
  def refer
    @referral_code = session[:referral_code]
    @app_offer = AppOffer.find(params[:app_offer_id])
    @offer_name = @app_offer.offer_name
  end
  def referral
    click_id = SecureRandom.hex(18)
    @app_offer = AppOffer.find_by(offer_name: params[:camp]) 
  end
  def profile
    @user_id = session[:user_id]
    @user = RefUser.find_by(id:@user_id)
    @redeems = AppRedeem.all.where(ref_user_id:@user_id)
  end
  def logout
    session[:user_id] = ""
    redirect_to profile_path
  end
end

def referrer_params
  params.require(:referrer).permit(:app_offer_id, :paytm_number, :upi_id, :submit_button)
end