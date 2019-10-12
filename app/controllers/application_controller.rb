class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def serialize_resource(resources, serializer, root=nil)
    opts = { each_serializer: serializer, root: root }
    ActiveModelSerializers::SerializableResource.new(resources, opts) if resources
  end
end
