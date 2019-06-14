require './bin/main.rb' 
require './lib/game_board.rb'
require './lib/player.rb'


RSpec.configure do |c|
  c.before { allow($stdout).to receive(:puts) }
end


describe GameInterface do
    let(:game){GameInterface.new}
    let(:board){GameBoard.new}
    
    describe "#check_horizontal_win_with_X" do
        context 'when the first row matches' do
            before do
                # IO.any_instance.stub(:puts)
                allow(board).to receive(:board).and_return([['X','X','X'],["X","O","X"],[1,8,9]])                
            end
            it 'It ret player who wins the game is there is one' do
                expect(game.check_horizontal_win(board.board)).to eql(game.winner_text(""))
            end
        end
    end

    describe "#check_horizontal_win_with_O" do
        context 'when the first row matches' do
            before do
                allow(board).to receive(:board).and_return([['O','O','O'],["X","O","X"],[1,8,9]])                
            end
            it 'It ret player who wins the game is there is one' do
                expect(game.check_horizontal_win(board.board)).to eql(game.winner_text(""))
            end
        end
    end

    describe "#check_diagonal_win_with_X" do
        context 'top left to bottom right' do
            before do
                allow(board).to receive(:board).and_return([['X','O','O'],[5,"X",6],[7,8,"X"]])                
            end
            it 'It ret player who wins the game is there is one' do
                expect(game.check_diagonal_win(board.board)).to eql(game.winner_text(""))
            end
        end
    end

    describe "#check_diagonal_win_with_0" do
        context 'top left to bottom right' do
            before do
                allow(board).to receive(:board).and_return([['O',2,'O'],[5,"O",6],[7,8,"O"]])                
            end
            it 'It ret player who wins the game is there is one' do
                expect(game.check_diagonal_win(board.board)).to eql(game.winner_text(""))
            end
        end
    end

    describe "#check_vertical_win_with_X" do
        context 'top left to bottom right' do
            before do
                allow(board).to receive(:board).and_return([['X',2,3],['X',5,6],["X",8,9]])                
            end
            it 'It ret player who wins the game is there is one' do
                expect(game.check_vertical_win(board.board)).to eql(game.winner_text(""))
            end
        end
    end

    describe "#check_vertical_win_with_O" do
        context 'top left to bottom right' do
            before do
                allow(board).to receive(:board).and_return([['O',2,3],["O",5,6],["O",8,9]])                
            end
            it 'It ret player who wins the game is there is one' do
                expect(game.check_vertical_win(board.board)).to eql(game.winner_text(""))
            end
        end
    end

 
end