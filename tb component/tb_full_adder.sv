`timescale 1ns/1ns 

module tb_full_adder;
  // signals
  reg a, b, cin;
  wire sum, carry;
  // component
  full_adder uut (
    .a(a),
    .b(b),
	.cin(cin),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test 0
	a = 0; b = 0; cin = 0;
    // Test 1
    #10 a = 0; b=0; cin = 1;
    // Test 2
    #10 a = 0; b=1; cin = 0;
    // Test 3
    #10 a = 0; b=1; cin = 1;
	// Test 4
    #10 a = 1; b=0; cin = 0;
	// Test 5
    #10 a = 1; b=0; cin = 1;
	// Test 6
    #10 a = 1; b=1; cin = 0;
	// Test 7
    #10 a = 1; b=1; cin = 1;
  end

  // Display results for every transition
  always @(*) begin
    $display("Time=%0t a=%b b=%b cin=%b sum=%b carry=%b", $time, a, b, cin, sum, carry);
  end

endmodule
