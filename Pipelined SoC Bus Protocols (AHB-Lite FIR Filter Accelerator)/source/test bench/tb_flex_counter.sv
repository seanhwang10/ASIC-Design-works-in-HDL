// $Id: $
// File name:   tb_flex_counter.sv
// Created:     9/23/2020
// Author:      Sean Hwang
// Lab Section: 337-011
// Version:     1.0  Initial Design Entry
// Description: TB for flex counter

`timescale 1ns / 10ps

module tb_flex_counter();

  localparam BITS = 4;   
  // Define local parameters used by the test bench
  localparam  CLK_PERIOD    = 2.5;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts

  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear; 
  reg tb_count_enable;
  reg [BITS - 1 : 0] tb_rollover_val;
  wire [BITS - 1: 0] tb_count_out;
  wire tb_rollover_flag; 

  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;
  
  

  // DUT Port map
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag)); 


  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  


// MAIN TEST BENCH 

initial 
begin 

//Initializing all the test inputs 
tb_n_rst = 1'b1;
tb_clear = 1'b0; 
tb_count_enable = 1'b0;
tb_rollover_val = 1'b0;
tb_test_num = 0;               // Initialize test case counter
tb_test_case = "Test bench initializaton";
tb_stream_test_num = 0;
tb_stream_check_tag = "N/A";
// Wait some time before starting first test case
#(0.1);

// ************************************************************************
// Test Case 1: Power-on Reset of the DUT
// ************************************************************************
tb_test_num = tb_test_num + 1;
tb_test_case = "Power on Reset";
// Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
// Wait some time before applying test case stimulus
#(0.1);
// Apply test case initial stimulus
tb_n_rst  = 1'b0;    // Activate reset

// Wait for a bit before checking for correct functionality
#(1);

// Check that internal state was correctly reset
normalcheck(0,0,
"after reset applied");

// Check that the reset value is maintained during a clock cycle
#(1);
normalcheck(0,0,
"after one clock cycle while reset applied");

// Release the reset away from a clock edge
@(posedge tb_clk);
#(0.2);
tb_n_rst  = 1'b1;   // Deactivate the chip reset
#0.1;
// Check that internal state was correctly keep after reset release
normalcheck(0,0,
"after reset was released ");

// ************************************************************************
// Test Case 2: Rollover for a rollover value that is not a power of two
// ************************************************************************
@(negedge tb_clk); 
tb_test_num = tb_test_num + 1;
tb_test_case = "Rollover Test";
reset_dut();

//Assigning stimulus 
tb_rollover_val = 'd9; 
tb_count_enable = 1; 

@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk); //9 cycles of clock 

normalcheck(9,1,
"Rollover testing ");

//Test for expected output 
#60;
tb_rollover_val = 'd7; 

normalcheck(9,1,
"Rollover testing ");

for (int i = 0; i < 15; i++) begin 
  tb_rollover_val = i; 
  #10; end 

#60; 
tb_rollover_val = 'd3; 
#60;
tb_rollover_val = 'd5; 
#60;
tb_rollover_val = 'd1; 
#60;
tb_rollover_val = 'd9; 
#60;
tb_rollover_val = 'd11; 
#60;
tb_rollover_val = 'd13; 
#60;


// ************************************************************************
// Test Case 3: Continuous counting 
// ************************************************************************
@(negedge tb_clk); 
tb_test_num = tb_test_num + 1;
tb_test_case = "Continuous Test";
reset_dut();

normalcheck(0,0,
"Continuous test begin ");

tb_clear = 1; 
normalclear(0,0, "Clear test"); 

@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
tb_clear = '0; 

#5; 
@(posedge tb_clk);
@(posedge tb_clk);

normalclear(2,0, "After clear is 0"); 

//Stimulus 
tb_rollover_val = 'd15; 
tb_count_enable = 'b1; 

#130; //Let it run for awhile 

tb_count_enable = 'b0;
#5; 

normalcheck(tb_count_out,0,
"Retaining value test after enable off ");

#5; 

tb_count_enable = 'b1; 
tb_rollover_val = 'd7; 
#60;


// ************************************************************************
// Test Case 4: Discontinuous counting 
// ************************************************************************
@(negedge tb_clk); 
tb_test_num = tb_test_num + 1;
tb_test_case = "Disconcinuous Test";

// Does not reset, but only change enable to low 

tb_count_enable = 1'b0; 
#60; //Let it run for awhile 

normalcheck(tb_count_out,0,
"Discontinuous counting test after enable off ");


// ************************************************************************
// Test Case 5: Clearing while counting 
// ************************************************************************
@(negedge tb_clk); 
tb_test_num = tb_test_num + 1;
tb_test_case = "Clearing test";

tb_count_enable = 'b1; 
#10; //Let it run for a while 

//Pulsing clear 
tb_clear = 1'b1; 

#10; 

tb_clear = 1'b0; 

#20; 

normalclear(0,0,"Clear check"); 


end //of initial block 

//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 
//All tasks under here ! 


// Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  //Normal operation DUT output check 
  //Checks both count_out and rollover_flag 

  task normalcheck; 
      input logic expected_count; 
      input logic expected_rollover; 
      input string check_tag; 
  begin 
      if (expected_count == tb_count_out) begin 
          $info("Correct expected count output for %s. Test case # %s", check_tag, tb_test_case); 
      end 
      else begin //check failed 
          $error("Incorrect expected count output for %s. Test case # %s", check_tag, tb_test_case); 
      end 
      if (expected_rollover == tb_rollover_flag) begin 
          $info("Correct expected rollover output for %s. Test case # %s", check_tag, tb_test_case); 
      end 
      else begin //check failed 
          $error("Incorrect expected rollover output for %s. Test case # %s", check_tag, tb_test_case); 
      end 
  end 
  endtask 

  //Normal clear task 

    task normalclear;
      input logic expected_count; 
      input logic expected_rollover; 
      input string check_tag; 
    begin
      //Pulsing clear 
      tb_clear = 1'b1; 

      //Maintaining clear pulse for 1 cycle 
      @(posedge tb_clk);
      @(posedge tb_clk);

      tb_clear = 1'b0; 

        //Check output 
        if (expected_count == tb_count_out) begin 
            $info("Correct expected count output for %s. Test case # %s", check_tag, tb_test_case); 
        end 
        else begin //check failed 
            $error("Incorrect expected count output for %s. Test case # %s", check_tag, tb_test_case); 
        end 
         if (expected_rollover == tb_rollover_flag) begin 
          $info("Correct expected rollover output for %s. Test case # %s", check_tag, tb_test_case); 
      end 
      else begin //check failed 
          $error("Incorrect expected rollover output for %s. Test case # %s", check_tag, tb_test_case); 
      end 
  end 
  endtask 
        

endmodule 