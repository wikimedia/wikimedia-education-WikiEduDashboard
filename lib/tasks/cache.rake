namespace :cache do

  desc 'Update cached values for all models'
  task :update_caches => :environment do
    Rails.logger.info "Updating all cached values"
    Article.update_all_caches
    User.update_all_caches
    ArticlesCourses.update_all_caches
    CoursesUsers.update_all_caches
    Course.update_all_caches
  end

end