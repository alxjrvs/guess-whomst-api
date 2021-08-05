class PersonsController < ActionController::API
  def show
    render json: urls
  end

  private

  def urls
    Person.limit(24).order(Arel.sql('RANDOM()')).map do |person|
      person.avatar.service_url
    end
  end
end
