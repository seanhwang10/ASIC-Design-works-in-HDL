// $Id: $
// File name:   controller.sv
// Created:     10/15/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: Controller Unit Module 

module controller
(
    input clk,
    input n_rst,
    input dr,
    input lc,
    input overflow,
    output reg cnt_up,
    output reg clear,
    output reg modwait,
    output reg [2:0] op,
    output reg [3:0] src1,
    output reg [3:0] src2,
    output reg [3:0] dest,
    output reg err
);

typedef enum bit [4:0] {IDLE, STORE, COUNT, ZERO, EIDLE, SORT1, SORT2, SORT3, SORT4, MUL1, MUL2, MUL3, MUL4, ADD1, ADD2, SUB1, SUB2,COEFF1,COEFF2, COEFF3, COEFF4, WAIT1, WAIT2, WAIT3} states;

states state; 
states next_state; 
//reg orig_modwait; 
reg next_modwait; 

always_ff @ (negedge n_rst, posedge clk) 
begin 
    if (!n_rst)
    begin 
        state <= IDLE; 
        modwait <= '0; 
    end 

    else 
    begin 
        state <= next_state; 
        modwait <= next_modwait; 
    end 
end 


always_comb
	begin

	cnt_up=1'b0;
    clear=1'b0;
	op=3'b0;
	src1=4'b0;
	src2=4'b0;
	dest=4'b0;
	err=1'b0;

    next_state=state;
	next_modwait=modwait;


	case (state)
		IDLE: 
        begin 
            clear = 1'b0;
            cnt_up = 1'b0;
            op = 3'b000;
            err = 1'b0;

            
            if (lc)
                begin
                next_state = COEFF1;
                    next_modwait = 1'b1;
            end

            else if (dr)
                begin
                next_state = STORE;
                    next_modwait = 1'b1;
                end

            else 
                begin
                next_state = IDLE;
                    next_modwait = 1'b0;
                end 

            end

		ZERO: 
        begin

            cnt_up=1'b0;
            clear=1'b0;
            op=3'b101;
            src1=4'b0;
            src2=4'b0;
            dest=4'b0;
            err=1'b0;

            next_state=SORT1;
                next_modwait=1;
		end				

		SORT1:
		begin

            cnt_up=1'b0;
            clear=1'b0;
            op=3'b001;
            src1=4'd8;
            dest=4'd9;
            err=1'b0;
            next_state=SORT2;
                next_modwait=1;

		end

		SORT2:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b001;
            src1=4'd7;
            dest=4'd8;
            err=1'b0;
    
            next_state=SORT3;
                next_modwait=1;
		end

		SORT3:
		begin

            cnt_up=1'b0;
            clear=1'b0;
            op=3'b001;
            src1=4'd6;
            dest=4'd7;
            err=1'b0;

            next_state=SORT4;
                next_modwait=1;
		end

/* 
... 
*/ 

		ADD1:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b100;
            src1=4'b0;
            src2=4'd11;
            dest=4'b0;
            err=1'b0;

		if (overflow)
			begin        	
			next_state=EIDLE;
			next_modwait=0;
			end 
		else 
			begin
			next_state=MUL3;
			next_modwait=1;
			end
		end

		MUL3:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b110;
            src1=4'd3;
            src2=4'd8;
            dest=4'd12;
            err=1'b0;

            next_state=SUB2;
            next_modwait= 1;  
		end

		SUB2:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b101;
            src1=4'b0;
            src2=4'd12;
            dest=4'b0;
            err=1'b0;

		if (overflow) 
			begin
			next_modwait=0;
			next_state=EIDLE;
			end 
		else 
			begin
			next_state=MUL4;
			next_modwait=1;
			end
		end

		MUL4:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b110;
            src1=4'd4;
            src2=4'd9;
            dest=4'd13;
            err=1'b0;

            next_state=ADD2;
                next_modwait=1;

		end

		ADD2:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b100;
            src1=4'b0;
            src2=4'd13;
            dest=4'b0;
            err=1'b0;

		if (overflow) 
			begin
			next_state=EIDLE;
			next_modwait=0;
			end 
		else 
			begin
			next_state=COUNT;
			next_modwait=1;
			end
		end

		COUNT:
		begin
            cnt_up=1'b1;
            clear=1'b0;
            op=3'b000;
            src1=4'b0;
            src2=4'b0;
            dest=4'b0;
            err=1'b0;

            next_state=IDLE;
		end

		EIDLE:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b0;
            src1=4'b0;
            src2=4'b0;
            dest=4'b0;
            err=1'b1;

		if (dr)
			begin
			next_state=STORE;
			next_modwait=1;
			end
		else 
			begin
			next_state=EIDLE;
			next_modwait=0;
			end
		end

        COEFF1:
		begin
            cnt_up=1'b0;
            clear=1'b1;
            op=3'b011;
            dest=4'd1;
            err=1'b0;

            next_state=WAIT1;
                next_modwait=0;
		end		

		WAIT1:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b0;
            src1=4'b0;
            src2=4'b0;
            dest=4'b0;
            err=1'b0;

		if (lc)
			begin
			next_state=COEFF2;
			next_modwait=1;
			end
		else
			begin
			next_state=WAIT1;
			next_modwait=0;
			end

		end		

		COEFF2:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b011;
            dest=4'd2;
            err=1'b0;

            next_state=WAIT2;
            next_modwait=0;
		end

		WAIT2:
		begin 
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b0;
            src1=4'b0;
            src2=4'b0;
            dest=4'b0;
            err=1'b0;         

		if (lc)
			begin
			next_state=COEFF3;
			next_modwait=1;
			end
		else
			begin
			next_state=WAIT2;
			next_modwait=0;
			end
		end

		COEFF3:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b011;
            dest=4'd3;
            err=1'b0;

            next_state=WAIT3;
            next_modwait=0;
		end

		WAIT3:
		begin 
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b0;
            src1=4'b0;
            src2=4'b0;
            dest=4'b0;
            err=1'b0;            
		if (lc)
			begin
			next_state=COEFF4;
			next_modwait=1;
			end
		else
			begin
			next_state=WAIT3;
			next_modwait=0;
			end
		end

		COEFF4:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b011;
            dest=4'd4;
            err=1'b0;

            next_state=IDLE;
		end

		STORE:
		begin
            cnt_up=1'b0;
            clear=1'b0;
            op=3'b010;
            dest=4'd5;
            err=1'b0;            
		if (dr)
			begin
			next_state=ZERO;
			next_modwait=1;
			end
		else 
			begin
			next_state=EIDLE;
			next_modwait=0;
			end
		end
	endcase
	end

endmodule