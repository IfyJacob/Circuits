Author: Ify Jacob
Description: Simple ciruit of inputs that turn on a light when F is true.

module first_verilog_str(A, B, C, F);
  input A;
  input B;
  input C;
  output F;

  wire x;
  wire y;

  and(x, C, A);
  and(y, C, B);
  or(F, x, y);

endmodule

module first_verilog_IC(A, B, C, F);
  input A;
  input B;
  input C;
  output F;

  wire x;
  wire y;

  IC74LS08 myand(.Y2(x),.B2(A),.A2(C),.GND(1'b0),.A4(C),.B4(B),.Y4(y),.VCC(1'b1));
  IC74LS32 myor(.Y1(F),.A1(x),.B1(y),.GND(1'b0),.VCC(1'b1));

endmodule

module test_bench();
   /*anything that you set in the initial begin...end block should be declared as reg.  Here A, B, C stand as the switch operation.*/
   reg A, B, C;
   /* the outputs of instantiated module in the testbench are defined as wire*/
   wire F;


   /* Instantiate Circuit Here */
    first_verilog_IC uut(.A(A), .B(B), .C(C), .F(F));


   /* Testbench Logic */

   initial begin
      $monitor("(%t): A:%b B:%b C:%b F:%b",$time, A, B, C, F);
      /* here each 1000 unit timescale the value of A, B, C are chenged. It seems that we change the switches position*/
      A = 0; B = 0; C = 0;
      #1000;
      A = 0; B = 0; C = 1;
      #1000;
      A = 0; B = 1; C = 0;
      #1000;
      A = 0; B = 1; C = 1;
      #1000;
      A = 1; B = 0; C = 0;
      #1000;
      A = 1; B = 0; C = 1;
      #1000;
      A = 1; B = 1; C = 0;
      #1000;
      A = 1; B = 1; C = 1;
      #1000;
   end

endmodule // test_bench
