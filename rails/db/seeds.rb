# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { emoji: '🐀', name: 'Rat' },
  { emoji: '🐁', name: 'Mouse' },
  { emoji: '🐂', name: 'Ox' },
  { emoji: '🐃', name: 'Water Buffalo' },
  { emoji: '🐄', name: 'Cow' },
  { emoji: '🐅', name: 'Tiger' },
  { emoji: '🐆', name: 'Leopard' },
  { emoji: '🐇', name: 'Rabbit' },
  { emoji: '🐈', name: 'Cat' },
  { emoji: '🐉', name: 'Dragon' },
  { emoji: '🐊', name: 'Crocodile' },
  { emoji: '🐋', name: 'Whale' },
  { emoji: '🐌', name: 'Snail' },
  { emoji: '🐍', name: 'Snake' },
  { emoji: '🐎', name: 'Horse' },
  { emoji: '🐏', name: 'Ram' },
  { emoji: '🐐', name: 'Goat' },
  { emoji: '🐑', name: 'Sheep' },
  { emoji: '🐒', name: 'Monkey' },
  { emoji: '🐓', name: 'Rooster' },
  { emoji: '🐔', name: 'Chicken' },
  { emoji: '🐕', name: 'Dog' },
  { emoji: '🐖', name: 'Pig' },
  { emoji: '🐗', name: 'Boar' },
  { emoji: '🐘', name: 'Elephant' },
  { emoji: '🐙', name: 'Octopus' },
  { emoji: '🐚', name: 'Spiral Shell' },
  { emoji: '🐛', name: 'Bug' },
  { emoji: '🐜', name: 'Ant' },
  { emoji: '🐝', name: 'Honeybee' },
  { emoji: '🐞', name: 'Lady Beetle' },
  { emoji: '🐟', name: 'Fish' },
  { emoji: '🐠', name: 'Tropical Fish' },
  { emoji: '🐡', name: 'Blowfish' },
  { emoji: '🐢', name: 'Turtle' },
  { emoji: '🐣', name: 'Hatching Chick' },
  { emoji: '🐤', name: 'Baby Chick' },
  { emoji: '🐥', name: 'Front-Facing Baby Chick' },
  { emoji: '🐦', name: 'Bird' },
  { emoji: '🐧', name: 'Penguin' },
  { emoji: '🐨', name: 'Koala' },
  { emoji: '🐩', name: 'Poodle' },
  { emoji: '🐪', name: 'Dromedary Camel' },
  { emoji: '🐫', name: 'Bactrian Camel' },
  { emoji: '🐬', name: 'Dolphin' },
]
  .each do |creature|
    Creature.find_or_create_by!(creature)
  end

[
  { text: 'Do you like sushi?' },
  { text: 'Do you like yakiniku?' },
  { text: 'Do you like ramen?' },
  { text: 'Do you like curry?' },
  { text: 'Do you like hamburger?' }
]
  .each do |question|
    Question.find_or_create_by!(question)
  end

questions = Question.all
creatures = Creature.all
answer_texts = ['⭕️', '❌']

created_at = Time.zone.now
updated_at = Time.zone.now

1000.times do
  User.transaction do
    user = User.create!(name: Faker::Name.name)

    answers = questions.map do |question|
      {
        user_id: user.id,
        question_id: question.id,
        text: answer_texts.sample,
        created_at: created_at,
        updated_at: updated_at
      }
    end
    Answer.insert_all!(answers)

    pets = creatures.sample(rand(0..10)).map do |creature|
      {
        user_id: user.id,
        creature_id: creature.id,
        name: Faker::FunnyName.name,
        created_at: created_at,
        updated_at: updated_at
      }
    end
    Pet.insert_all!(pets) if pets.present?
  end
end
