// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     10/28/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: AHB lite slave module 

module ahb_lite_slave
(
  //REMOVED FOR VIEWING  
);

logic next_data_ready;

logic [3:0] local_haddr;
logic local_hwrite;
logic local_hsel;
logic [1:0] local_htrans;
logic local_hsize;

logic [15:0] filter_status;
logic [15:0] temp_sample_data; 
logic [15:0] next_sample_data;

logic [15:0] f_0;
logic [15:0] f_1;
logic [15:0] f_2;
logic [15:0] f_3;
logic [15:0] next_f_0;
logic [15:0] next_f_1;
logic [15:0] next_f_2;
logic [15:0] next_f_3;

logic [7:0] new_coeff;
logic [7:0] next_new_coeff;

assign new_coefficient_set = new_coeff[0]; 

always_comb 
begin: COMBINATIONAL
    hresp = 0;
    next_sample_data = sample_data;
    next_f_0 = f_0;
    next_f_1 = f_1;
    next_f_2 = f_2;
    next_f_3 = f_3;
    next_new_coeff = new_coeff;
    next_data_ready = data_ready;

    if(haddr == 4'hf) begin 
      hresp = 1;
    end 
    else if(hwrite && (haddr == 4'h0 || haddr == 4'h1 || haddr == 4'h2 || haddr == 4'h3)) begin 
      hresp = 1;
    end 

    if(local_hwrite && local_hsel && local_htrans == 2'd2) begin
      if (!local_hsize) begin 
      case(local_haddr)
        4'h4: next_sample_data = {sample_data[15:8] ,hwdata[7:0]};
        4'h5: next_sample_data = {hwdata[7:0], sample_data[7:0]};
        4'h6: next_f_0 = {f_0[15:8], hwdata[7:0]};
        4'h7: next_f_0 = {hwdata[7:0], f_0[7:0]};
        4'h8: next_f_1 = {f_1[15:8], hwdata[7:0]};
        4'h9: next_f_1 = {hwdata[7:0], f_1[7:0]};
        4'ha: next_f_2 = {f_2[15:8], hwdata[7:0]};
        4'hb: next_f_2 = {hwdata[7:0], f_2[7:0]};
        4'hc: next_f_3 = {f_3[15:8], hwdata[7:0]};
        4'hd: next_f_3 = {hwdata[7:0], f_3[7:0]};
        4'he: next_new_coeff = hwdata[7:0];
      endcase
      end 
    
      else if(local_hsize) begin
        case(local_haddr)
          4'h4: next_sample_data = hwdata;
          4'h5: next_sample_data = hwdata;
          4'h6: next_f_0 = hwdata;
          4'h7: next_f_0 = hwdata;
          4'h8: next_f_1 = hwdata;
          4'h9: next_f_1 = hwdata;
          4'ha: next_f_2 = hwdata;
          4'hb: next_f_2 = hwdata;
          4'hc: next_f_3 = hwdata;
          4'hd: next_f_3 = hwdata;
          4'he: next_new_coeff = hwdata[7:0];
        endcase
      end 
    end

  /* 

  ..... REMOVED FOR VIEWING

  */ 


  end 


always_ff @ (negedge n_rst, posedge clk) 
begin: REGISTER 
    if (!n_rst)
    begin
        data_ready <= '0;
        local_haddr <= '0; 
        local_hwrite <= '0;
        local_hsel <= '0;
        local_htrans <= '0;
        local_hsize <= '0;
        sample_data <= '0;
        new_coeff <= '0;
        f_0 <= '0;
        f_1 <= '0;
        f_2 <= '0;
        f_3 <= '0;
    end 

    else 
    begin 
        data_ready <= next_data_ready;
        local_haddr <= haddr; 
        local_hwrite <= hwrite;
        local_hsel <= hsel;
        local_htrans <= htrans;
        local_hsize <= hsize;
        sample_data <= next_sample_data;
        new_coeff <= next_new_coeff;
        f_0 <= next_f_0;
        f_1 <= next_f_1;
        f_2 <= next_f_2;
        f_3 <= next_f_3;
    end 
end 


endmodule 

