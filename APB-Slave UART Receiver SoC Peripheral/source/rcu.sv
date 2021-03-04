// $Id: $
// File name:   rcu.sv
// Created:     10/7/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Receiver control unit (RCU).

module rcu 
(
    input clk, 
    input n_rst,
    input start_bit_detected, 
    input packet_done,
    input framing_error,
    output reg sbc_clear,
    output reg sbc_enable,
    output reg load_buffer,
    output reg enable_timer
); 

typedef enum logic [3:0] {IDLE, WAIT, BEGIN, ENTRY, RECEIVE, STOP, CHECK, STORE} states; 

states current_state; 
states next_state; 

//FF Register 
always_ff @(posedge clk, negedge n_rst) 
begin 
    if (!n_rst) 
    current_state <= IDLE; 
    else 
    current_state <= next_state; 
end 

//Next state logic 
always_comb 
begin 
    next_state = current_state; 
        sbc_clear = '0; 
        sbc_enable = '0; 
        load_buffer = '0; 
        enable_timer = '0; 
    
    case(current_state)

    IDLE: begin 
        sbc_clear = '0; 
        sbc_enable = '0; 
        load_buffer = '0; 
        enable_timer = '0; 
        
        if (start_bit_detected) begin 
            next_state = WAIT; 
            sbc_clear = 1; end 
        else 
            next_state = IDLE; 
    end 

// deleted 

    STOP: begin 
        sbc_clear = '0; 
        sbc_enable = 1'b1; 
        load_buffer = '0; 
        enable_timer = '0; 

        next_state = CHECK; 
    end 
        
    CHECK: begin 
        sbc_clear = '0; 
        sbc_enable = '0; 
        load_buffer = '0; 
        enable_timer = '0; 
        
        if (framing_error) 
            next_state = IDLE; 
        else 
            next_state = STORE; 
    end 

    STORE: begin 
        sbc_clear = '0; 
        sbc_enable = '0; 
        load_buffer = 1'b1; 
        enable_timer = '0; 

        next_state = IDLE; 
    end 
    endcase 
end 

endmodule 