class VacReqsController < ApplicationController
  def index
    if current_user.seniority == "Chief"
      @vac_reqs_chief = VacReq.where(user_id: current_user.id).order('approval DESC')
      @vac_reqs = VacReq.where.not(user_id: current_user.id).order('approval DESC')
    else 
      @vac_reqs = VacReq.where(user_id: current_user.id).order('approval DESC')
    end
    render("vac_req_templates/index.html.erb")
  end

  def show
    @vac_req = VacReq.find(params.fetch("id_to_display"))

    render("vac_req_templates/show.html.erb")
  end

  def new_form
    render("vac_req_templates/new_form.html.erb")
  end

  def create_row
    @vac_req = VacReq.new

    @vac_req.user_id = params.fetch("user_id")
    @vac_req.start_date = params.fetch("start_date")
    @vac_req.end_date = params.fetch("end_date")
    @vac_req.approval = params.fetch("approval")

    if @vac_req.valid?
      @vac_req.save

      redirect_to("/vac_reqs", :notice => "Vac req created successfully.")
    else
      render("vac_req_templates/new_form.html.erb")
    end
  end

  def edit_form
    @vac_req = VacReq.find(params.fetch("prefill_with_id"))

    render("vac_req_templates/edit_form.html.erb")
  end

  def approve_req
    @vac_req = VacReq.find(params.fetch("id_to_modify"))
    @vac_req.approval = params.fetch("approval")

    if @vac_req.valid?
      @vac_req.save
      redirect_to("/vac_reqs/#{@vac_req.id}", :notice => "Vacation request approved.")
    else
      render("vac_req_templates/edit_form.html.erb")
    end
  end
  
  def deny_req
    @vac_req = VacReq.find(params.fetch("id_to_modify"))
    @vac_req.approval = params.fetch("approval")

    if @vac_req.valid?
      @vac_req.save
      redirect_to("/vac_reqs/#{@vac_req.id}", :notice => "Vacation request denied.")
    else
      render("vac_req_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @vac_req = VacReq.find(params.fetch("id_to_remove"))

    @vac_req.destroy

    redirect_to("/vac_reqs", :notice => "Vacation request deleted successfully.")
  end
end
