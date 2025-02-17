# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Supprimer toutes les instances des modèles spécifiés
puts "Deleting all instances of User, TrainingPlan, UserSkill, Completion, and Resource..."
Resource.destroy_all
Completion.destroy_all
TrainingPlan.destroy_all
UserSkill.destroy_all
User.destroy_all
puts "All instances deleted."

FORMAT_CHOICES = ["Vidéo", "Exercices", "Formation"]

# Créer toutes les skills en fonction de la constante SKILL_LIST
SKILL_LIST.each do |_, data|
  skill = Skill.find_or_create_by(name: data[:name]) do |s|
    s.wagon_level = data[:wagon_level]
    # s.image_url = "app/assets/images/#{data[:name]}.png"
  end

  # Update image_url even if skill already exists
  skill.update(image_url: "/assets/images/#{data[:name]}.png")

  begin
    # Verify file exists in assets
    image_path = Rails.root.join('app', 'assets', 'images', "#{data[:name].downcase.gsub(' ', '_')}.png")
    unless File.exist?(image_path)
      puts "Warning: Image not found for #{skill.name} at #{image_path}"
    end
  rescue => e
    puts "Error setting image for #{skill.name}: #{e.message}"
  end

  puts "Created/updated skill: #{skill.name} with image: #{skill.image_url}"
end


# # Créer des ressources pour différents niveaux de difficulté
# Skill.all.each do |skill|
#   10.times do |i|
#     difficulty = FRAME_LEVEL.values.sample[:difficulty]
#     format = FORMAT_CHOICES.sample
#     resource = Resource.create(
#       skill: skill,
#       difficulty: difficulty,
#       format: format,
#       name: "Resource #{i + 1} for #{skill.name} - #{difficulty}"
#     )
#     puts "Created resource: #{resource.name} with difficulty: #{resource.difficulty} and format: #{resource.format}"
#   end
# end
html_image = "app/assets/images/HTML/CSS.png"
js_image = "app/assets/images/Javascript.png"
ruby_image = "app/assets/images/Ruby.png"
typescript_image = "app/assets/images/TypeScript.png"
python_image = "app/assets/images/Python.png"
sql_image = "app/assets/images/Database.png"

Resource.create!(
  name: "Learn HTML – Full Tutorial",
  content: "Learn HTML in this complete course for beginners. This is an all-in-one beginner tutorial to help you learn web development skills. This course teaches HTML5. Choose the chapter according to your level.",
  image_url: html_image,
  price: 0,
  difficulty:  "Intermédiaire",
  resource_url: "https://www.youtube.com/watch?v=kUMe1FH4CHE",
  skill_id: Skill.where(name: "HTML/CSS").first.id,
  format: "Vidéo"
)

Resource.create!(
  name: "Learn JavaScript - Full Course",
  content: "This complete 134-part JavaScript tutorial for beginners will teach you everything you need to know to get started with the JavaScript programming language. Choose the chapter according to your level.",
  image_url: js_image,
  price: 0,
  difficulty: "Intermédiaire",
  resource_url: "https://www.youtube.com/watch?v=PkZNo7MFNFg",
  skill_id: Skill.where(name: "JavaScript").first.id,
  format: "Vidéo"
)
Resource.create!(
  name: "100+ JavaScript Concepts you Need to Know",
  content: "The ultimate 10 minute JavaScript course that quickly breaks down over 100 key concepts every web developer should know.",
  image_url: js_image,
  price: 0,
  difficulty: "Intermédiaire",
  resource_url: "https://www.youtube.com/watch?v=lkIFF4maKMU",
  skill_id: Skill.where(name: "JavaScript").first.id,
  format: "Vidéo"
)


Resource.create!(
  name: "Back End Developer Roadmap",
  content: "Learn what technologies you should learn first to become a back end web developer.",
  image_url: ruby_image,
  price: 0,
  difficulty: "Intermédiaire",
  resource_url: "https://www.youtube.com/watch?v=tN6oJu2DqCM",
  skill_id: Skill.where(name: "Ruby").first.id,
  format: "Vidéo"
)

Resource.create!(
  name:"Learn TypeScript – Full Tutorial",
  content: "Learn how to program with TypeScript in this full course. TypeScript is a typed superset of JavaScript that compiles to plain JavaScript. TypeScript provides better error checking than JavaScript. This is because TypeScript uses a static type system, which means that the type of a variable is checked before the code is executed.",
  image_url: typescript_image,
  price: 0,
  difficulty:   "Débutant",
  resource_url:"https://www.youtube.com/watch?v=30LWjhZzg50",
  skill_id: Skill.where(name: "TypeScript").first.id,
  format: "Vidéo"
)
Resource.create!(
  name: "Data Analysis with Python",
  content: "Data Analysis with Python: Zero to Pandas” is a practical, beginner-friendly, and coding-focused introduction to data analysis covering the basics of Python, Numpy, Pandas, data visualization and exploratory data analysis. Choose the chapter according to your level.",
  image_url: python_image,
  price: 0,
  difficulty: "Débutant",
  resource_url: "https://www.youtube.com/watch?v=EsDFiZPljYo",
  skill_id: Skill.where(name: "Python").first.id,
  format: "Vidéo"
)

Resource.create!(
  name: "Advanced Python Course For 2023 With Python Projects",
  content: "In this power-packed series, we'll equip you with the tools and knowledge to take your Python skills from competent to extraordinary. Whether you're an aspiring developer or a seasoned coder, this course is designed to elevate your coding prowess and explore Python's most advanced concepts.",
  image_url: python_image,
  price: 0,
  difficulty: "Professionnel",
  resource_url: "https://www.youtube.com/watch?v=jKihGsmhYsc",
  skill_id: Skill.where(name: "Python").first.id,
  format: "Vidéo"
)
Resource.create!(
  name: "SQL Tutorial - Full Database Course",
  content: "In this course, we'll be looking at database management basics and SQL using the MySQL RDBMS. Choose the chapter according to your level.",
  image_url: sql_image,
  price: 0,
  difficulty: "Intermédiaire",
  resource_url:"https://www.youtube.com/watch?v=HXV3zeQKqGY",
  skill_id: Skill.where(name: "Database").first.id,
  format: "Vidéo"
)

html_exercices_urls = [
  "https://www.frontendmentor.io/challenges?difficulty=2",
  "https://www.frontendmentor.io/challenges?difficulty=3",
  "https://www.frontendmentor.io/challenges?difficulty=4",
  "https://cssbattle.dev/",
  "https://www.frontendpractice.com/projects"
]
html_exercices_difficulty = [
  "Débutant",
  "Intermédiaire",
  "Professionnel",
  "Intermédiaire",
  "Intermédiaire"
]
html_exercices_content = [
  "Frontend Mentor challenges allow you to improve your coding skills by building realistic projects. These challenges are perfect for beginners and advanced developers.",
  "Frontend Mentor challenges allow you to improve your coding skills by building realistic projects. These challenges are perfect for beginners and advanced developers.",
  "Frontend Mentor challenges allow you to improve your coding skills by building realistic projects. These challenges are perfect for beginners and advanced developers.",
  "CSS Battle is a fun way to improve your CSS skills. You can compete with other developers and improve your CSS skills.",
  "Frontend Practice is a website that provides you with projects to practice your frontend skills. You can choose from a variety of projects and improve your skills."
]
html_exercices_name = [
  "Frontend Mentor",
  "Frontend Mentor",
  "Frontend Mentor",
  "CSS Battle",
  "Frontend Practice"
]
5.times do |i|
  Resource.create!(
    name: html_exercices_name[i],
    content: html_exercices_content[i],
    image_url: html_image,
    price: 0,
    difficulty: html_exercices_difficulty[i],
    resource_url: html_exercices_urls[i],
    skill_id: Skill.where(name: "HTML/CSS").first.id,
    format: "Exercice"
  )
end

html_formation_urls = [
  "https://www.udemy.com/course/modern-html-css-from-the-beginning/",
  "https://www.udemy.com/course/advanced-css-and-sass/",
  "https://www.freecodecamp.org/learn/front-end-development-libraries/"
]
html_formation_difficulty = [
  "Débutant",
  "Intermédiaire",
  "Intermédiaire"
]
html_formation_name = [
  "Modern HTML & CSS From The Beginning",
  "Advanced CSS and Sass: Flexbox, Grid, Animations and More!",
  "Front End Development Libraries Certification"
]

html_formation_price = [
  19.99,
  24.99,
  0
]
html_formation_content = [
  "Build modern responsive websites with HTML and CSS - Learning modules, mini-projects and 3 full websites",
  "The most advanced and modern CSS course on the internet: master flexbox, CSS Grid, responsive design, and so much more.",
  "In the Front End Development Libraries Certification, you'll learn how to style your site quickly with Bootstrap. You'll also learn how to add logic to your CSS styles and extend them with Sass. Later, you'll build a shopping cart and other applications to learn how to create powerful Single Page Applications (SPAs) with React and Redux."
]
3.times do |i|
  Resource.create!(
    name: html_formation_name[i],
    content: html_formation_content[i],
    image_url: html_image,
    price: html_formation_price[i],
    difficulty: html_formation_difficulty[i],
    resource_url: html_formation_urls[i],
    skill_id: Skill.where(name: "HTML/CSS").first.id,
    format: "Formation"
  )
end

js_exercices_urls = [
  "https://scrimba.com/learn-javascript-c0v ",
  "https://exercism.org/tracks/javascript/",
	"https://www.hackerrank.com/"
]
js_exercices_content = [
  "Scrimba is a fun and effective way to learn JavaScript. You can learn JavaScript by watching videos and practicing with the code editor.",
  "Exercism is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your JavaScript skills.",
  "HackerRank is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your JavaScript skills."
]
js_exercices_difficulty = [
  "Intermédiaire",
  "Intermédiaire",
  "Professionnel"
]
js_exercices_name = [
  "Scrimba JavaScript",
  "Exercism Javascript",
  "HackerRank"
]
3.times do |i|
  Resource.create!(
    name: js_exercices_name[i],
    content: js_exercices_content[i],
    image_url: js_image,
    price: 0,
    difficulty: js_exercices_difficulty[i],
    resource_url: js_exercices_urls[i],
    skill_id: Skill.where(name: "JavaScript").first.id,
    format: "Exercice"
  )
end

js_formation_urls = [
  "https://www.udemy.com/course/the-complete-javascript-course",
  "https://www.freecodecamp.org/learn/javascript-algorithms-and-data-structures-v8/"
]
js_formation_difficulty = [
  "Intermédiaire",
  "Intermédiaire"
]
js_formation_price = [
  24.99,
  0
]
js_formation_content = [
  "The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!",
  "In the JavaScript Algorithms and Data Structures Certification, you'll learn how to write algorithms and solve problems with JavaScript. You'll also learn how to use data structures to store and organize data."
]
js_formation_name = [
  "The Complete JavaScript Course 2023",
  "JavaScript Algorithms and Data Structures Certification"
]
2.times do |i|
  Resource.create!(
    name: js_formation_name[i],
    content: js_formation_content[i],
    image_url: js_image,
    price: js_formation_price[i],
    difficulty: js_formation_difficulty[i],
    resource_url: js_formation_urls[i],
    skill_id: Skill.where(name: "JavaScript").first.id,
    format: "Formation"
  )
end

ruby_exercices_urls = [
  "https://exercism.org/tracks/ruby",
  "https://www.hackerrank.com/"
]

ruby_exercices_content = [
  "Exercism is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your Ruby skills.",
  "HackerRank is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your Ruby skills."
]
ruby_exercices_difficulty = [
  "Intermédiaire",
  "Professionnel"
]
ruby_exercices_name = [
  "Exercism Ruby",
  "HackerRank Ruby"
]
2.times do |i|
  Resource.create!(
    name: ruby_exercices_name[i],
    content: ruby_exercices_content[i],
    image_url: ruby_image,
    price: 0,
    difficulty: ruby_exercices_difficulty[i],
    resource_url: ruby_exercices_urls[i],
    skill_id: Skill.where(name: "Ruby").first.id,
    format: "Exercice"
  )
end

ruby_formation_urls = [
  "https://www.freecodecamp.org/learn/back-end-development-and-apis/",
	"https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course"
]
ruby_formation_difficulty = [
  "Intermédiaire",
  "Intermédiaire"
]
ruby_formation_price = [
  22.99,
  0
]
ruby_formation_name = [
  "Back End Development and APIs Certification",
  "The Complete Ruby on Rails Developer Course"
]

ruby_formation_content = [
  "In the Back End Development and APIs Certification, you'll learn how to build APIs with Node.js and Express. You'll also learn how to use MongoDB to store data and how to deploy your applications to Heroku.",
  "In this course, you'll learn how to build web applications with Ruby on Rails. You'll learn how to build a blog, a social network, and other applications."
]
2.times do |i|
  Resource.create!(
    name: ruby_formation_name[i],
    content: ruby_formation_content[i],
    image_url: ruby_image,
    price: ruby_formation_price[i],
    difficulty: ruby_formation_difficulty[i],
    resource_url: ruby_formation_urls[i],
    skill_id: Skill.where(name: "Ruby").first.id,
    format: "Formation"
  )
end

Resource.create!(
  name: "Understanding Typescript",
  content: "Boost your JavaScript projects with TypeScript: Learn all about core types, generics, TypeScript + React or Node & more!",
  image_url: typescript_image,
  price: 24.99,
  difficulty: "Débutant",
  resource_url: "	https://www.udemy.com/course/understanding-typescript",
  skill_id: Skill.where(name: "TypeScript").first.id,
  format: "Formation"
)
Resource.create!(
  name: "Exercism Typescript",
  content: "Exercism is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your TypeScript skills.",
  image_url: typescript_image,
  price: 0,
  difficulty: "Débutant",
  resource_url: "https://exercism.org/tracks/typescript/exercises",
  skill_id: Skill.where(name: "TypeScript").first.id,
  format: "Exercice"
)

python_formation_urls = [
  "https://www.freecodecamp.org/learn/scientific-computing-with-python/",
  "https://www.freecodecamp.org/learn/data-analysis-with-python/",
	"https://www.freecodecamp.org/learn/machine-learning-with-python/",
	"https://www.freecodecamp.org/learn/college-algebra-with-python/"
]

python_formation_difficulty = [
  "Débutant",
  "Intermédiaire",
  "Professionnel",
  "Professionnel"
]
python_formation_name = [
  "Scientific Computing with Python Certification",
  "Data Analysis with Python Certification",
  "Machine Learning with Python Certification",
  "College Algebra with Python Certification"
]
python_formation_content = [
  "In the Scientific Computing with Python Certification, you'll learn how to use Python to solve scientific problems. You'll learn how to use NumPy, SciPy, and Matplotlib to analyze data and create visualizations.",
  "In the Data Analysis with Python Certification, you'll learn how to use Python to analyze data. You'll learn how to use Pandas, NumPy, and Matplotlib to analyze data and create visualizations.",
  "In the Machine Learning with Python Certification, you'll learn how to use Python to build machine learning models. You'll learn how to use scikit-learn to build models and how to use TensorFlow to build neural networks.",
  "In the College Algebra with Python Certification, you'll learn how to use Python to solve algebra problems. You'll learn how to use SymPy to solve equations and how to use Matplotlib to create visualizations."
]
4.times do |i|
  Resource.create!(
    name: python_formation_name[i],
    content: python_formation_content[i],
    image_url: python_image,
    price: 0,
    difficulty: python_formation_difficulty[i],
    resource_url: python_formation_urls[i],
    skill_id: Skill.where(name: "Python").first.id,
    format: "Formation"
  )
end

python_exercices_urls = [
  "https://exercism.org/tracks/python",
  "https://www.hackerrank.com/"
]

python_exercices_content = [
  "Exercism is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your Python skills.",
  "HackerRank is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your Python skills."
]
python_exercices_difficulty = [
  "Débutant",
  "Intermédiaire"
]
python_exercices_name = [
  "Exercism Python",
  "HackerRank Python"
]
2.times do |i|
  Resource.create!(
    name: python_exercices_name[i],
    content: python_exercices_content[i],
    image_url: python_image,
    price: 0,
    difficulty: python_exercices_difficulty[i],
    resource_url: python_exercices_urls[i],
    skill_id: Skill.where(name: "Python").first.id,
    format: "Exercice"
  )
end

sql_formation_urls = [
  "https://www.freecodecamp.org/learn/data-visualization/",
  "https://www.freecodecamp.org/learn/relational-database/#learn-git-by-building-an-sql-reference-object",
  "https://www.codecademy.com/learn/learn-sql"
]
sql_formation_name = [
  "Data Visualization",
  "Relational Database",
  "Learn SQL"
]
sql_formation_content = [
  "In the Data Visualization Certification, you'll learn how to use Python to create visualizations. You'll learn how to use Matplotlib, Seaborn, and Plotly to create visualizations.",
  "In the Relational Database Certification, you'll learn how to use SQL to create and manage databases. You'll learn how to use SQLite, PostgreSQL, and MySQL to create databases and tables.",
  "In the Learn SQL Certification, you'll learn how to use SQL to query databases. You'll learn how to use SELECT, INSERT, UPDATE, and DELETE to query databases."
]
sql_formation_difficulty = [
  "Intermédiaire",
  "Intermédiaire",
  "Débutant"
]
3.times do |i|
  Resource.create!(
    name: sql_formation_name[i],
    content: sql_formation_content[i],
    image_url: sql_image,
    price: 0,
    difficulty: sql_formation_difficulty[i],
    resource_url: sql_formation_urls[i],
    skill_id: Skill.where(name: "Database").first.id,
    format: "Formation"
  )
end
Resource.create!(
  name: "Hacker Rank Database",
  content: "HackerRank is a platform that provides you with coding exercises to improve your coding skills. You can choose from a variety of exercises and improve your SQL skills.",
  image_url: sql_image,
  price: 0,
  difficulty: "Intermédiaire",
  resource_url: "https://www.hackerrank.com/domains/tutorials",
  skill_id: Skill.where(name: "Database").first.id,
  format: "Exercice"
)
