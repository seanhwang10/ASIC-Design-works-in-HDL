// $Id: $
// File name:   sr_9bit.sv
// Created:     10/8/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: 9 bit shift register 

module sr_9bit 
(
    input clk,
    input n_rst,
    input shift_enable, 
    input serial_in,
    output reg [7:0] packet_data, 
    output reg stop_bit
); 

flex_stp_sr #(.NUM_BITS(9),.SHIFT_MSB(0)) SHIFT_REGISTER
(
    .clk(clk), 
    .n_rst(n_rst),
    .shift_enable(shift_enable),
    .serial_in(serial_in), 
    .parallel_out({stop_bit, packet_data})
); 

endmodule