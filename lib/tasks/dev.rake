namespace :dev do

  desc "Setup development"
  task setup: :environment do

    puts 'Executando o Setup Development...'

    images_path = Rails.root.join('public', 'system')

    puts "Apagando Imagens public/system... #{%x(rm -rf #{images_path})}"
    puts "Apagando Banco de Dados... #{%x(rake db:drop)}"
    puts "Criando Banco de Dados... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)
    puts %x(rake dev:generate_comments)

    puts 'Setup Development concluido com sucesso!'

    10.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0, 0, 1, 1, 1].sample)
    end

    puts 'Admins cadastrados com sucesso...'

  end

  ############################################################################################

  desc "Cria admins fake"
  task generate_admins: :environment do

    puts 'Cadastrando o Admins....'

    10.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0, 0, 1, 1, 1].sample)
    end

    puts 'Admins cadastrados com sucesso...'

  end

  ############################################################################################

  desc "Cria membros fake"
  task generate_members: :environment do

    puts 'Cadastrando o Membros....'

    100.times do
     member = Member.new(email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456")

      member.build_profile_member
      member.profile_member.first_name = Faker::Name.first_name
      member.profile_member.last_name = Faker::Name.last_name

     member.save!
    end

    puts 'Membros cadastrados com sucesso...'

  end

  ############################################################################################

  desc "Cria Anuncios fake"
  task generate_ads: :environment do

    puts 'Cadastrando anúncios...'

    5.times do
      Ad.create!(title: Faker::Lorem.sentence([2,3,4,5].sample),
                 description_md: markdown_fake,
                 description_short: Faker::Lorem.sentence([2,3].sample),
                 member: Member.first,
                 category: Category.all.sample,
                 price: "#{Random.rand(500)}, #{Random.rand(99)}",
                 finish_date: Date.today + Random.rand(60),
                 picture:  File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')

      )
    end


    100.times do
      Ad.create!(title: Faker::Lorem.sentence([2,3,4,5].sample),
                 description_md: markdown_fake,
                 description_short: Faker::Lorem.sentence([2,3].sample),
                 member: Member.all.sample,
                 category: Category.all.sample,
                 price: "#{Random.rand(500)}, #{Random.rand(99)}",
                 finish_date: Date.today + Random.rand(60),
                 picture:  File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')

      )
    end

    puts 'Anuncios cadastrados com sucesso...'

  end

  ############################################################################################

  desc "Cria comentários fake"
  task generate_comments: :environment do

    puts 'Cadastrando Comentários...'

    Ad.all.each do |ad|
      (Random.rand(3)).times do
        Comment.create!(
                   body: Faker::Lorem.paragraph([1, 2, 3].sample),
                   member: Member.all.sample,
                   ad: ad
        )
      end
    end

    puts 'Comentários cadastrados com sucesso...'

  end


  def markdown_fake
    %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
  end


end
