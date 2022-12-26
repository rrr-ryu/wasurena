require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe 'グループ作成' do
    context 'グループ作成できる場合' do
      it '必要な項目が入力されている時' do
        expect(@room).to be_valid
      end
    end

    context 'グループ作成できない場合' do
      it 'nameが空の時' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが10文字以上ある時' do
        @room.name = '12345678901'
        @room.valid?
        expect(@room.errors.full_messages).to include('Name is too long (maximum is 10 characters)')
      end
    end
  end
end
