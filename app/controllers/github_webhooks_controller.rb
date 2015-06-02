class GithubWebhooksController < ActionController::Base
  include GithubWebhook::Processor

  def push(payload)
    respond_to do |format|
      format.json { render json: "OK"}
      format.html
    end
  end

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
