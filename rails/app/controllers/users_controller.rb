class UsersController < ApplicationController
  def index
    schema = UserTableSchema.new(
      context: {
        questions: Question.order(:id).all,
        pet_num: (params[:pet_num] || 5).to_i
      },
      nil_definitions_ignored: true
    )
    users = User.includes(:answers, pets: :creature)

    respond_to do |format|
      format.csv do
        writer = TableStructure::CSV::Writer.new(schema)
        # items = users.order(:id).all
        items = users.enum_for(:find_each)
        # items = Enumerator.new { |y| users.find_each { |user| y << user } }

        self.response.headers['Cache-Control'] = 'no-cache'
        self.response.headers['Content-Type'] = 'text/csv'
        self.response.headers['Content-Disposition'] = 'attachment; filename="users.csv"'
        self.response_body = Enumerator.new { |y| writer.write(items, to: y, bom: true) } # Output BOM for Excel
      end
    end
  end
end
