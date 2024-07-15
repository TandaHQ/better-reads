# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

alex = User.create(name: "Alex", email: "alex@tanda.co", password: "betterreads")
bri = User.create(name: "Brianna", email: "bri@tanda.co", password: "betterreads")

gastby = Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", description: "The Great Gatsby is a novel by American author F. Scott Fitzgerald. The story takes place in 1922, during the Roaring Twenties, a time of prosperity in the United States after World War I. The book received critical acclaim and is generally considered Fitzgerald's best work. It is also widely regarded as a 'Great American Novel' and a literary classic, capturing the essence of an era. The Modern Library named it the second best English-language novel of the 20th century.")
to_kill_a_mocking_bird = Book.create(title: "To Kill a Mockingbird", author: "Harper Lee", description: "To Kill a Mockingbird is a novel by Harper Lee published in 1960. Instantly successful, widely read in high schools and middle schools in the United States, it has become a classic of modern American literature, winning the Pulitzer Prize. The plot and characters are loosely based on Lee's observations of her family, her neighbors and an event that occurred near her hometown of Monroeville, Alabama, in 1936, when she was 10 years old.")
n84 = Book.create(title: "1984", author: "George Orwell", description: "Nineteen Eighty-Four: A Novel, often referred to as 1984, is a dystopian social science fiction novel by the English novelist George Orwell. It was published on 8 June 1949 by Secker & Warburg as Orwell's ninth and final book completed in his lifetime. Thematically, Nineteen Eighty-Four centres on the consequences of totalitarianism, mass surveillance, and repressive regimentation of persons and behaviours within society.")

Review.create!(user_id: alex.id, book_id: gastby.id, title: "Enjoyable read", rating: 4, content: "This is a great book! And an even better movie.")
Review.create!(user_id: bri.id, book_id: gastby.id, title: "Lacking depth", rating: 2, content: "Wasn't quite my thing - Gatsby didn't capture my imagination.")

puts "Successfully seeded the database"