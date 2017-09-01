Dir["#{File.dirname(__FILE__)}/sections/**/*.rb"].each {|file| require file }
Dir["#{File.dirname(__FILE__)}/pages/**/*.rb"].each {|file| require file }

class Site
  def home
    HomePage.new
  end

  def results
    ResultsPage.new
  end
end
