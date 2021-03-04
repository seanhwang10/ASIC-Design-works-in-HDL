/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Oct 23 01:26:30 2020
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, data_read, psel, paddr, penable, pwrite, pwdata, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   N21, N22, N23, N24, N25, N26, N27, N28, N93, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135;
  wire   [7:0] temp_rx_data;
  wire   [7:0] next_prdata;
  wire   [7:0] next_temp_data_size;
  wire   [7:0] next_bit_period_0;
  wire   [5:0] next_bit_period_1;
  assign pslverr = N93;

  DFFSR \bit_period_1_reg[5]  ( .D(next_bit_period_1[5]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[13]) );
  DFFSR \bit_period_1_reg[4]  ( .D(next_bit_period_1[4]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[12]) );
  DFFSR \bit_period_1_reg[3]  ( .D(next_bit_period_1[3]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[11]) );
  DFFSR \bit_period_1_reg[2]  ( .D(next_bit_period_1[2]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[10]) );
  DFFSR \bit_period_1_reg[1]  ( .D(next_bit_period_1[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_1_reg[0]  ( .D(next_bit_period_1[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[8]) );
  DFFSR data_read_reg ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(data_read) );
  DFFSR \temp_data_size_reg[3]  ( .D(next_temp_data_size[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[3]) );
  DFFSR \temp_data_size_reg[2]  ( .D(next_temp_data_size[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[2]) );
  DFFSR \temp_data_size_reg[1]  ( .D(next_temp_data_size[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[1]) );
  DFFSR \temp_data_size_reg[0]  ( .D(next_temp_data_size[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[0]) );
  DFFSR \temp_rx_data_reg[7]  ( .D(N28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[7]) );
  DFFSR \temp_rx_data_reg[6]  ( .D(N27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[6]) );
  DFFSR \temp_rx_data_reg[5]  ( .D(N26), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[5]) );
  DFFSR \temp_rx_data_reg[0]  ( .D(N21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[0]) );
  DFFSR \temp_rx_data_reg[1]  ( .D(N22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[1]) );
  DFFSR \temp_rx_data_reg[2]  ( .D(N23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[2]) );
  DFFSR \temp_rx_data_reg[3]  ( .D(N24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[3]) );
  DFFSR \temp_rx_data_reg[4]  ( .D(N25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        temp_rx_data[4]) );
  DFFSR \bit_period_0_reg[7]  ( .D(next_bit_period_0[7]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[7]) );
  DFFSR \prdata_reg[7]  ( .D(next_prdata[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[7]) );
  DFFSR \bit_period_0_reg[6]  ( .D(next_bit_period_0[6]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[6]) );
  DFFSR \prdata_reg[6]  ( .D(next_prdata[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[6]) );
  DFFSR \bit_period_0_reg[5]  ( .D(next_bit_period_0[5]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[5]) );
  DFFSR \prdata_reg[5]  ( .D(next_prdata[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[5]) );
  DFFSR \bit_period_0_reg[4]  ( .D(next_bit_period_0[4]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[4]) );
  DFFSR \prdata_reg[4]  ( .D(next_prdata[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[4]) );
  DFFSR \bit_period_0_reg[3]  ( .D(next_bit_period_0[3]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[3]) );
  DFFSR \prdata_reg[3]  ( .D(next_prdata[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[3]) );
  DFFSR \bit_period_0_reg[2]  ( .D(next_bit_period_0[2]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[2]) );
  DFFSR \prdata_reg[2]  ( .D(next_prdata[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[2]) );
  DFFSR \bit_period_0_reg[1]  ( .D(next_bit_period_0[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[1]) );
  DFFSR \prdata_reg[1]  ( .D(next_prdata[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[1]) );
  DFFSR \bit_period_0_reg[0]  ( .D(next_bit_period_0[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(bit_period[0]) );
  DFFSR \prdata_reg[0]  ( .D(next_prdata[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prdata[0]) );
  INVX1 U31 ( .A(n36), .Y(next_temp_data_size[3]) );
  AOI22X1 U32 ( .A(n37), .B(pwdata[3]), .C(n38), .D(data_size[3]), .Y(n36) );
  OAI22X1 U33 ( .A(n38), .B(n39), .C(n37), .D(n40), .Y(next_temp_data_size[2])
         );
  OAI22X1 U34 ( .A(n38), .B(n41), .C(n37), .D(n42), .Y(next_temp_data_size[1])
         );
  OAI22X1 U42 ( .A(n38), .B(n43), .C(n37), .D(n44), .Y(next_temp_data_size[0])
         );
  INVX1 U43 ( .A(n38), .Y(n37) );
  NAND3X1 U44 ( .A(n45), .B(n46), .C(n47), .Y(n38) );
  NOR2X1 U45 ( .A(n48), .B(n49), .Y(n47) );
  OAI21X1 U46 ( .A(n50), .B(n51), .C(n52), .Y(next_prdata[7]) );
  AOI22X1 U47 ( .A(prdata[7]), .B(n53), .C(bit_period[7]), .D(n54), .Y(n52) );
  INVX1 U48 ( .A(temp_rx_data[7]), .Y(n51) );
  OAI21X1 U49 ( .A(n50), .B(n55), .C(n56), .Y(next_prdata[6]) );
  AOI22X1 U50 ( .A(prdata[6]), .B(n53), .C(bit_period[6]), .D(n54), .Y(n56) );
  INVX1 U51 ( .A(temp_rx_data[6]), .Y(n55) );
  NAND2X1 U52 ( .A(n57), .B(n58), .Y(next_prdata[5]) );
  AOI22X1 U53 ( .A(prdata[5]), .B(n53), .C(bit_period[13]), .D(n59), .Y(n58)
         );
  AOI22X1 U54 ( .A(bit_period[5]), .B(n54), .C(temp_rx_data[5]), .D(n135), .Y(
        n57) );
  NAND2X1 U55 ( .A(n60), .B(n61), .Y(next_prdata[4]) );
  AOI22X1 U56 ( .A(prdata[4]), .B(n53), .C(bit_period[12]), .D(n59), .Y(n61)
         );
  AOI22X1 U57 ( .A(bit_period[4]), .B(n54), .C(temp_rx_data[4]), .D(n135), .Y(
        n60) );
  NAND3X1 U58 ( .A(n62), .B(n63), .C(n64), .Y(next_prdata[3]) );
  AOI22X1 U59 ( .A(n65), .B(data_size[3]), .C(temp_rx_data[3]), .D(n135), .Y(
        n64) );
  NAND2X1 U60 ( .A(bit_period[3]), .B(n54), .Y(n63) );
  AOI22X1 U61 ( .A(prdata[3]), .B(n53), .C(bit_period[11]), .D(n59), .Y(n62)
         );
  NAND3X1 U62 ( .A(n66), .B(n67), .C(n68), .Y(next_prdata[2]) );
  AOI22X1 U63 ( .A(n65), .B(data_size[2]), .C(temp_rx_data[2]), .D(n135), .Y(
        n68) );
  INVX1 U64 ( .A(n69), .Y(n65) );
  NAND2X1 U65 ( .A(bit_period[2]), .B(n54), .Y(n67) );
  AOI22X1 U66 ( .A(prdata[2]), .B(n53), .C(bit_period[10]), .D(n59), .Y(n66)
         );
  NAND3X1 U67 ( .A(n70), .B(n71), .C(n72), .Y(next_prdata[1]) );
  AOI21X1 U68 ( .A(temp_rx_data[1]), .B(n135), .C(n73), .Y(n72) );
  OAI22X1 U69 ( .A(n42), .B(n69), .C(n74), .D(n75), .Y(n73) );
  INVX1 U70 ( .A(data_size[1]), .Y(n42) );
  NAND2X1 U71 ( .A(bit_period[9]), .B(n59), .Y(n71) );
  AOI22X1 U72 ( .A(n76), .B(overrun_error), .C(prdata[1]), .D(n53), .Y(n70) );
  NOR2X1 U73 ( .A(framing_error), .B(n77), .Y(n76) );
  NAND3X1 U74 ( .A(n78), .B(n79), .C(n80), .Y(next_prdata[0]) );
  AOI21X1 U75 ( .A(temp_rx_data[0]), .B(n135), .C(n81), .Y(n80) );
  OAI21X1 U76 ( .A(n44), .B(n69), .C(n82), .Y(n81) );
  NAND2X1 U77 ( .A(data_ready), .B(n83), .Y(n82) );
  INVX1 U78 ( .A(n84), .Y(n83) );
  INVX1 U79 ( .A(data_size[0]), .Y(n44) );
  AOI22X1 U80 ( .A(prdata[0]), .B(n53), .C(framing_error), .D(n85), .Y(n79) );
  INVX1 U81 ( .A(n77), .Y(n85) );
  NOR2X1 U82 ( .A(n86), .B(n87), .Y(n53) );
  NAND3X1 U83 ( .A(n88), .B(n84), .C(n77), .Y(n87) );
  NAND3X1 U84 ( .A(n89), .B(n90), .C(n91), .Y(n77) );
  NAND3X1 U85 ( .A(n92), .B(n90), .C(n89), .Y(n84) );
  NAND3X1 U86 ( .A(n74), .B(n50), .C(n69), .Y(n86) );
  NAND3X1 U87 ( .A(n92), .B(n90), .C(n93), .Y(n69) );
  AOI22X1 U88 ( .A(bit_period[8]), .B(n59), .C(bit_period[0]), .D(n54), .Y(n78) );
  INVX1 U89 ( .A(n74), .Y(n54) );
  NAND3X1 U90 ( .A(n89), .B(n92), .C(n94), .Y(n74) );
  INVX1 U91 ( .A(n88), .Y(n59) );
  NAND3X1 U92 ( .A(n94), .B(n89), .C(n91), .Y(n88) );
  INVX1 U93 ( .A(n92), .Y(n91) );
  INVX1 U94 ( .A(n95), .Y(next_bit_period_1[5]) );
  AOI22X1 U95 ( .A(n96), .B(pwdata[5]), .C(n97), .D(bit_period[13]), .Y(n95)
         );
  INVX1 U96 ( .A(n98), .Y(next_bit_period_1[4]) );
  AOI22X1 U97 ( .A(n96), .B(pwdata[4]), .C(n97), .D(bit_period[12]), .Y(n98)
         );
  INVX1 U98 ( .A(n99), .Y(next_bit_period_1[3]) );
  AOI22X1 U99 ( .A(pwdata[3]), .B(n96), .C(n97), .D(bit_period[11]), .Y(n99)
         );
  OAI22X1 U100 ( .A(n39), .B(n97), .C(n96), .D(n100), .Y(next_bit_period_1[2])
         );
  INVX1 U101 ( .A(bit_period[10]), .Y(n100) );
  INVX1 U102 ( .A(n101), .Y(next_bit_period_1[1]) );
  AOI22X1 U103 ( .A(pwdata[1]), .B(n96), .C(n97), .D(bit_period[9]), .Y(n101)
         );
  OAI22X1 U104 ( .A(n43), .B(n97), .C(n96), .D(n102), .Y(next_bit_period_1[0])
         );
  INVX1 U105 ( .A(bit_period[8]), .Y(n102) );
  INVX1 U106 ( .A(n97), .Y(n96) );
  NAND2X1 U107 ( .A(n103), .B(paddr[0]), .Y(n97) );
  OAI21X1 U108 ( .A(n104), .B(n105), .C(n106), .Y(next_bit_period_0[7]) );
  NAND2X1 U109 ( .A(pwdata[7]), .B(n104), .Y(n106) );
  INVX1 U110 ( .A(bit_period[7]), .Y(n105) );
  OAI21X1 U111 ( .A(n104), .B(n107), .C(n108), .Y(next_bit_period_0[6]) );
  NAND2X1 U112 ( .A(pwdata[6]), .B(n104), .Y(n108) );
  INVX1 U113 ( .A(bit_period[6]), .Y(n107) );
  INVX1 U114 ( .A(n109), .Y(next_bit_period_0[5]) );
  AOI22X1 U115 ( .A(pwdata[5]), .B(n104), .C(n110), .D(bit_period[5]), .Y(n109) );
  INVX1 U116 ( .A(n111), .Y(next_bit_period_0[4]) );
  AOI22X1 U117 ( .A(pwdata[4]), .B(n104), .C(n110), .D(bit_period[4]), .Y(n111) );
  INVX1 U118 ( .A(n112), .Y(next_bit_period_0[3]) );
  AOI22X1 U119 ( .A(pwdata[3]), .B(n104), .C(n110), .D(bit_period[3]), .Y(n112) );
  OAI22X1 U120 ( .A(n39), .B(n110), .C(n104), .D(n113), .Y(
        next_bit_period_0[2]) );
  INVX1 U121 ( .A(bit_period[2]), .Y(n113) );
  INVX1 U122 ( .A(pwdata[2]), .Y(n39) );
  OAI22X1 U123 ( .A(n41), .B(n110), .C(n104), .D(n75), .Y(next_bit_period_0[1]) );
  INVX1 U124 ( .A(bit_period[1]), .Y(n75) );
  INVX1 U125 ( .A(pwdata[1]), .Y(n41) );
  OAI22X1 U126 ( .A(n43), .B(n110), .C(n104), .D(n114), .Y(
        next_bit_period_0[0]) );
  INVX1 U127 ( .A(bit_period[0]), .Y(n114) );
  INVX1 U128 ( .A(n110), .Y(n104) );
  NAND2X1 U129 ( .A(n103), .B(n45), .Y(n110) );
  NOR3X1 U130 ( .A(n48), .B(paddr[2]), .C(n46), .Y(n103) );
  INVX1 U131 ( .A(paddr[1]), .Y(n46) );
  NAND3X1 U132 ( .A(psel), .B(penable), .C(pwrite), .Y(n48) );
  INVX1 U133 ( .A(pwdata[0]), .Y(n43) );
  INVX1 U134 ( .A(n50), .Y(n135) );
  NAND3X1 U135 ( .A(n93), .B(n92), .C(n94), .Y(n50) );
  INVX1 U136 ( .A(n90), .Y(n94) );
  NAND2X1 U137 ( .A(paddr[1]), .B(n115), .Y(n90) );
  NAND2X1 U138 ( .A(paddr[0]), .B(n115), .Y(n92) );
  INVX1 U139 ( .A(n89), .Y(n93) );
  NAND2X1 U140 ( .A(n115), .B(paddr[2]), .Y(n89) );
  AND2X1 U141 ( .A(psel), .B(n116), .Y(n115) );
  OAI22X1 U142 ( .A(n49), .B(n45), .C(n116), .D(n117), .Y(N93) );
  XNOR2X1 U143 ( .A(n49), .B(paddr[1]), .Y(n117) );
  INVX1 U144 ( .A(pwrite), .Y(n116) );
  INVX1 U145 ( .A(paddr[0]), .Y(n45) );
  INVX1 U146 ( .A(paddr[2]), .Y(n49) );
  NOR2X1 U147 ( .A(n118), .B(n119), .Y(N28) );
  OAI22X1 U148 ( .A(n119), .B(n120), .C(n118), .D(n121), .Y(N27) );
  OAI22X1 U149 ( .A(n121), .B(n120), .C(n118), .D(n122), .Y(N26) );
  OAI21X1 U150 ( .A(n119), .B(n123), .C(n124), .Y(N25) );
  AOI22X1 U151 ( .A(rx_data[4]), .B(n125), .C(rx_data[5]), .D(n126), .Y(n124)
         );
  INVX1 U152 ( .A(rx_data[7]), .Y(n119) );
  OAI21X1 U153 ( .A(n121), .B(n123), .C(n127), .Y(N24) );
  AOI22X1 U154 ( .A(rx_data[3]), .B(n125), .C(rx_data[4]), .D(n126), .Y(n127)
         );
  INVX1 U155 ( .A(rx_data[6]), .Y(n121) );
  OAI21X1 U156 ( .A(n122), .B(n123), .C(n128), .Y(N23) );
  AOI22X1 U157 ( .A(rx_data[2]), .B(n125), .C(rx_data[3]), .D(n126), .Y(n128)
         );
  INVX1 U158 ( .A(rx_data[5]), .Y(n122) );
  OAI21X1 U159 ( .A(n129), .B(n123), .C(n130), .Y(N22) );
  AOI22X1 U160 ( .A(rx_data[1]), .B(n125), .C(rx_data[2]), .D(n126), .Y(n130)
         );
  INVX1 U161 ( .A(rx_data[4]), .Y(n129) );
  OAI21X1 U162 ( .A(n123), .B(n131), .C(n132), .Y(N21) );
  AOI22X1 U163 ( .A(rx_data[0]), .B(n125), .C(rx_data[1]), .D(n126), .Y(n132)
         );
  INVX1 U164 ( .A(n120), .Y(n126) );
  INVX1 U165 ( .A(n118), .Y(n125) );
  NAND2X1 U166 ( .A(n123), .B(n120), .Y(n118) );
  NAND3X1 U167 ( .A(data_size[0]), .B(data_size[1]), .C(n133), .Y(n120) );
  NOR2X1 U168 ( .A(data_size[3]), .B(n40), .Y(n133) );
  INVX1 U169 ( .A(data_size[2]), .Y(n40) );
  INVX1 U170 ( .A(rx_data[3]), .Y(n131) );
  NAND3X1 U171 ( .A(data_size[0]), .B(data_size[2]), .C(n134), .Y(n123) );
  NOR2X1 U172 ( .A(data_size[3]), .B(data_size[1]), .Y(n134) );
endmodule


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


module flex_counter_NUM_CNT_BITS14_DW01_dec_0 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;
  wire   n2, n4, n6, n8, n10, n12, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;

  INVX2 U1 ( .A(n29), .Y(SUM[13]) );
  INVX2 U2 ( .A(A[12]), .Y(n2) );
  INVX2 U3 ( .A(n32), .Y(SUM[11]) );
  INVX2 U4 ( .A(A[10]), .Y(n4) );
  INVX2 U5 ( .A(n15), .Y(SUM[9]) );
  INVX2 U6 ( .A(A[8]), .Y(n6) );
  INVX2 U7 ( .A(n19), .Y(SUM[7]) );
  INVX2 U8 ( .A(A[6]), .Y(n8) );
  INVX2 U9 ( .A(n22), .Y(SUM[5]) );
  INVX2 U10 ( .A(A[4]), .Y(n10) );
  INVX2 U11 ( .A(n25), .Y(SUM[3]) );
  INVX2 U12 ( .A(A[2]), .Y(n12) );
  INVX2 U13 ( .A(n28), .Y(SUM[1]) );
  INVX2 U14 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U15 ( .A(n16), .B(A[9]), .C(n17), .Y(n15) );
  OAI21X1 U16 ( .A(n18), .B(n6), .C(n16), .Y(SUM[8]) );
  AOI21X1 U17 ( .A(n20), .B(A[7]), .C(n18), .Y(n19) );
  OAI21X1 U18 ( .A(n21), .B(n8), .C(n20), .Y(SUM[6]) );
  AOI21X1 U19 ( .A(n23), .B(A[5]), .C(n21), .Y(n22) );
  OAI21X1 U20 ( .A(n24), .B(n10), .C(n23), .Y(SUM[4]) );
  AOI21X1 U21 ( .A(n26), .B(A[3]), .C(n24), .Y(n25) );
  OAI21X1 U22 ( .A(n27), .B(n12), .C(n26), .Y(SUM[2]) );
  AOI21X1 U23 ( .A(A[0]), .B(A[1]), .C(n27), .Y(n28) );
  AOI21X1 U24 ( .A(n30), .B(A[13]), .C(SUM[14]), .Y(n29) );
  NOR2X1 U25 ( .A(n30), .B(A[13]), .Y(SUM[14]) );
  OAI21X1 U26 ( .A(n31), .B(n2), .C(n30), .Y(SUM[12]) );
  NAND2X1 U27 ( .A(n31), .B(n2), .Y(n30) );
  AOI21X1 U28 ( .A(n33), .B(A[11]), .C(n31), .Y(n32) );
  NOR2X1 U29 ( .A(n33), .B(A[11]), .Y(n31) );
  OAI21X1 U30 ( .A(n17), .B(n4), .C(n33), .Y(SUM[10]) );
  NAND2X1 U31 ( .A(n17), .B(n4), .Y(n33) );
  NOR2X1 U32 ( .A(n16), .B(A[9]), .Y(n17) );
  NAND2X1 U33 ( .A(n18), .B(n6), .Y(n16) );
  NOR2X1 U34 ( .A(n20), .B(A[7]), .Y(n18) );
  NAND2X1 U35 ( .A(n21), .B(n8), .Y(n20) );
  NOR2X1 U36 ( .A(n23), .B(A[5]), .Y(n21) );
  NAND2X1 U37 ( .A(n24), .B(n10), .Y(n23) );
  NOR2X1 U38 ( .A(n26), .B(A[3]), .Y(n24) );
  NAND2X1 U39 ( .A(n27), .B(n12), .Y(n26) );
  NOR2X1 U40 ( .A(A[1]), .B(A[0]), .Y(n27) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   flag, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53,
         N54, N55, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n1, n2, n4, n5, n6, n7, n8, n9, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129;

  DFFSR \count_out_reg[0]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n92), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n90), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[10]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[11]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[12]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR \count_out_reg[13]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  DFFSR rollover_flag_reg ( .D(flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS14_DW01_dec_0 sub_48 ( .A({1'b0, rollover_val}), 
        .SUM({N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, 
        N10, N9}) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 add_47_aco ( .A({N55, N54, N53, N52, 
        N51, N50, N49, N48, N47, N46, N45, N44, N43, N42}), .SUM({N38, N37, 
        N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25}) );
  INVX2 U8 ( .A(n47), .Y(n1) );
  OAI21X1 U20 ( .A(n1), .B(n2), .C(n4), .Y(n96) );
  NAND2X1 U21 ( .A(N25), .B(n5), .Y(n4) );
  OAI21X1 U22 ( .A(n1), .B(n6), .C(n7), .Y(n95) );
  NAND2X1 U23 ( .A(N26), .B(n5), .Y(n7) );
  OAI21X1 U24 ( .A(n1), .B(n8), .C(n9), .Y(n94) );
  NAND2X1 U25 ( .A(N27), .B(n5), .Y(n9) );
  OAI21X1 U26 ( .A(n1), .B(n25), .C(n26), .Y(n93) );
  NAND2X1 U27 ( .A(N28), .B(n5), .Y(n26) );
  OAI21X1 U28 ( .A(n1), .B(n27), .C(n28), .Y(n92) );
  NAND2X1 U29 ( .A(N29), .B(n5), .Y(n28) );
  OAI21X1 U30 ( .A(n1), .B(n29), .C(n30), .Y(n91) );
  NAND2X1 U31 ( .A(N30), .B(n5), .Y(n30) );
  OAI21X1 U32 ( .A(n1), .B(n31), .C(n32), .Y(n90) );
  NAND2X1 U33 ( .A(N31), .B(n5), .Y(n32) );
  OAI21X1 U34 ( .A(n1), .B(n33), .C(n34), .Y(n89) );
  NAND2X1 U35 ( .A(N32), .B(n5), .Y(n34) );
  OAI21X1 U36 ( .A(n1), .B(n35), .C(n36), .Y(n88) );
  NAND2X1 U37 ( .A(N33), .B(n5), .Y(n36) );
  OAI21X1 U38 ( .A(n1), .B(n37), .C(n38), .Y(n87) );
  NAND2X1 U39 ( .A(N34), .B(n5), .Y(n38) );
  OAI21X1 U40 ( .A(n1), .B(n39), .C(n40), .Y(n86) );
  NAND2X1 U41 ( .A(N35), .B(n5), .Y(n40) );
  OAI21X1 U42 ( .A(n1), .B(n41), .C(n42), .Y(n85) );
  NAND2X1 U43 ( .A(N36), .B(n5), .Y(n42) );
  OAI21X1 U44 ( .A(n1), .B(n43), .C(n44), .Y(n84) );
  NAND2X1 U45 ( .A(N37), .B(n5), .Y(n44) );
  OAI21X1 U46 ( .A(n1), .B(n45), .C(n46), .Y(n83) );
  NAND2X1 U47 ( .A(N38), .B(n5), .Y(n46) );
  NOR2X1 U48 ( .A(n47), .B(clear), .Y(n5) );
  NOR2X1 U49 ( .A(count_enable), .B(clear), .Y(n47) );
  AND2X1 U50 ( .A(n48), .B(n49), .Y(flag) );
  NOR2X1 U51 ( .A(n50), .B(n51), .Y(n49) );
  NAND3X1 U52 ( .A(n52), .B(n53), .C(n54), .Y(n51) );
  NOR2X1 U53 ( .A(n55), .B(n56), .Y(n54) );
  XOR2X1 U54 ( .A(count_out[6]), .B(N15), .Y(n56) );
  XOR2X1 U55 ( .A(count_out[5]), .B(N14), .Y(n55) );
  XOR2X1 U56 ( .A(n2), .B(N9), .Y(n53) );
  XOR2X1 U57 ( .A(n25), .B(N12), .Y(n52) );
  NAND3X1 U58 ( .A(n57), .B(count_enable), .C(n58), .Y(n50) );
  NOR2X1 U59 ( .A(n59), .B(n60), .Y(n58) );
  XOR2X1 U60 ( .A(count_out[2]), .B(N11), .Y(n60) );
  XOR2X1 U61 ( .A(count_out[1]), .B(N10), .Y(n59) );
  NOR2X1 U62 ( .A(clear), .B(N23), .Y(n57) );
  NOR2X1 U63 ( .A(n61), .B(n62), .Y(n48) );
  NAND3X1 U64 ( .A(n63), .B(n64), .C(n65), .Y(n62) );
  NOR2X1 U65 ( .A(n66), .B(n67), .Y(n65) );
  XOR2X1 U66 ( .A(count_out[10]), .B(N19), .Y(n67) );
  XOR2X1 U67 ( .A(count_out[9]), .B(N18), .Y(n66) );
  XOR2X1 U68 ( .A(n43), .B(N21), .Y(n64) );
  MUX2X1 U69 ( .B(n68), .A(n69), .S(N20), .Y(n63) );
  NAND2X1 U70 ( .A(n70), .B(n41), .Y(n68) );
  NAND3X1 U71 ( .A(n71), .B(n72), .C(n73), .Y(n61) );
  NOR2X1 U72 ( .A(n74), .B(n75), .Y(n73) );
  XOR2X1 U73 ( .A(count_out[7]), .B(N16), .Y(n75) );
  XOR2X1 U74 ( .A(count_out[4]), .B(N13), .Y(n74) );
  XOR2X1 U75 ( .A(n45), .B(N22), .Y(n72) );
  XOR2X1 U76 ( .A(n35), .B(N17), .Y(n71) );
  NOR2X1 U77 ( .A(n76), .B(n45), .Y(N55) );
  NOR2X1 U78 ( .A(n76), .B(n43), .Y(N54) );
  INVX1 U79 ( .A(n69), .Y(N53) );
  NAND2X1 U80 ( .A(count_out[11]), .B(n70), .Y(n69) );
  NOR2X1 U81 ( .A(n76), .B(n39), .Y(N52) );
  NOR2X1 U82 ( .A(n76), .B(n37), .Y(N51) );
  NOR2X1 U83 ( .A(n76), .B(n35), .Y(N50) );
  NOR2X1 U84 ( .A(n76), .B(n33), .Y(N49) );
  NOR2X1 U85 ( .A(n76), .B(n31), .Y(N48) );
  NOR2X1 U86 ( .A(n76), .B(n29), .Y(N47) );
  NOR2X1 U87 ( .A(n76), .B(n27), .Y(N46) );
  NOR2X1 U88 ( .A(n76), .B(n25), .Y(N45) );
  NOR2X1 U89 ( .A(n76), .B(n8), .Y(N44) );
  NOR2X1 U90 ( .A(n76), .B(n6), .Y(N43) );
  NOR2X1 U91 ( .A(n76), .B(n2), .Y(N42) );
  INVX1 U92 ( .A(n70), .Y(n76) );
  OAI21X1 U93 ( .A(count_out[13]), .B(n77), .C(n78), .Y(n70) );
  OAI21X1 U94 ( .A(rollover_val[13]), .B(n45), .C(n79), .Y(n78) );
  OAI21X1 U95 ( .A(count_out[12]), .B(n80), .C(n81), .Y(n79) );
  OAI21X1 U96 ( .A(rollover_val[12]), .B(n43), .C(n82), .Y(n81) );
  AOI21X1 U97 ( .A(n97), .B(count_out[11]), .C(n98), .Y(n82) );
  AOI21X1 U98 ( .A(n41), .B(n99), .C(rollover_val[11]), .Y(n98) );
  INVX1 U99 ( .A(count_out[11]), .Y(n41) );
  INVX1 U100 ( .A(n99), .Y(n97) );
  OAI21X1 U101 ( .A(count_out[10]), .B(n100), .C(n101), .Y(n99) );
  OAI21X1 U102 ( .A(rollover_val[10]), .B(n39), .C(n102), .Y(n101) );
  AOI21X1 U103 ( .A(n103), .B(count_out[9]), .C(n104), .Y(n102) );
  AOI21X1 U104 ( .A(n37), .B(n105), .C(rollover_val[9]), .Y(n104) );
  INVX1 U105 ( .A(count_out[9]), .Y(n37) );
  INVX1 U106 ( .A(n105), .Y(n103) );
  OAI21X1 U107 ( .A(count_out[8]), .B(n106), .C(n107), .Y(n105) );
  OAI21X1 U108 ( .A(rollover_val[8]), .B(n35), .C(n108), .Y(n107) );
  AOI21X1 U109 ( .A(n109), .B(count_out[7]), .C(n110), .Y(n108) );
  AOI21X1 U110 ( .A(n33), .B(n111), .C(rollover_val[7]), .Y(n110) );
  INVX1 U111 ( .A(count_out[7]), .Y(n33) );
  INVX1 U112 ( .A(n111), .Y(n109) );
  OAI21X1 U113 ( .A(count_out[6]), .B(n112), .C(n113), .Y(n111) );
  OAI21X1 U114 ( .A(rollover_val[6]), .B(n31), .C(n114), .Y(n113) );
  AOI21X1 U115 ( .A(n115), .B(count_out[5]), .C(n116), .Y(n114) );
  AOI21X1 U116 ( .A(n29), .B(n117), .C(rollover_val[5]), .Y(n116) );
  INVX1 U117 ( .A(count_out[5]), .Y(n29) );
  INVX1 U118 ( .A(n117), .Y(n115) );
  OAI21X1 U119 ( .A(count_out[4]), .B(n118), .C(n119), .Y(n117) );
  OAI21X1 U120 ( .A(rollover_val[4]), .B(n27), .C(n120), .Y(n119) );
  AOI21X1 U121 ( .A(n121), .B(count_out[3]), .C(n122), .Y(n120) );
  AOI21X1 U122 ( .A(n25), .B(n123), .C(rollover_val[3]), .Y(n122) );
  INVX1 U123 ( .A(count_out[3]), .Y(n25) );
  INVX1 U124 ( .A(n123), .Y(n121) );
  OAI21X1 U125 ( .A(count_out[2]), .B(n124), .C(n125), .Y(n123) );
  OAI21X1 U126 ( .A(rollover_val[2]), .B(n8), .C(n126), .Y(n125) );
  AOI21X1 U127 ( .A(count_out[1]), .B(n127), .C(n128), .Y(n126) );
  AOI21X1 U128 ( .A(n129), .B(n6), .C(rollover_val[1]), .Y(n128) );
  INVX1 U129 ( .A(count_out[1]), .Y(n6) );
  INVX1 U130 ( .A(n127), .Y(n129) );
  NAND2X1 U131 ( .A(rollover_val[0]), .B(n2), .Y(n127) );
  INVX1 U132 ( .A(count_out[0]), .Y(n2) );
  INVX1 U133 ( .A(count_out[2]), .Y(n8) );
  INVX1 U134 ( .A(rollover_val[2]), .Y(n124) );
  INVX1 U135 ( .A(count_out[4]), .Y(n27) );
  INVX1 U136 ( .A(rollover_val[4]), .Y(n118) );
  INVX1 U137 ( .A(count_out[6]), .Y(n31) );
  INVX1 U138 ( .A(rollover_val[6]), .Y(n112) );
  INVX1 U139 ( .A(count_out[8]), .Y(n35) );
  INVX1 U140 ( .A(rollover_val[8]), .Y(n106) );
  INVX1 U141 ( .A(count_out[10]), .Y(n39) );
  INVX1 U142 ( .A(rollover_val[10]), .Y(n100) );
  INVX1 U143 ( .A(count_out[12]), .Y(n43) );
  INVX1 U144 ( .A(rollover_val[12]), .Y(n80) );
  INVX1 U145 ( .A(count_out[13]), .Y(n45) );
  INVX1 U146 ( .A(rollover_val[13]), .Y(n77) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
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


module timer ( clk, n_rst, enable_timer, data_size, bit_period, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5;

  flex_counter_NUM_CNT_BITS14 clk10 ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 bit9 ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n5}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(enable_timer), .Y(n4) );
  INVX1 U3 ( .A(data_size[0]), .Y(n5) );
  XOR2X1 U4 ( .A(data_size[3]), .B(n1), .Y(\_2_net_[3] ) );
  NOR2X1 U5 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U6 ( .A(n3), .B(n2), .Y(\_2_net_[2] ) );
  NAND2X1 U7 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U8 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
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


module rcv_block ( clk, n_rst, serial_in, data_read, data_size, bit_period, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
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
        enable_timer), .data_size(data_size), .bit_period(bit_period), 
        .shift_enable(shift_enable), .packet_done(packet_done) );
  sr_9bit SHIFT_REGISTER ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .serial_in(serial_in), .packet_data(packet_data), 
        .stop_bit(stop_bit) );
  rx_data_buff RX_DATA_BUFFER ( .clk(clk), .n_rst(n_rst), .load_buffer(
        load_buffer), .packet_data(packet_data), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave APB_SLAVE ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error), 
        .framing_error(framing_error), .data_read(data_read), .psel(psel), 
        .paddr(paddr), .penable(penable), .pwrite(pwrite), .pwdata(pwdata), 
        .prdata(prdata), .pslverr(pslverr), .data_size(data_size), 
        .bit_period(bit_period) );
  rcv_block RCV ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), .data_read(
        data_read), .data_size(data_size), .bit_period(bit_period), .rx_data(
        rx_data), .data_ready(data_ready), .overrun_error(overrun_error), 
        .framing_error(framing_error) );
endmodule

