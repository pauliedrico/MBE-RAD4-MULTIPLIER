`timescale 1ns/1ns

module tb_mbe_rad4_mult;
  // signals
  reg [10:0] mantissa_a, mantissa_b;
  wire [21:0] product;
  // component
  mbe_rad4_mult uut (
    .mantissa_a(mantissa_a),
    .mantissa_b(mantissa_b),
    .product(product)
  );

  initial begin
    for (int i=0; i<50;i++ ) begin
	#10 mantissa_a = $urandom_range(0,2047); mantissa_b=$urandom_range(0,2047);
	end
  end

  // Display results for every transition 
  always @(product) begin
    logic[21:0] expected_product;
    expected_product=mantissa_a*mantissa_b;
    if(expected_product==product) begin
	$display("Time=%0t : RIGHT RESULT! mantissa_a=%d mantissa_b=%d product=%d expected_product=%d", $time, mantissa_a, mantissa_b, product,expected_product);
    end else begin
	$display("Time=%0t : WRONG RESULT! mantissa_a=%d mantissa_b=%d product=%d expected_product=%d", $time, mantissa_a, mantissa_b, product,expected_product);
    end
  end

endmodule
