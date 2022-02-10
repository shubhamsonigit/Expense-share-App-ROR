class AuditServices
  class<<self
    def create(audit_params,amount)
      GroupUser.where(group_id: audit_params[:group_id]).each do |groupUser|
        if groupUser.user_id == audit_params[:user_id]
          next
        end
        if Audit.exists?(user_id:audit_params[:user_id],user_id2:groupUser.user_id)
          @audit = Audit.where(user_id:audit_params[:user_id],user_id2:groupUser.user_id).take
          @audit.amount += amount
        else
          @audit = Audit.new(user_id:audit_params[:user_id],user_id2:groupUser.user_id,group_id:audit_params[:group_id],amount:amount)
        end
        @audit.save
      end
    end

    def get(id)
      return Audit.find(id)
    end

    def all
      return Audit.all
    end

    def update(id,audit_params)
      @audit = Audit.find(id)
      @audit.update(audit_params)
    end

    def delete(id)
      Audit.find(id).destroy
    end

    def get_count_of_user(group_id)
      return GroupUser.where(group_id: group_id).count
    end

    def get_distributed_amount(amount,number)
      return amount/number
    end

    def get_balance_user_level(user_id)
      return Audit.where(user_id:user_id).or(Audit.where(user_id2:user_id))
    end

    def get_balance_group_level(group_id)
      return Audit.where(group_id:group_id)
    end

    def get_transaction_date_wise(group_id)
      return Audit.where(group_id:group_id).order(:created_at)
    end
  end
end