require 'csv'

class UsersController < ApplicationController
  def index
    schema = UserSchema.new(context: { questions: Question.order(:id).all })
    users = User.includes(:answers, pets: :creature)

    respond_to do |format|
      format.csv do
        writer = TableStructure::Writer.new(schema)
        items = ->(y) { users.find_each { |user| y << user } }

        self.response.headers['Cache-Control'] = 'no-cache'
        self.response.headers['Content-Type'] = 'text/csv'
        self.response.headers['Content-Disposition'] = 'attachment; filename="users.csv"'
        self.response_body = Enumerator.new do |y|
          y << "\uFEFF" # Output BOM for Excel
          writer.write(items, to: CSV.new(y))
        end
      end
    end
  end
end
