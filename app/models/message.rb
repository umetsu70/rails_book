class Message include ActiveModel::Model
    attr_accessor :name,:email,:content

    validates :name,presence:true,length:{ maximum:20 }

    validates :email,presence:true,length:{ maximum:30 }

    validates :content,presence:true,length:{ maximum:200 }

end
