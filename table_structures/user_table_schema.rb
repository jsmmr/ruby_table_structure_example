class UserTableSchema
  include TableStructure::Schema

  TableContext = Struct.new(:questions, :pet_num, keyword_init: true) do
    def output_pets?
      pet_num.positive?
    end
  end

  context_builder :table, ->(context) { TableContext.new(**context) }

  column  name: 'ID',
          key: :id,
          value: ->(row, *) { row.id }

  column  name: 'Name',
          key: :name,
          value: ->(row, *) { row.name }

  columns ->(table) {
    if table.output_pets?
      pets_range = 1..table.pet_num
      {
        name: pets_range.map { |num| "Pet #{num}" },
        key: pets_range.map { |num| :"pet#{num}" },
        value: ->(row, *) { row.pets.map { |pet| pet.creature.emoji } },
      }
    end
  }

  columns ->(table) {
    table.questions.map.with_index do |question, i|
      num = i + 1
      {
        name: "Q#{num} (#{question.text})",
        key: :"q#{num}",
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
