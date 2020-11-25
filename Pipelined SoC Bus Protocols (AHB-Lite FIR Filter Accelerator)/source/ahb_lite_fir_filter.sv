// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     10/28/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: AHB lite FIR filter module 

module ahb_lite_fir_filter
(
    input logic clk,
    input logic n_rst,
    input logic hsel,
    input logic [3:0] haddr,
    input logic hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);

logic [15:0] fir_result;
logic err;
logic data_ready;
logic [15:0] sample_data;
logic modwait;
logic new_coefficient_set;
logic load_coeff;
logic [1:0] coefficient_num;
logic [15:0] fir_coefficient;
logic clear_coefficient; 

fir_filter filter
(
    //REMOVED FOR VIEWING
);

ahb_lite_slave slave
(
    //REMOVED FOR VIEWING
);

coefficient_loader loader
(
    //REMOVED FOR VIEWING
);


endmodule
