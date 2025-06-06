const print = @import("std").debug.print;

pub fn check_winner(board: [9]u8, n_rows: u8, n_cols: u8, win_s: u8) bool {

    for (board, 0..) |c, i| {
        _ = c;
        // check inside of a row if there are 3 same...
        if(i % n_cols == 0) {
            if(board[i] == board[i + 1] and board[i + 1] == board[i + 2] and board[i + 2] != '_') {
                return true;    
            }
        } 
        // check inside of a col if there are 3 same...
        if(i < n_cols) {
            if(board[i] == board[i + 3] and board[i + 3] == board[i + 6] and board[i + 6] != '_') {
                return true;    
            }
        }
        if(i == 0) {
            if(board[i] == board[i + 4] and board[i + 4] == board[i + 8] and board[i + 8] != '_') {
                return true;    
            }
        }
        if(i == 2) {
            if(board[i] == board[i + 2] and board[i + 2] == board[i + 4] and board[i + 4] != '_') {
                return true;    
            }
        }
        _, _ = .{n_rows, win_s};
    }
    return false;
}

pub fn draw_board(board: [9]u8) void {

    for (board, 0..) |c, i| {
        print("{c} ", .{c});
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
    const n_cols: u8  = 3;
    const n_rows: u8 = 3;
    const win_s: u8 = 3;
    var board = [9]u8{'_', '_', '_', '_', '_', '_', '_', '_', '_'};
    // const moves = [_]u8{0, 1, 3, 4, 7, 6, 2, 5, 8};
    const moves = [_]u8{2, 3, 4, 5, 6, 8, 2, 5, 8};
    print("board {c}\n", .{board[0]});
    var potential_move: usize = 0;
    while (turn < 10) : (turn += 1) {
        current_player = symbols[turn % 2];
        print("Turn {}, it is the move of the player {c}\n", .{turn, current_player});
        print("board {any}\n", .{board});

        user_input(&board, &moves, &potential_move, current_player);
        
        draw_board(board);
        
        if (check_winner(board, n_rows, n_cols, win_s)) {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
            break;
        }
        
        if(turn == 9) {
            print("{s}\n", .{"IT'S A TIE"});
        }

    }
    print("GAME OVER", .{});
}
