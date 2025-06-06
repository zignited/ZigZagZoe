const print = @import("std").debug.print;


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
        var i: usize = 0;
        while (true) {
            if(board[moves[potential_move]] == '_'){
                board[moves[potential_move]] = current_player;
                potential_move += 1;
                break;
            }
            potential_move += 1;
        }
        while (i < 9) : (i += 1) {
            print("{c} ", .{board[i]});
            if((i + 1) % 3 == 0){
                print("\n", .{});
            }
        }
        if(board[0] == board[1] and board[1] == board[2] and board[2] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[3] == board[4] and board[4] == board[5] and board[5] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[6] == board[7] and board[7] == board[8] and board[8] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[0] == board[3] and board[3] == board[6] and board[6] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[1] == board[4] and board[4] == board[7] and board[7] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[2] == board[5] and board[5] == board[8] and board[8] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[0] == board[4] and board[4] == board[8] and board[8] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(board[2] == board[4] and board[4] == board[6] and board[6] != '_') {
            print("{s} {c}\n", .{"THE WINNER IS", current_player});
        }
        if(turn == 9) {
            print("{s}\n", .{"IT'S A TIE"});
        }
    }
    print("GAME OVER", .{});
}
