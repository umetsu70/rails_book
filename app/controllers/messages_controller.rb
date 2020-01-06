class MessagesController < ApplicationController

    def index
        @message = Message.new
    end

    def confirm
        @message=Message.new(message_params)
        # 問題あるかどうか バリデーション
        if @message.valid?
            render :action=>'confirm'
            
        else
            render :action=>'mail'
            
        end
    end

    def done
        @message=Message.new(message_params)
        if prarams[:back]
            render :action=>'mail'
        else
            MessageMailer.received_email(@message).deliver_now
            render :action=>'done'
        end
    end

    private
    def message_params
        params.require(:message).permit(:name,:email,:content)
    end
end
