# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'pry'

Page.destroy_all
Chapter.destroy_all
Notebook.destroy_all


User.all.each do |user|
    notebook = Notebook.new
    notebook.user = user
    notebook.title = Faker::Book.title
    notebook.save
    10.times do
        chapter = Chapter.new
        chapter.notebook = notebook
        chapter.title = Faker::Marketing.buzzwords
        chapter.save
        counter = 1
        20.times do
            page = Page.new
            page.chapter = chapter
            page.number = counter, 
            page.content = Faker::Lorem.paragraph(sentence_count: 4)
            page.save
            counter += 1
        end
    end
end
# binding.pry









