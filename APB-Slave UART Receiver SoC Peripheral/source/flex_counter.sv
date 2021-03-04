// $Id: $
// File name:   flex_counter.sv
// Created:     9/23/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Flexible counter with controlled rollover

module flex_counter
#(
    parameter NUM_CNT_BITS = 4
)
(
    input clk, 
    input n_rst,
    input clear, 
    input wire count_enable,
    input [NUM_CNT_BITS - 1:0] rollover_val, 
    output reg [NUM_CNT_BITS - 1:0] count_out,
    output reg rollover_flag
);

reg [NUM_CNT_BITS - 1:0] next_count; 
reg flag; 

always_ff @(negedge n_rst, posedge clk) begin 
    if (!n_rst) begin 
    count_out <= 'b0; 
    rollover_flag <= 'b0; end 

    else begin 
    count_out <= next_count; 
    rollover_flag <= flag; end 

end 

always_comb begin //clear 
    next_count = count_out;
    flag = '0; 

    if (clear) begin 
        next_count = '0; 
    end 

    else if (count_enable) begin 
        if (count_out < rollover_val)  begin 
            next_count = count_out + 1;  
            if (count_out == rollover_val - 1)
            flag = 'b1; end 
        else begin  
        next_count = 'b1; 
        flag = 'b0;  end 
    end 
end 
            
endmodule

