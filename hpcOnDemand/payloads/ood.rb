# /etc/ood/config/apps/dashboard/initializers/ood.rb

Rails.application.config.after_initialize do
  OodFilesApp.candidate_favorite_paths.tap do |paths|

    # add research projects
    paths << FavoritePath.new("/varidata/research/projects", title: "Lab Folders")
    paths << FavoritePath.new("/varidata/researchtemp/hpctmp", title: "HPC Temp Folder")

  end
end
