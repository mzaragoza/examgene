class PagesController < PublicController
  expose(:plans){ Plan.active.order(:price) }
end
