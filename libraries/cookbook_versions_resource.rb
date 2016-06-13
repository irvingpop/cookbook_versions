# encoding: utf-8
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CookbookVersions < Chef::Resource::LWRPBase
      self.resource_name = :cookbook_versions
      actions :create
      default_action :create
      attribute :all_cookbooks, :name_attribute => false, :kind_of => [TrueClass, FalseClass], :required => false, :default => false
    end
  end
end
