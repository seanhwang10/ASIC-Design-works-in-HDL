// $Id: $
// File name:   apb_slave.sv
// Created:     10/21/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: APB slave controller

module apb_slave
(
    input logic clk,
    input logic n_rst,
    input logic [7:0] rx_data,
    input logic data_ready,
    input logic overrun_error,
    input logic framing_error,
    output logic data_read,
    input logic psel,
    input logic [2:0] paddr,
    input logic penable,
    input logic pwrite,
    input logic [7:0] pwdata,
    output logic [7:0] prdata,
    output logic pslverr,
    output logic [3:0] data_size,
    output logic [13:0] bit_period
);

    logic [2:0] read_select;
    logic [2:0] write_select;

    logic temp_data_read; 
    logic next_data_read;
    
    logic [7:0] next_prdata;
    logic [7:0] pr_error;
    logic [7:0] temp_rx_data;
    logic [7:0] bit_period_0;
    logic [7:0] next_bit_period_0;
    logic [7:0] bit_period_1;
    logic [7:0] next_bit_period_1;
    logic [7:0] temp_data_size;
    logic [7:0] next_temp_data_size;


    always_ff @ (posedge clk, negedge n_rst)
    begin: REGISTERS  
        if (!n_rst) 
        begin 
            data_read <= '0;
        end 

        else 
        begin 
            if (data_size)
            begin
                temp_rx_data <= {3'b000,rx_data[7:3]}; 
            end 
        
            else 
            begin 
                temp_rx_data <= rx_data;
            end 
            data_read <= next_data_read;
            bit_period_1 <= next_bit_period_1;
        end 
    end 


    always_comb 
    begin: ERROR
        pr_error = '0;
        if (framing_error)
            pr_error = 8'd1;
        else if (overrun_error)
            pr_error = 8'd2; 
    end 

    always_comb 
    begin: READ 
        next_prdata = prdata;
        next_data_read = '0;

        case(read_select)
            3'd0: begin 
                next_prdata = {7'd0, data_ready}; 
                end 
            3'd1: begin 
                next_prdata = pr_error; 
                end 
            3'd2: begin 
                next_prdata = bit_period_0; 
                end 
            3'd3: begin 
                next_prdata = {2'b00, bit_period_1 [5:0]}; 
                end 
            3'd4: begin 
                next_prdata = temp_data_size; 
                end 
            3'd6: begin
                next_prdata = temp_rx_data;  
                next_data_read = 1; 
                end 
        endcase

    end
    
assign bit_period = {bit_period_1[5:0], bit_period_0};

endmodule 



