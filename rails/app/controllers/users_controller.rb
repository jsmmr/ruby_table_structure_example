class UsersController < ApplicationController
  def index
    schema = SampleTableSchema.new(
      context: {
        questions: Question.order(:id).all,
        friend_num: (params[:friend_num] || 2).to_i,
        pet_num: (params[:pet_num] || 5).to_i
      },
      nil_definitions_ignored: true
    )

    header = ActiveModel::Type::Boolean.new.cast(params[:header].presence || true)

    items =
      User
      .includes(:friend_users, :answers, pets: :creature)
      .enum_for(:find_each)

    respond_to do |format|
      format.html do
        @schema = schema
        @header = header
        @items = items
      end
      format.csv do
        writer = TableStructure::CSV::Writer.new(schema, header: header)

        self.response.headers['Cache-Control'] = 'no-cache'
        self.response.headers['Content-Type'] = 'text/csv'
        self.response.headers['Content-Disposition'] = 'attachment; filename="users.csv"'
        self.response.headers['Last-Modified'] = Time.zone.now.ctime.to_s
        self.response_body = Enumerator.new { |y| writer.write(items, to: y, bom: true) } # Output BOM for Excel
      end
    end
  end
end
