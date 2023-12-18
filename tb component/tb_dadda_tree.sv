`timescale 1ns/1ns

module tb_dadda_tree;
  // signals
  reg [11:0] pp1, pp2, pp3, pp4, pp5, pp6;
  reg s1, s2, s3, s4, s5, s6;
  wire [21:0] carry, sum;
  wire [21:0] product; // output test (calcolato effettivam. in TOP-entity)
  // component
  dadda_tree uut (
    .pp1(pp1),
    .pp2(pp2),
    .pp3(pp3),
    .pp4(pp4),
    .pp5(pp5),
    .pp6(pp6),
    .s1(s1),
    .s2(s2),
    .s3(s3),
    .s4(s4),
    .s5(s5),
    .s6(s6),
    .carry(carry),
    .sum(sum)
  );

  initial begin
    // Test 0
    pp1 = 0; pp2 = 0; pp3 = 0;
    pp4 = 0; pp5 = 0; pp6 = 0;
    s1 = 0; s2 = 0; s3 = 0; s4 = 0; s5 = 0; s6 = 0;
    // Test 1
	#10 pp1 = 1; pp2 = 12; pp3 = 123;
    pp4 = 1234; pp5 = 12345; pp6 = 123456;
    s1 = 1; s2 = 1; s3 = 1; s4 = 1; s5 = 1; s6 = 1;
  end
	
	assign product = carry + sum; // output test (calcolato effettivam. in TOP-entity)

  always @(*) begin
    $display("Time=%0t (IN) ==> pp1=%d pp2=%d pp3=%d pp4=%d pp5=%d pp6=%d s1=%b s2=%b s3=%b s4=%b s5=%b s6=%b, (OUT) ==> carry=%d sum=%d", $time, pp1, pp2, pp3, pp4, pp5, pp6, s1, s2, s3, s4, s5, s6, carry, sum);
  end

endmodule
