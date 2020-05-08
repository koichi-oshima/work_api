class ApplicationController < ActionController::API


  # 400 Bad Request
  def response_bad_request
    render status: 400, json: { status: 400, message: 'Bad Request' }
  end

  # 404 Not Found
  def response_not_found(class_name = 'subject')
    render status: 404, json: { status: 404, message: "#{class_name.capitalize} Not Found" }
  end

end
