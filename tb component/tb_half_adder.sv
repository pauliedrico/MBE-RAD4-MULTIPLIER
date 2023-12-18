`timescale 1ns/1ns 

module tb_half_adder;
  // signals
  reg a, b;
  wire sum, carry;
  // component
  half_adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test 0
	a = 0; b = 0;
    // Test 1
    #10 a = 1; b=0;
    // Test 2
    #10 a = 0; b=1;
    // Test 3
    #10 a = 1; b=1;
  end

  // Display results for every transition
  always @(*) begin
    $display("Time=%0t a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
  end

endmodule
