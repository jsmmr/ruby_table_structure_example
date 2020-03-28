class UserTableSchema
  include TableStructure::Schema

  column  name: 'ID',
          key: :id,
          value: ->(row, *) { row&.id }

  column  name: 'Name',
          key: :name,
          value: ->(row, *) { row&.name }
end