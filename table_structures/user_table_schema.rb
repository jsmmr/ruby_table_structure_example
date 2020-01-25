class UserTableSchema
  include TableStructure::Schema

  TableContext = Struct.new(:questions, :pet_num, keyword_init: true) do
    def output_pets?
      pet_num.positive?
    end
  end

  context_builder :table, ->(context) { TableContext.new(**context) }

  column  name: 'ID',
          value: ->(row, *) { row.id }

  column  name: 'Name',
          value: ->(row, *) { row.name }

  columns ->(table) {
    if table.output_pets?
      {
        name: (1..table.pet_num).map { |num| "Pet #{num}" },
        value: ->(row, *) { row.pets.map { |pet| pet.creature.emoji } },
      }
    end
  }

  columns ->(table) {
    table.questions.map.with_index do |question, i|
      {
        name: "Q#{i + 1} (#{question.text})",
        value: ->(row, *) {
          row
            .answers
            .find { |answer| answer.question_id == question.id }
            .text
        }
      }
    end
  }

  column_converter :to_s, ->(val, *) { val.to_s }
end
