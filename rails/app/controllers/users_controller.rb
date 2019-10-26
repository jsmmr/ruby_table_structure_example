class UsersController < ApplicationController
  def index
    schema = UserTableSchema.new(context: { questions: Question.order(:id).all })
    users = User.includes(:answers, pets: :creature)

    respond_to do |format|
      format.csv do
        writer = TableStructure::CSV::Writer.new(schema)
        # items = users.order(:id).all
        items = Enumerator.new { |y| users.find_each { |user| y << user } }

        self.response.headers['Cache-Control'] = 'no-cache'
        self.response.headers['Content-Type'] = 'text/csv'
        self.response.headers['Content-Disposition'] = 'attachment; filename="users.csv"'
        self.response_body = Enumerator.new { |y| writer.write(items, to: y, bom: true) } # Output BOM for Excel
      end
    end
  end
end
