class GroupUserServices
  class<<self
    def create(group_user_params)
      @groupUser = GroupUser.new(group_user_params)
      @groupUser.save
    end

    def get(id)
      return GroupUser.find(id)
    end

    def all
      return GroupUser.all
    end

    def update(id,group_user_params)
      @groupUser = GroupUser.find(id)
      @groupUser.update(group_user_params)
    end

    def delete(id)
      GroupUser.find(id).destroy
    end
  end
end
