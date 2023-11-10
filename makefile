all_test:
	cd ch2; docker-compose down;
	cd ch3; docker-compose down;
	cd ch4; docker-compose down;
	cd ch5; docker-compose down;
	cd ch-rspec; docker-compose down;
	cd ch-minimax; docker-compose down;

	echo "CH2"
	cd ch2; docker-compose up -d;
	docker exec -ti code bash -c "ruby test/tic_tac_toe_test.rb"
	cd ch2; docker-compose down;

	echo "CH3"
	cd ch3; docker-compose up -d;
	docker exec -ti code bash -c "ruby test/tic_tac_toe_test.rb"
	docker exec -ti code bash -c "rubocop tic_tac_toe"
	cd ch3; docker-compose down;

	echo "CH4"
	cd ch4; docker-compose up -d;
	docker exec -ti code bash -c "ruby test/board_test.rb"
	docker exec -ti code bash -c "ruby test/game_manager_test.rb"
	docker exec -ti code bash -c "ruby test/player_test.rb"
	docker exec -ti code bash -c "ruby test/tic_tac_toe_validator_test.rb"
	docker exec -ti code bash -c "rubocop tic_tac_toe"
	cd ch4; docker-compose down;

	echo "CH5"
	cd ch5; docker-compose up -d;
	docker exec -ti code bash -c "ruby test/board_test.rb"
	docker exec -ti code bash -c "ruby test/game_manager_test.rb"
	docker exec -ti code bash -c "ruby test/players/user_player_test.rb"
	docker exec -ti code bash -c "ruby test/players/orderly_com_player_test.rb"
	docker exec -ti code bash -c "ruby test/players/random_com_player_test.rb"
	docker exec -ti code bash -c "ruby test/tic_tac_toe_validator_test.rb"
	docker exec -ti code bash -c "rubocop tic_tac_toe"
	cd ch5; docker-compose down;

	echo "CH-RSPEC"
	cd ch-rspec; docker-compose up -d;
	docker exec -ti code bash -c "rspec spec"
	cd ch-rspec; docker-compose down;

	echo "CH-minimax"
	cd ch-minimax; docker-compose up -d;
	docker exec -ti code bash -c "ruby test/board_test.rb"
	docker exec -ti code bash -c "ruby test/game_manager_test.rb"
	docker exec -ti code bash -c "ruby test/players/user_player_test.rb"
	docker exec -ti code bash -c "ruby test/players/orderly_com_player_test.rb"
	docker exec -ti code bash -c "ruby test/players/random_com_player_test.rb"
	docker exec -ti code bash -c "ruby test/tic_tac_toe_validator_test.rb"
	docker exec -ti code bash -c "rubocop tic_tac_toe"
	cd ch-minimax; docker-compose down;

ch_minimax:
	cd ch-minimax; docker-compose down;
	cd ch-minimax; docker-compose up -d;
	docker exec -ti code bash -c "rubocop tic_tac_toe -a"
	docker exec -ti code bash -c "ruby test/board_test.rb"
	docker exec -ti code bash -c "ruby test/game_manager_test.rb"
	docker exec -ti code bash -c "ruby test/players/user_player_test.rb"
	docker exec -ti code bash -c "ruby test/players/orderly_com_player_test.rb"
	docker exec -ti code bash -c "ruby test/players/random_com_player_test.rb"
	docker exec -ti code bash -c "ruby test/tic_tac_toe_validator_test.rb"
	docker exec -ti code bash -c "rubocop tic_tac_toe"
	cd ch-minimax; docker-compose down;

all_rubocop:
	cd ch3; docker-compose down;
	cd ch4; docker-compose down;
	cd ch5; docker-compose down;
	cd ch-rspec; docker-compose down;
	cd ch-minimax; docker-compose down;

	cd ch3; docker-compose up -d;
	docker exec -ti code bash -c "rubocop tic_tac_toe -a"
	cd ch3; docker-compose down;

	cd ch4; docker-compose up -d;
	docker exec -ti code bash -c "rubocop tic_tac_toe -a"
	cd ch4; docker-compose down;

	cd ch5; docker-compose up -d;
	docker exec -ti code bash -c "rubocop tic_tac_toe -a"
	cd ch5; docker-compose down;

	cd ch-rspec; docker-compose up -d;
	docker exec -ti code bash -c "rubocop tic_tac_toe -a"
	cd ch-rspec; docker-compose down;

	cd ch-minimax; docker-compose up -d;
	docker exec -ti code bash -c "rubocop tic_tac_toe -a"
	cd ch-minimax; docker-compose down;

in:
	docker exec -ti code /bin/bash
