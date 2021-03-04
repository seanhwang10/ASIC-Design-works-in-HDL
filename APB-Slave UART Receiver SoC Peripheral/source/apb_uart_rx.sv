// $Id: $
// File name:   apb_uart_rx.sv
// Created:     10/22/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: APB UART module

module apb_uart_rx
(
    input clk, 
    input n_rst, 
    input serial_in, 
    input psel, 
    input [2:0] paddr, 
    input penable, 
    input pwrite, 
    input [7:0] pwdata, 
    output reg [7:0] prdata, 
    output reg pslverr
); 

reg data_ready; 
reg [7:0] rx_data; 
reg data_read; 
reg overrun_error; 
reg framing_error;
reg [3:0] data_size; 
reg [13:0] bit_period; 

apb_slave APB_SLAVE
(
    .clk(clk),
    .n_rst(n_rst),
    .rx_data(rx_data),
    .data_ready(data_ready),
    .overrun_error(overrun_error),
    .framing_error(framing_error),
    .data_read(data_read),
    .psel(psel),	
    .paddr(paddr),
    .penable(penable),
    .pwrite(pwrite),
    .pwdata(pwdata),
    .prdata(prdata),	
    .pslverr(pslverr),
    .data_size(data_size),
    .bit_period(bit_period)
); 

rcv_block RCV
(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(serial_in),
    .data_read(data_read),
    .data_size(data_size),
    .bit_period(bit_period),
    .rx_data(rx_data),
    .data_ready(data_ready),
    .overrun_error(overrun_error),
    .framing_error(framing_error)
); 

endmodule 