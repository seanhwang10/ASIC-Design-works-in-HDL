// $Id: $
// File name:   rcv_block.sv
// Created:     10/8/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: 4-bit MSB Serial to Parallel shift register 
//              (Defaults for Flex StP SR)

module stp_sr_4_msb
(
  input wire clk,
  input wire n_rst,
  input wire serial_in,
  input wire shift_enable,
  output wire [3:0] parallel_out 
);

  flex_stp_sr 
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(serial_in),
    .shift_enable(shift_enable),
    .parallel_out(parallel_out)
  );

endmodule
