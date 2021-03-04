// $Id: $
// File name:   rcv_block.sv
// Created:     10/8/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Receiver block 

module rcv_block 
(
    input clk, 
    input n_rst,
    input serial_in,
    input data_read, 
    input [3:0]  data_size,
	input [13:0] bit_period,
    output reg [7:0] rx_data, 
    output reg data_ready, 
    output reg overrun_error,
    output reg framing_error
); 

//Signals to be used 

reg sbc_enable;
reg sbc_clear;
reg start_bit_detected;
reg shift_enable;
reg stop_bit;
reg load_buffer;
reg enable_timer;
reg packet_done;
reg [7:0]packet_data;
reg new_package; 

//Portmaps

start_bit_det START_BIT_DETECTOR
(
    .clk (clk),
    .n_rst (n_rst),
    .serial_in (serial_in),
    .start_bit_detected (start_bit_detected),	
    .new_package_detected (new_package)
);

rcu RECEIVER_CONTROL_UNIT 
(
    .clk (clk),
    .n_rst (n_rst),
    .start_bit_detected (start_bit_detected),
    .packet_done (packet_done),
    .framing_error (framing_error),
    .sbc_clear (sbc_clear),
    .sbc_enable (sbc_enable),
    .load_buffer (load_buffer),
    .enable_timer (enable_timer)    
); 

stop_bit_chk STOP_BIT_CHECKER
(
    .clk (clk),
    .n_rst (n_rst),
    .sbc_clear (sbc_clear),    
    .sbc_enable (sbc_enable),
    .stop_bit (stop_bit),
    .framing_error (framing_error)    
);

timer TIMING_CONTROLLER
(
    .clk (clk), 
    .n_rst (n_rst),
    .enable_timer (enable_timer),
    .data_size (data_size), 
    .bit_period (bit_period),
    .shift_enable (shift_enable),
    .packet_done (packet_done)
); 

sr_9bit SHIFT_REGISTER
(
    .clk (clk),
    .n_rst (n_rst),
    .shift_enable (shift_enable),
    .serial_in (serial_in),
    .packet_data (packet_data),
    .stop_bit (stop_bit)
);

rx_data_buff RX_DATA_BUFFER
(
    .clk (clk),
    .n_rst (n_rst),
    .load_buffer (load_buffer),
    .packet_data (packet_data),
    .data_read (data_read),
    .rx_data (rx_data),
    .data_ready (data_ready),
    .overrun_error (overrun_error)
);

endmodule