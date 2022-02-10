class UserServices
  class<<self
    def create(user_params)
      @user = User.new(user_params)
      @user.save
    end

    def get(id)
      return User.find(id)
    end

    def all
      return User.all
    end

    def update(id,user_params)
      @user = User.find(id)
      @user.update(user_params)
    end

    def delete(id)
      User.find(id).destroy
    end
  end
end