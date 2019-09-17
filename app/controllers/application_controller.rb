class ApplicationController < Sinatra::Base
  @@blah = [
  {
    name: 'Transfiguration',
    professor: 'McGonagall',
    credits: 3
  }, {
    name: 'Charms',
    professor: 'Flitwick',
    credits: 2
  }, {
    name: 'Potions',
    professor: 'Snape',
    credits: 4
  }, {
    name: 'History of Magic',
    professor: 'Binns',
    credits: 2
  }, {
    name: 'Defence Against the Dark Arts',
    professor: 'Lupin',
    credits: 4
  }, {
    name: 'Astronomy',
    professor: 'Sinistra',
    credits: 2
  }, {
    name: 'Herbology',
    professor: 'Sprout',
    credits: 2
  }, {
    name: 'Flying',
    professor: 'Hooch',
    credits: 1
  }, {
    name: 'Arithmancy',
    professor: 'Vector',
    credits: 4
  }, {
    name: 'Muggle Studies',
    professor: 'Burbage',
    credits: 2
  }, {
    name: 'Divination',
    professor: 'Trelawney',
    credits: 2
  }, {
    name: 'Study of Ancient Runes',
    professor: 'Babbling',
    credits: 3
  }, {
    name: 'Care of Magical Creatures',
    professor: 'Hagrid',
    credits: 2
  }, {
    name: 'Frog Choir',
    professor: 'Flitwick',
    credits: 1
  }
]
  set :views, 'app/views'

  get '/' do
    erb :'index.html'
  end

  get '/courses' do
    Course.destroy_all
    @@blah.each{|x| Course.create(x)}
    @courses = Course.all
    erb :index
  end

  get '/courses/:id' do
    @course = Course.find(params[:id])
    erb :show
  end

  get '/courses/:id/edit'do
    @course = Course.find(params[:id])
    erb :edit
  end

  patch '/courses/:id' do
    @course = Course.find(params[:id])
    @course.update(params["course"])
    redirect "/courses/#{@course.id}"
  end

  get '/schedule' do
  end

end
