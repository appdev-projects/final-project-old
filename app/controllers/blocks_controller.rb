class BlocksController < ApplicationController
  def index
    @blocks = Block.all

    render("block_templates/index.html.erb")
  end

  def show
    @block = Block.find(params.fetch("id_to_display"))

    render("block_templates/show.html.erb")
  end

  def new_form
    render("block_templates/new_form.html.erb")
  end

  def create_row
    @block = Block.new

    @block.year = params.fetch("year")
    @block.number = params.fetch("number")
    @block.start_date = params.fetch("start_date")
    @block.end_date = params.fetch("end_date")

    if @block.valid?
      @block.save

      redirect_to("/blocks", :notice => "Block created successfully.")
    else
      render("block_templates/new_form.html.erb")
    end
  end

  def edit_form
    @block = Block.find(params.fetch("prefill_with_id"))

    render("block_templates/edit_form.html.erb")
  end

  def update_row
    @block = Block.find(params.fetch("id_to_modify"))

    @block.start_date = params.fetch("start_date")
    @block.end_date = params.fetch("end_date")

    if @block.valid?
      @block.save

      redirect_to("/blocks/#{@block.id}", :notice => "Block updated successfully.")
    else
      render("block_templates/edit_form.html.erb")
    end
  end

  def destroy_row
    @block = Block.find(params.fetch("id_to_remove"))

    @block.destroy

    redirect_to("/blocks", :notice => "Block deleted successfully.")
  end
end
