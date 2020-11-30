/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Oct 23 01:23:09 2020
/////////////////////////////////////////////////////////////


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n33, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23;
  wire   [3:0] current_state;

  DFFSR \current_state_reg[0]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        current_state[2]) );
  NOR2X1 U6 ( .A(n4), .B(n5), .Y(sbc_clear) );
  NAND2X1 U7 ( .A(n6), .B(n7), .Y(n5) );
  INVX1 U8 ( .A(start_bit_detected), .Y(n4) );
  OAI21X1 U9 ( .A(n8), .B(n9), .C(n10), .Y(n22) );
  AND2X1 U10 ( .A(n11), .B(n12), .Y(n10) );
  OAI21X1 U11 ( .A(current_state[0]), .B(start_bit_detected), .C(n6), .Y(n11)
         );
  INVX1 U12 ( .A(packet_done), .Y(n9) );
  NAND3X1 U13 ( .A(n12), .B(n13), .C(n14), .Y(n23) );
  INVX1 U14 ( .A(sbc_enable), .Y(n13) );
  INVX1 U15 ( .A(n15), .Y(n12) );
  OR2X1 U16 ( .A(n15), .B(n16), .Y(n33) );
  MUX2X1 U17 ( .B(current_state[1]), .A(n17), .S(n7), .Y(n16) );
  NAND3X1 U18 ( .A(n8), .B(n18), .C(n19), .Y(n17) );
  INVX1 U19 ( .A(n6), .Y(n18) );
  NOR2X1 U20 ( .A(current_state[2]), .B(current_state[1]), .Y(n6) );
  NOR2X1 U21 ( .A(framing_error), .B(n19), .Y(n15) );
  NAND3X1 U22 ( .A(current_state[2]), .B(n7), .C(current_state[1]), .Y(n19) );
  OAI21X1 U23 ( .A(packet_done), .B(n8), .C(n14), .Y(enable_timer) );
  NAND3X1 U24 ( .A(current_state[1]), .B(n20), .C(current_state[0]), .Y(n14)
         );
  NAND2X1 U25 ( .A(sbc_enable), .B(n7), .Y(n8) );
  NOR2X1 U26 ( .A(n20), .B(current_state[1]), .Y(sbc_enable) );
  INVX1 U27 ( .A(current_state[2]), .Y(n20) );
  NOR2X1 U28 ( .A(n7), .B(n21), .Y(load_buffer) );
  NAND2X1 U29 ( .A(current_state[1]), .B(current_state[2]), .Y(n21) );
  INVX1 U30 ( .A(current_state[0]), .Y(n7) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   flag, n44, n45, n46, n47, n1, n2, n3, n4, n5, n6, n7, n8, n9, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n48, n49, n50, n51;

  DFFSR \count_out_reg[0]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n47) );
  OAI21X1 U9 ( .A(n5), .B(n2), .C(n6), .Y(n46) );
  MUX2X1 U10 ( .B(n7), .A(n8), .S(n9), .Y(n6) );
  NOR2X1 U11 ( .A(clear), .B(n3), .Y(n8) );
  NOR2X1 U12 ( .A(n4), .B(n15), .Y(n7) );
  OAI21X1 U13 ( .A(n16), .B(n2), .C(n17), .Y(n45) );
  MUX2X1 U14 ( .B(n18), .A(n19), .S(n20), .Y(n17) );
  NOR2X1 U15 ( .A(clear), .B(n21), .Y(n19) );
  NOR2X1 U16 ( .A(n4), .B(n22), .Y(n18) );
  OAI22X1 U17 ( .A(n23), .B(n2), .C(n24), .D(n4), .Y(n44) );
  NAND2X1 U18 ( .A(n2), .B(n25), .Y(n4) );
  INVX1 U19 ( .A(clear), .Y(n25) );
  AOI22X1 U20 ( .A(count_out[3]), .B(n26), .C(n21), .D(n20), .Y(n24) );
  NOR2X1 U21 ( .A(n16), .B(n27), .Y(n20) );
  INVX1 U22 ( .A(n22), .Y(n21) );
  NAND2X1 U23 ( .A(n3), .B(n9), .Y(n22) );
  NOR2X1 U24 ( .A(n5), .B(n27), .Y(n9) );
  INVX1 U25 ( .A(count_out[1]), .Y(n5) );
  INVX1 U26 ( .A(n15), .Y(n3) );
  NAND2X1 U27 ( .A(count_out[0]), .B(n26), .Y(n15) );
  OR2X1 U28 ( .A(count_enable), .B(clear), .Y(n2) );
  NOR2X1 U29 ( .A(n28), .B(n29), .Y(flag) );
  NAND3X1 U30 ( .A(n30), .B(count_enable), .C(n31), .Y(n29) );
  MUX2X1 U31 ( .B(n32), .A(n33), .S(n34), .Y(n31) );
  NOR2X1 U32 ( .A(count_out[2]), .B(n35), .Y(n33) );
  OAI21X1 U33 ( .A(rollover_val[2]), .B(count_out[2]), .C(count_out[1]), .Y(
        n32) );
  MUX2X1 U34 ( .B(n1), .A(n36), .S(rollover_val[0]), .Y(n30) );
  NOR2X1 U35 ( .A(count_out[1]), .B(n37), .Y(n36) );
  INVX1 U36 ( .A(count_out[0]), .Y(n1) );
  OAI21X1 U37 ( .A(n38), .B(n39), .C(n40), .Y(n28) );
  NOR2X1 U38 ( .A(clear), .B(n27), .Y(n40) );
  INVX1 U39 ( .A(n26), .Y(n27) );
  OAI21X1 U40 ( .A(count_out[3]), .B(n38), .C(n41), .Y(n26) );
  OAI21X1 U41 ( .A(rollover_val[3]), .B(n23), .C(n42), .Y(n41) );
  OAI22X1 U42 ( .A(n43), .B(n48), .C(count_out[2]), .D(n35), .Y(n42) );
  INVX1 U43 ( .A(rollover_val[2]), .Y(n35) );
  OAI21X1 U44 ( .A(rollover_val[2]), .B(n16), .C(n49), .Y(n48) );
  OAI21X1 U45 ( .A(count_out[1]), .B(n37), .C(count_out[0]), .Y(n49) );
  INVX1 U46 ( .A(count_out[2]), .Y(n16) );
  NAND2X1 U47 ( .A(n50), .B(n34), .Y(n43) );
  OAI21X1 U48 ( .A(n51), .B(n37), .C(count_out[1]), .Y(n50) );
  OAI21X1 U49 ( .A(rollover_val[2]), .B(n34), .C(n23), .Y(n39) );
  INVX1 U50 ( .A(count_out[3]), .Y(n23) );
  NAND2X1 U51 ( .A(n51), .B(n37), .Y(n34) );
  INVX1 U52 ( .A(rollover_val[1]), .Y(n37) );
  INVX1 U53 ( .A(rollover_val[0]), .Y(n51) );
  INVX1 U54 ( .A(rollover_val[3]), .Y(n38) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   flag, n1, n2, n3, n4, n5, n6, n7, n8, n9, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n48, n49, n50, n51,
         n52, n53, n54, n55;

  DFFSR \count_out_reg[0]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI22X1 U7 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(n52) );
  OAI21X1 U9 ( .A(n5), .B(n2), .C(n6), .Y(n53) );
  MUX2X1 U10 ( .B(n7), .A(n8), .S(n9), .Y(n6) );
  NOR2X1 U11 ( .A(clear), .B(n3), .Y(n8) );
  NOR2X1 U12 ( .A(n4), .B(n15), .Y(n7) );
  OAI21X1 U13 ( .A(n16), .B(n2), .C(n17), .Y(n54) );
  MUX2X1 U14 ( .B(n18), .A(n19), .S(n20), .Y(n17) );
  NOR2X1 U15 ( .A(clear), .B(n21), .Y(n19) );
  NOR2X1 U16 ( .A(n4), .B(n22), .Y(n18) );
  OAI22X1 U17 ( .A(n23), .B(n2), .C(n24), .D(n4), .Y(n55) );
  NAND2X1 U18 ( .A(n2), .B(n25), .Y(n4) );
  INVX1 U19 ( .A(clear), .Y(n25) );
  AOI22X1 U20 ( .A(count_out[3]), .B(n26), .C(n21), .D(n20), .Y(n24) );
  NOR2X1 U21 ( .A(n16), .B(n27), .Y(n20) );
  INVX1 U22 ( .A(n22), .Y(n21) );
  NAND2X1 U23 ( .A(n3), .B(n9), .Y(n22) );
  NOR2X1 U24 ( .A(n5), .B(n27), .Y(n9) );
  INVX1 U25 ( .A(count_out[1]), .Y(n5) );
  INVX1 U26 ( .A(n15), .Y(n3) );
  NAND2X1 U27 ( .A(count_out[0]), .B(n26), .Y(n15) );
  OR2X1 U28 ( .A(count_enable), .B(clear), .Y(n2) );
  NOR2X1 U29 ( .A(n28), .B(n29), .Y(flag) );
  NAND3X1 U30 ( .A(n30), .B(count_enable), .C(n31), .Y(n29) );
  MUX2X1 U31 ( .B(n32), .A(n33), .S(n34), .Y(n31) );
  NOR2X1 U32 ( .A(count_out[2]), .B(n35), .Y(n33) );
  OAI21X1 U33 ( .A(rollover_val[2]), .B(count_out[2]), .C(count_out[1]), .Y(
        n32) );
  MUX2X1 U34 ( .B(n1), .A(n36), .S(rollover_val[0]), .Y(n30) );
  NOR2X1 U35 ( .A(count_out[1]), .B(n37), .Y(n36) );
  INVX1 U36 ( .A(count_out[0]), .Y(n1) );
  OAI21X1 U37 ( .A(n38), .B(n39), .C(n40), .Y(n28) );
  NOR2X1 U38 ( .A(clear), .B(n27), .Y(n40) );
  INVX1 U39 ( .A(n26), .Y(n27) );
  OAI21X1 U40 ( .A(count_out[3]), .B(n38), .C(n41), .Y(n26) );
  OAI21X1 U41 ( .A(rollover_val[3]), .B(n23), .C(n42), .Y(n41) );
  OAI22X1 U42 ( .A(n43), .B(n48), .C(count_out[2]), .D(n35), .Y(n42) );
  INVX1 U43 ( .A(rollover_val[2]), .Y(n35) );
  OAI21X1 U44 ( .A(rollover_val[2]), .B(n16), .C(n49), .Y(n48) );
  OAI21X1 U45 ( .A(count_out[1]), .B(n37), .C(count_out[0]), .Y(n49) );
  INVX1 U46 ( .A(count_out[2]), .Y(n16) );
  NAND2X1 U47 ( .A(n50), .B(n34), .Y(n43) );
  OAI21X1 U48 ( .A(n51), .B(n37), .C(count_out[1]), .Y(n50) );
  OAI21X1 U49 ( .A(rollover_val[2]), .B(n34), .C(n23), .Y(n39) );
  INVX1 U50 ( .A(count_out[3]), .Y(n23) );
  NAND2X1 U51 ( .A(n51), .B(n37), .Y(n34) );
  INVX1 U52 ( .A(rollover_val[1]), .Y(n37) );
  INVX1 U53 ( .A(rollover_val[0]), .Y(n51) );
  INVX1 U54 ( .A(rollover_val[3]), .Y(n38) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;


  flex_counter_1 CLOCK10 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_enable) );
  flex_counter_0 BIT9 ( .clk(clk), .n_rst(n_rst), .clear(packet_done), 
        .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_enable, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_enable, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_enable), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   start_bit_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, stop_bit, shift_enable;
  wire   [7:0] packet_data;

  start_bit_det START_BIT_DETECTOR ( .clk(clk), .n_rst(n_rst), .serial_in(
        serial_in), .start_bit_detected(start_bit_detected) );
  rcu RECEIVER_CONTROL_UNIT ( .clk(clk), .n_rst(n_rst), .start_bit_detected(
        start_bit_detected), .packet_done(packet_done), .framing_error(
        framing_error), .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), 
        .load_buffer(load_buffer), .enable_timer(enable_timer) );
  stop_bit_chk STOP_BIT_CHECKER ( .clk(clk), .n_rst(n_rst), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit), 
        .framing_error(framing_error) );
  timer TIMING_CONTROLLER ( .clk(clk), .n_rst(n_rst), .enable_timer(
        enable_timer), .shift_enable(shift_enable), .packet_done(packet_done)
         );
  sr_9bit SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .serial_in(serial_in), .packet_data(packet_data), 
        .stop_bit(stop_bit) );
  rx_data_buff RX_DATA_BUFFER ( .clk(clk), .n_rst(n_rst), .load_buffer(
        load_buffer), .packet_data(packet_data), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error) );
endmodule

