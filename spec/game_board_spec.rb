require './bin/main.rb' 
require './lib/game_board.rb'
require './lib/player.rb'


RSpec.configure do |c|
  c.before { allow($stdout).to receive(:puts) }
end


describe GameBoard do
    let(:game){GameInterface.new}
    let(:board){GameBoard.new}
    let(:player){Player.new}

    
    describe "#position_taken" do
        context 'the position is already taken' do
            before do
                allow(player).to receive(:player_action).and_return([0,0])   
                allow(player).to receive(:mark).and_return("X")
                board.instance_variable_set(:@board,[["X",nil,nil],[nil,nil,nil],[nil,nil,nil]] ) 
                
            end
            it 'the position is' do
                expect(board.position_taken(player.player_action)).to eql(true)
            end
        end
    end

    describe "#position_taken" do
        context 'the position is already taken' do
            before do
                allow(player).to receive(:player_action).and_return([0,0])   
                allow(player).to receive(:mark).and_return("X")
                board.instance_variable_set(:@board,[[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]] )       
            end
            it 'the position is' do
                expect(board.position_taken(player.player_action)).to eql(nil)
            end
        end
    end

    describe "#move" do
        context 'the position is free or not' do
            before do
                allow(player).to receive(:player_action).and_return([0,2])   
                allow(player).to receive(:mark).and_return("X")
                board.instance_variable_set(:@board,[[nil,nil,'X'],[nil,nil,nil],[nil,nil,nil]] )       
            end
            it 'returns fail is the position is not equal to nil' do
                expect(board.move(player.player_action, player.mark)).to eql('fail')
            end
        end
    end

    # test for nil
    describe "#move" do
        context 'the position is free or not' do
            before do
                allow(player).to receive(:player_action).and_return([0,1])   
                allow(player).to receive(:mark).and_return("X")
                board.instance_variable_set(:@board,[[nil,nil,'X'],[nil,nil,nil],[nil,nil,nil]] )       
            end
            it 'returns nil is the position is  equal to nil' do
                expect(board.move(player.player_action, player.mark)).to eql(nil)
            end
        end
    end


 
end