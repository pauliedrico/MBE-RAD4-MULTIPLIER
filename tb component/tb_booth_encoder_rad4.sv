`timescale 1ns/1ns 

module tb_booth_encoder_rad4;
  // signals
  reg b_next, b_n, b_prev;
  reg [10:0] A;
  wire neg;
  wire [11:0] A_out;
  // component
  booth_encoder_rad4 uut (
    .b_next(b_next),
    .b_n(b_n),
	.b_prev(b_prev),
    .A(A),
    .neg(neg),
	.A_out(A_out)
  );

  initial begin
    // Test 0
	b_next = 0; b_n = 0; b_prev = 0; A = 1234;
    // Test 1
    #10 b_next = 0; b_n = 0; b_prev = 1; A = 1234;
    // Test 2
    #10 b_next = 0; b_n = 1; b_prev = 0; A = 1234;
    // Test 3
    #10 b_next = 0; b_n = 1; b_prev = 1; A = 1234;
	// Test 4
    #10 b_next = 1; b_n = 0; b_prev = 0; A = 1234;
	// Test 5
    #10 b_next = 1; b_n = 0; b_prev = 1; A = 1234;
	// Test 6
    #10 b_next = 1; b_n = 1; b_prev = 0; A = 1234;
	// Test 7
    #10 b_next = 1; b_n = 1; b_prev = 1; A = 1234;
  end
  
  // Display results for every transition 
  // FUNZIONA, MA UN PO' PROBLEMATICO ==> DA RIVEDERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  always @(*) begin
    $display("Time=%0t (IN) ==> b_next=%b b_n=%b b_prev=%b A=%d (OUT) ==> neg=%b A_out=%d", $time, b_next, b_n, b_prev, A, neg, A_out);
  end

endmodule
