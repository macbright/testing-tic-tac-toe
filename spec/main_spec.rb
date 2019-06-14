require './bin/main.rb' 

RSpec.describe GameInterface do
    describe "#win_game" do
        it 'It returns the particular player who wins the game is there is one' do
            player1 = double('player1')
            player2 = double('player2')

            allow(player1).to receive(:mark) {"X"}
            allow(player2).to receive(:mark) {"O"}

            game = GameInterface.new player1, player2

            expect(game.win_game).to eq(game.winner_text(player1))
        end
    end
end