class GroupServices
  class<<self
    def create(group_params)
      @group = Group.new(group_params)
      @group.save
    end

    def get(id)
      return Group.find(id)
    end

    def all
      return Group.all
    end

    def update(id,group_params)
      @group = Group.find(id)
      @group.update(group_params)
    end

    def delete(id)
      Group.find(id).destroy
    end
  end
end
