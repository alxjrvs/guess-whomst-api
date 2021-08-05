class PersonsController < ActionController::API
  def show
    redirect_to twenty_four_souls[0].avatar.service_url
  end

  def index
    render json: payload
  end

  private

  def payload
    JSON.generate({
      red: chosen[0],
      blue: chosen[1],
      souls: souls
    })
  end

  def chosen
    @chosen ||= souls.sample(2)
  end

  def souls
    @souls ||= twenty_four_souls.map do |person|
      person.avatar.service_url
    end
  end

  def twenty_four_souls
    @twenty_four_souls ||= Person.limit(24).order(Arel.sql('RANDOM()'))
  end
end
