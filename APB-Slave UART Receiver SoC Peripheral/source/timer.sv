// $Id: $
// File name:   timer.sv
// Created:     10/8/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Timing controller

module timer 
(
    input clk, 
    input n_rst,
    input enable_timer,
    input [3:0] data_size,
	input [13:0] bit_period,
    output reg shift_enable,
    output reg packet_done
); 

// reg enable1; 
// reg enable2; 

// always_ff @(negedge n_rst, posedge clk)
// begin 
//     if (!n_rst)
//     begin 
//         enable1 <= '0; 
//         enable2 <= '0; 
//     end 

//     else 
//     begin
//         enable1 <= enable_timer; 
//         enable2 <= enable1; 
//     end 
// end 

flex_counter #(.NUM_CNT_BITS(14))
clk10
(
    .clk(clk),
    .n_rst(n_rst),
    .clear(!enable_timer),
    .count_enable(enable_timer),
    .rollover_val(bit_period),
    .count_out(),
    .rollover_flag(shift_enable)
);

flex_counter #(.NUM_CNT_BITS(4))
bit9
(
    .clk(clk),
    .n_rst(n_rst),
    .clear(!enable_timer),
    .count_enable(shift_enable),
    .rollover_val(data_size + 1'b1),
    .count_out(),
    .rollover_flag(packet_done)
);

endmodule