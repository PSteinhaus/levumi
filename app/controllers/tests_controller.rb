class TestsController < ApplicationController
  before_action :set_test, except: [:index, :create]
  before_action :is_allowed, only: [:create, :update, :destroy]

  #GET /tests
  def index
  end

  #POST /tests
  def create
    if params.has_key?(:test) && !params[:test][:file].nil?
      res = true
      params[:test][:file].each do |f|
        res = res && Test.import(f.tempfile, params.has_key?(:archive), params.has_key?(:create)).nil?
      end
      render 'index'
    end
  end

  #PUT /tests/:id
  def update
    if !@test.update_attributes(test_attributes)
      render nothing: true
    else
      render 'update'
    end
  end

  #DEL /tests/:id
  def destroy
    id = @test.test_family.id
    @test.destroy
    family = TestFamily.find(id)
    if family.tests.empty?
      family.destroy
    end
    render'index'
  end

  private

  #Erlaubte Attribute definieren
  def test_attributes
    params.require(:test).permit(description: [:full, :short])
  end

  #Prüfen ob Nutzer die Berechtigung für Testaktualisierungen hat
  def is_allowed
    unless @login.has_capability?('test')
      redirect_to '/'
    end
  end

  #Test laden
  def set_test
    @test = Test.find(params[:id])
  end

end
