// $Id: $
// File name:   flex_stp_sr.sv
// Created:     10/1/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Flexible SIPO shift register

module flex_stp_sr 
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1 //If 1 shift left (MSB)

)
(
    input clk, n_rst, shift_enable, serial_in, 
    output reg [NUM_BITS-1 : 0] parallel_out
);

reg [NUM_BITS-1:0] temp; 

always_ff @ (posedge clk, negedge n_rst) begin 
    if (!n_rst) begin 
        parallel_out <= '1; 
    end 

    else begin 
        parallel_out <= temp; 
    end 
end 

always_comb begin 
    
temp = parallel_out; 

if(shift_enable)
begin 
    if (SHIFT_MSB)
        temp = {temp[NUM_BITS-2:0], serial_in}; 
    else 
        temp = {serial_in, temp[NUM_BITS-1:1]}; 
 end 
end 

endmodule