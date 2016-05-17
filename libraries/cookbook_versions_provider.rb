# encoding: utf-8
require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class CookbookVersions < Chef::Provider::LWRPBase
      use_inline_resources

      action :create do
        cookbook_versions = versioned_run_list(run_context.cookbook_collection.keys, run_context.cookbook_collection)
        log("cookbook_versions:  #{cookbook_versions}")
        node.set['cookbook_versions'] = cookbook_versions
        node.save
      end

      def versioned_run_list(loaded_recipes, cookbook_collection)
        cookbook_versions = {}
        unique_cookbook_names(loaded_recipes).each do |cookbook|
          cookbook_version = cookbook_collection[cookbook].metadata.version
          cookbook_versions[cookbook] = cookbook_version
        end
        cookbook_versions
      end

      def unique_cookbook_names(loaded_recipes)
        uniq_cookbooks = []
        loaded_recipes.each do |recipe|
          cookbook_name = recipe.split(':').first
          uniq_cookbooks << cookbook_name unless uniq_cookbooks.include?(cookbook_name)
        end
        uniq_cookbooks
      end

    end
  end
end
