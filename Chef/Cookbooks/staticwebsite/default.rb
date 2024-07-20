include_recipe 'staticwebsite::update'
include_recipe 'staticwebsite::nginx'
include_recipe 'staticwebsite::remove'
include_recipe 'staticwebsite::deploy'