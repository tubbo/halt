Halt::Engine.routes.draw do
  Halt::STATUS_CODES
    .select { |_code, id| id.in?(Rails.configuration.halt.errors) }
    .each do |code, id|
      match "/#{code}", to: 'errors#show', via: :all, as: id, id: id
    end
end
