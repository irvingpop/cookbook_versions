# cookbook_versions

This cookbook examines all of the cookbooks in a node's `run_list` and extracts the cookbook versions.  These are saved into node attributes under the 'cookbook_versions' key, like so:

```json
cookbook_versions => {
  "cookbook_versions_test"=>"0.1.0",
  "cookbook_versions"=>"0.1.0"
}
```

NOTE: This `cookbook_versions` resource should be run at the end of a chef-client run, or else recipes may modify the `run_list` and that won't be reflected in the node attributes.

# Usage

You can use the resource directly, or include the default recipe which simply calls the resource

```ruby
cookbook_versions 'whatever'
```
