# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'pry'

Notebook.destroy_all
Chapter.destroy_all
Page.destroy_all


User.all.each do |user|
    # notebook = Notebook.new()
    notebook = Notebook.create(title: Faker::Book.title)
    notebook.user = user
    10.times do
        chapters = Chapter.create(title: Faker::Marketing.buzzwords)
        chapters.notebook = notebook
        counter = 1
        20.times do
            page = Page.create(number: counter, content: Faker::Lorem.paragraph(sentence_count: 4))
            page.chapter = chapters
            counter = counter + 1
        end
    end
end

# Faker::Lorem.paragraph(sentence_count: 2) #=> "Ducimus mollitia deserunt. Dicta et corporis."








