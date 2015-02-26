# encoding: utf-8
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    class CookbookVersions < Chef::Resource::LWRPBase
      self.resource_name = :cookbook_versions
      actions :create
      default_action :create
    end
  end
end
