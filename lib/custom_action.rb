require "rails_admin/config/actions"
require "rails_admin/config/actions/base"

module RailsAdmin
  module Config
    module Actions
      class CustomActionMember < RailsAdmin::Config::Actions::Base
        # アクションの登録
        RailsAdmin::Config::Actions.register(self)

        # 編集とか削除とかのリンクと同じ箇所に追加する
        register_instance_option :member? do
          true
        end

        # 表示するかどうかの設定。特定のクラスだけ出すように設定する等。
        register_instance_option :visible? do
          if bindings[:abstract_model].model == Member
            true
          else
            false
          end
        end

        # font_awesomeのアイコン名。ここで指定したアイコンが勝手に表示される。
        register_instance_option :link_icon do
          "icon-eye-open "
        end

        # pjaxを利用して画面遷移をするかどうか
        register_instance_option :pjax? do
          false
        end

        # controllerの実際の処理
        # 実際には`(rails_adminのgemディレクトリ)/app/controllers/rails_admin/main_controller.rb`でclass_evalによって定義されたメソッドの中で、instance_evalされる事によって実行される
        register_instance_option :controller do
          Proc.new do
            case @object
            when Member
              render json: {success: true}# redirect_to main_app.root_path
            else
              raise "object is not a Member"
            end
          end
        end
      end

      class CustomActionGroup < RailsAdmin::Config::Actions::Base
        # アクションの登録
        RailsAdmin::Config::Actions.register(self)

        # 編集とか削除とかのリンクと同じ箇所に追加する
        register_instance_option :member? do
          false
        end

        register_instance_option :collection? do
          true
        end

        # 表示するかどうかの設定。特定のクラスだけ出すように設定する等。
        register_instance_option :visible? do
          if bindings[:abstract_model].model == Group
            true
          else
            false
          end
        end

        # font_awesomeのアイコン名。ここで指定したアイコンが勝手に表示される。
        register_instance_option :link_icon do
          "icon-eye-open "
        end

        # pjaxを利用して画面遷移をするかどうか
        register_instance_option :pjax? do
          false
        end

        # controllerの実際の処理
        # 実際には`(rails_adminのgemディレクトリ)/app/controllers/rails_admin/main_controller.rb`でclass_evalによって定義されたメソッドの中で、instance_evalされる事によって実行される
        register_instance_option :controller do
          Proc.new do
            case @object
            when Group
              render json: {success: true}# redirect_to main_app.root_path
            else
              raise "object is not a Group"
            end
          end
        end
      end


    end
  end
end