desc "destroys all models in app"
task :destroy_all_models do
  files = Dir.glob(Rails.root.join("app/models/**/*.rb"))
  files.each do |file|
    system("rails d model " + File.basename(file, ".rb").classify)
  end
end