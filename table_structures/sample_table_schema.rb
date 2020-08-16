class SampleTableSchema
  include TableStructure::Schema

  TableContext = Struct.new(:questions, :friend_num, :pet_num, keyword_init: true)

  context_builder :table do |context|
    TableContext.new(**context)
  end

  columns UserTableSchema

  columns do |table|
    table.friend_num.times.map do |i|
      UserTableSchema.new(
        context: table,
        name_prefix: "Friend #{i + 1} ",
        key_prefix: "friend_#{i + 1}_"
      ) do
        context_builder :row do |context|
          context.friend_users[i]
        end
      end
    end
  end

  columns do |table|
    if table.pet_num.positive?
      table.pet_num.times.map do |i|
        {
          name: "Pet #{i + 1}",
          key: :"pet#{i + 1}",
          value: ->(row, *) { row.pets[i]&.then { |pet| pet.creature.emoji } }
        }
      end
    end
  end

  columns do |table|
    table.questions.map.with_index do |question, i|
      {
        name: "Q#{i + 1} (#{question.text})",
        key: :"q#{i + 1}",
        value: ->(row, *) {
          row
            .answers
            .find { |answer| answer.question_id == question.id }
            .text
        }
      }
    end
  end
end
