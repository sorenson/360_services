# Get tag count
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Tag.count.should == count.to_i

# Get a list of asset guids by passing a tag name
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @assets = Sorenson::Services::Asset.all
  instance_variable_get("@#{object}").should include(value)

# Get asset tags
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @tags = @asset.add_tags(arg1)
  @tags = @asset.tags
  instance_variable_get("@#{object}").should include(value)

# See all categories
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  @categories = Sorenson::Services::Category.all
  instance_variable_get("@#{object}").should include(value)

# See the asset category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @category = @asset.add_category(name)
  @category = @asset.category
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Add a category to an asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @category = @asset.add_category(name)
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Activate and Deactivate
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(arg1)
  @asset.deactivate
  @assets = Sorenson::Services::Asset.all
  instance_variable_get("@#{list}").should_not include(instance_variable_get("@#{object}").id)
  @asset.activate
  @assets = Sorenson::Services::Asset.all
  instance_variable_get("@#{list}").should include(instance_variable_get("@#{object}").id)

# Get all tags
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @tags = @asset.add_tags(arg1)
  @tags = Sorenson::Services::Tag.all
  instance_variable_get("@#{object}").should include(value)

# Get all metadata
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @asset.set_metadata(key, value)
  @asset.set_metadata(key, value)
  @metadata = @asset.metadata
  values = keyvalue.split("=")
  @metadata[values[0]].should == values[1]
end  values = keyvalue.split("=")
  @metadata[values[0]].should == values[1]
end
# Delete a group
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @group = Sorenson::Services::Group.create('group')
  @group = Sorenson::Services::Group.find(@group.id)
  @group.destroy

  instance_variable_get("@#{list}").should_not include(instance_variable_get("@#{object}").id)

# Add an asset to a group
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @group = Sorenson::Services::Group.create('group')
  @group.add_asset(@asset)
  @group = Sorenson::Services::Group.find(@group.id)
  @group.assets.should include(@asset.id)

# List flagged assets
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @flags = @asset.add_flags(arg1)
  @flags = Sorenson::Services::Flag.all
  instance_variable_get("@#{object}").should include(value)

# Save a category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  instance_variable_get("@#{text_to_variable(object)}").send("#{text_to_variable(field)}=", value)
  @category.save
  @category = Sorenson::Services::Category.find_by_name(name)
  @category.should_not be_nil
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Save an asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  instance_variable_get("@#{text_to_variable(object)}").send("#{text_to_variable(field)}=", value)
  @asset.save
  @asset = Sorenson::Services::Asset.find(@asset.id)
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1
  instance_variable_get("@#{text_to_variable(object)}").send("#{text_to_variable(field)}=", value)
  @asset.save

# See all metrics
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @events = Sorenson::Services::Metric.all
  @events.select {|event| event.date == Date.parse(day)}.should_not be_empty
end
# Create a category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Get a site by name
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Site.create(name, :description => description)
  @site = Sorenson::Services::Site.find_by_name(name)
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# See Storage Used
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Metric.storage_used.should == storage.to_i

# See Total Plays
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Metric.total_plays.should == total.to_i

# Delete metadata
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @asset.set_metadata(key, value)
  data = @asset.delete_metadata(key)
  data['status'] if data
  @asset = Sorenson::Services::Asset.find(@asset.id)
  @asset.get_metadata_value(key).should == nil

# Get asset flags
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @flags = @asset.add_flags(arg1)
  @tags = @asset.flags
  instance_variable_get("@#{object}").should include(value)

# Count flags
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Flag.count.should == count.to_i

# List root categories
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  @category = Sorenson::Services::Category.create(name)
  instance_variable_get("@#{text_to_variable(object)}").send("#{text_to_variable(field)}=", value)
  @category.save
  @categories = Sorenson::Services::Category.all_roots
  instance_variable_get("@#{object}").should include(value)
  instance_variable_get("@#{object}").should_not include(arg1)

# Get the rate plan
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @rate_plan = @account.rate_plan
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Add flags to asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @flags = @asset.add_flags(arg1)
  instance_variable_get("@#{object}").should include(value)
  instance_variable_get("@#{object}").should include(value)
  instance_variable_get("@#{object}").should include(value)

# Remove a category from an asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @category = @asset.add_category(name)
  @asset.remove_category
  @asset.category.should be_nil

# Add metadata to asset and find it
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @asset.set_metadata(key, value)
  @asset = Sorenson::Services::Asset.find(@asset.id)
  @asset.get_metadata_value(key).should == value

# List all flags
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @flags = @asset.add_flags(arg1)
  @flags = Sorenson::Services::Flag.all
  instance_variable_get("@#{object}").should include(value)

# Add a sub category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  @category = Sorenson::Services::Category.create(name)
  instance_variable_get("@#{text_to_variable(object)}").send("#{text_to_variable(field)}=", value)
  @category.save
  @category = Sorenson::Services::Category.find_by_name(name)
  @category.should_not be_nil
  @category.parent.should == name

# Find a category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  @category = Sorenson::Services::Category.find_by_name(name)
  @category.should_not be_nil
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Get asset presets
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @asset.preset_xml.should include(arg1)

# Get the asset groups
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @group = Sorenson::Services::Group.find_by_name(name)
  @group.destroy if @group
  @group = Sorenson::Services::Group.create(name)

# Get asset embed codes
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @asset.embed_codes.each do |embed_code|
    embed_code.should include(value)
  end

# Create a site and view list
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Site.create(name, :description => description)
  @sites = Sorenson::Services::Site.all
  instance_variable_get("@#{object}").should include(value)

# Create a group
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @group = Sorenson::Services::Group.create(name)
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Get asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Get an account
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @account = Sorenson::Services::Account.get_account
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Get all groups
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @group = Sorenson::Services::Group.create('group')
  @groups = Sorenson::Services::Group.all
  instance_variable_get("@#{list}").should include(instance_variable_get("@#{object}").id)

# Find a group by id
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @group = Sorenson::Services::Group.create('group')
  @group = Sorenson::Services::Group.find(@group.id)

# See all assets belonging to a category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @category = @asset.add_category(name)
  @category = Sorenson::Services::Category.find_by_name(name)
  @category.should_not be_nil
  @assets = @category.assets
  @assets.should include(@asset.id)

# Delete a category
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @category = Sorenson::Services::Category.create(name)
  @categories = Sorenson::Services::Category.all
  instance_variable_get("@#{object}").should include(value)
  @category.destroy
  @categories = Sorenson::Services::Category.all
  instance_variable_get("@#{object}").should_not include(arg1)

# Delete an asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(arg1)
  @asset.destroy
  @assets = Sorenson::Services::Asset.all
  instance_variable_get("@#{list}").should_not include(instance_variable_get("@#{object}").id)
  @asset.activate
  @assets = Sorenson::Services::Asset.all
  instance_variable_get("@#{list}").should include(instance_variable_get("@#{object}").id)

# Login to Sorenson 360 Account
  @account = Sorenson::Services::Account.login(arg1, arg2)
  instance_variable_get("@#{text_to_variable(object)}").send(text_to_variable(field)).should == arg1

# Find all assets by tag
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @tags = @asset.add_tags(arg1)
  @assets = Sorenson::Services::Asset.find_all_by_tag(arg1)
  instance_variable_get("@#{object}").should include(value)

# Add tags to asset
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @tags = @asset.add_tags(arg1)
  instance_variable_get("@#{object}").should include(value)
  instance_variable_get("@#{object}").should include(value)
  instance_variable_get("@#{object}").should include(value)

# Find all assets by flag
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  @asset = Sorenson::Services::Asset.find(Sorenson::Services::Asset.all.first)
  @asset.should_not be_nil
  @flags = @asset.add_flags(arg1)
  @assets = Sorenson::Services::Asset.find_all_by_flag(arg1)
  instance_variable_get("@#{object}").should include(value)

# Get asset count
  @account = Sorenson::Services::Account.login("integrum@integrumtech.com", "integrum")
  Sorenson::Services::Asset.count.should == arg1.to_i

