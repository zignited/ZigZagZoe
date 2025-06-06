const print = @import("std").debug.print;

pub fn check_winner(board: [9]u8) bool {
    if(board[0] == board[1] and board[1] == board[2] and board[2] != '_') {
        return true;
    }
    if(board[3] == board[4] and board[4] == board[5] and board[5] != '_') {
        return true;
    }
    if(board[6] == board[7] and board[7] == board[8] and board[8] != '_') {
        return true;
    }
    if(board[0] == board[3] and board[3] == board[6] and board[6] != '_') {
        return true;
    }
    if(board[1] == board[4] and board[4] == board[7] and board[7] != '_') {
        return true;
    }
    if(board[2] == board[5] and board[5] == board[8] and board[8] != '_') {
           return true;
    }
    if(board[0] == board[4] and board[4] == board[8] and board[8] != '_') {
           return true;
    }
    if(board[2] == board[4] and board[4] == board[6] and board[6] != '_') {
        return true;
    }
    return false;
}

pub fn draw_board(board: [9]u8) void {
    var i: usize = 0;
    while (i < 9) : (i += 1) {
        print("{c} ", .{board[i]});
        if((i + 1) % 3 == 0){
            print("\n", .{});
        }
    }
}

pub fn user_input(board: *[9]u8, moves: []const u8, potential_move: *usize, current_player: u8) void {
    while (true) {
        if(board[moves[potential_move.*]] == '_'){
            board[moves[potential_move.*]] = current_player;
            potential_move.* += 1;
            break;
        }
        potential_move.* += 1;
    }
}

pub fn main() void {
    const symbols = "OX";
    var turn: usize = 1;
    var current_player = symbols[turn % 2];
    var board = [9]u8{'_', '_', '_', '_', '_', '_', '_', '_', '_'};
    const moves = [_]u8{0, 1, 3, 4, 7, 6, 2, 5, 8};
    print("board {c}\n", .{board[0]});
    var potential_move: usize = 0;
    while (turn < 10) : (turn += 1) {
        current_player = symbols[turn % 2];
        print("Turn {}, it is the move of the player {c}\n", .{turn, current_player});
        print("board {any}\n", .{board});

        user_input(&board, &moves, &potential_move, current_player);
        
        draw_board(board);
        
        if (check_winner(board)) {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
            break;
        }
        
        if(turn == 9) {
            print("{s}\n", .{"IT'S A TIE"});
        }

    }
    print("GAME OVER", .{});
}
