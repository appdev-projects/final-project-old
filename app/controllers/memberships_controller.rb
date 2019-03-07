class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all

    render("membership_templates/index.html.erb")
  end

  def show
    @membership = Membership.find(params.fetch("id_to_display"))

    render("membership_templates/show.html.erb")
  end

  def new_form
    @membership = Membership.new

    render("membership_templates/new_form.html.erb")
  end

  def create_row
    @membership = Membership.new

    @membership.user_id = params.fetch("user_id")
    @membership.cause_id = params.fetch("cause_id")

    if @membership.valid?
      @membership.save

      redirect_back(:fallback_location => "/memberships", :notice => "Membership created successfully.")
    else
      render("membership_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @membership = Membership.find(params.fetch("prefill_with_id"))

    render("membership_templates/edit_form.html.erb")
  end

  def update_row
    @membership = Membership.find(params.fetch("id_to_modify"))

    @membership.user_id = params.fetch("user_id")
    @membership.cause_id = params.fetch("cause_id")

    if @membership.valid?
      @membership.save

      redirect_to("/memberships/#{@membership.id}", :notice => "Membership updated successfully.")
    else
      render("membership_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @membership = Membership.find(params.fetch("id_to_remove"))

    @membership.destroy

    redirect_to("/memberships", :notice => "Membership deleted successfully.")
  end
end
