// $Id: $
// File name:   coefficient_loader.sv
// Created:     10/28/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Coefficient Loader module 

module coefficient_loader
(
    input logic clk,
    input logic n_reset,
    input logic new_coefficient_set,
    input logic modwait,
    output logic clear_coefficient,
    output logic load_coeff,
    output logic [1:0] coefficient_num
);

typedef enum bit[3:0] {IDLE, LOAD0, CHECK0, LOAD1, CHECK1, LOAD2, CHECK2, LOAD3, CHECK3, CLEAR} state_type;
state_type current_state;
state_type next_state;

always_ff @ (posedge clk, negedge n_reset) 
begin: REGISTER 
    if(!n_reset) 
        current_state <= IDLE;
    else 
        current_state <= next_state;
end

always_comb 
begin: NEXT_STATE_LOGIC

    next_state = current_state;
    load_coeff = 0;
    coefficient_num = '0;
    clear_coefficient = '0; 


    case(current_state)
        IDLE: 
        begin
            load_coeff = 0;
            coefficient_num = '0;
            clear_coefficient = '0; 
            if(new_coefficient_set)
                next_state = LOAD0;
        end

        LOAD0: 
        begin 
            load_coeff = 1;
            coefficient_num = 2'b00;
            clear_coefficient = '0; 
            next_state = CHECK0;
        end 


        CHECK0: 
        begin
            load_coeff = 0;
            coefficient_num = 2'b00;
            clear_coefficient = '0; 

            if(!modwait)
                next_state = LOAD1;
        end

        LOAD1: 
        begin 
            load_coeff = 1;
            coefficient_num = 2'b01;
            clear_coefficient = '0; 

            next_state = CHECK1;
        end 


        CHECK1: 
        begin
            load_coeff = 0;
            coefficient_num = 2'b01;
            clear_coefficient = '0; 

            if(!modwait)
                next_state = LOAD2;
        end


        LOAD2: 
        begin 
            load_coeff = 1;
            coefficient_num = 2'b10;
            clear_coefficient = '0; 

            next_state = CHECK2;
        end 

        CHECK2: 
        begin
            load_coeff = 0;
            coefficient_num = 2'b10;
            clear_coefficient = '0; 

            if(!modwait)
                next_state = LOAD3;
        end

        LOAD3: 
        begin 
            load_coeff = 1;
            coefficient_num = 2'b11;
            clear_coefficient = '0; 

            next_state = CHECK3;
        end 

        CHECK3: 
        begin
            load_coeff = 0;
            coefficient_num = 2'b11;
            clear_coefficient = '0; 

            if(!modwait)
                next_state = CLEAR;
        end

        CLEAR: 
        begin 
            load_coeff = 0;
            coefficient_num = 2'b00;
            clear_coefficient = 1; 

            next_state = IDLE;
        end 
    endcase
end

endmodule