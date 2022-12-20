require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "新規登録する" do
    context "新規登録できる場合" do
      it "必要な項目に入力がある時" do
        expect(@user).to  be_valid
      end
    end
    context "新規登録できない場合" do
      it "nameが空の時" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")  
      end
      it "uidが空の時" do
        @user.uid = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Uid can't be blank")  
      end
      it "uidが重複している時" do
        @another_user = FactoryBot.create(:user)
        @user.uid = @another_user.uid
        @user.valid?
        expect(@user.errors.full_messages).to include("Uid has already been taken")  
      end
      it "uidが8文字より少ないの時" do
        @user.uid = "abc1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Uid is too short (minimum is 8 characters)")  
      end
      it "uidが16文字より多い時" do
        @user.uid = "abcdefj1234567890"
        @user.valid?
        expect(@user.errors.full_messages).to include("Uid is too long (maximum is 16 characters)")  
      end
      it "uidが数字のみの時" do
        @user.uid = "12345678"
        @user.valid?
        expect(@user.errors.full_messages).to include("Uid is invalid. Include both letters and numbers")  
      end
      it "passwordが空の時" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")  
      end
      it "passwordが6文字より少ない時" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
      end
      it "passwordが128文字より多い時" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)") 
      end
      it "passwordとpassword_confimationが一致しない時" do
        @user.password = "abc12345"
        @user.password_confirmation = "abc1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it "passwrodが数字のみの時" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers") 
      end
  end
  end
end
