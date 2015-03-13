require 'rails_helper'


describe Vote do 

  describe "validation" do 

    describe "value validation" do 
      it "only allows -1 or 1 as value" do
        up_vote = Vote.new(value: 1)
        expect( up_vote.valid? ).to eq(true)

        down vote = Vote.new(value: -1)
        expect( down_vote.valid? ).to eq(true)

        invalid_vote = Vote.new(value: 2)
        expect( invalid_vote.valid? ).to eq(false)
      end
    end
  end
end
  
