require './bin/main.rb' 
require './lib/game_board.rb'
require './lib/player.rb'


RSpec.configure do |c|
  c.before { allow($stdout).to receive(:puts) }
end


describe GameInterface do
    let(:game){GameInterface.new}
    let(:board){GameBoard.new}
    
    describe "#check_horizontal_win" do
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
end