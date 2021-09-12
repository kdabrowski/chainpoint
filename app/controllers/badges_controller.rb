class BadgesController < ApplicationController
  def success
    @badge = Badge.find(params[:id])
    render :success
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(permitted_params)
    if @badge.valid?
      additional_params = ::ChainpointClient.new(@badge).call
      hashes = additional_params.dig("hashes").first

      @badge.hash_id_node = hashes["proof_id"]
      @badge.return_hash = hashes["hash"]

      @badge.save
      redirect_to action: :success, id: @badge.id
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:badge).permit(:badge_issue_date, :recipient_name, :uuid)
  end
end
