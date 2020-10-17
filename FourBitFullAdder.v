Author: Ify Jacob
Description: Combination of four full bit adders

module full_adder_1bit(A, B, Carry_in, SUM, Carry_out);
  input A;
  input B;
  input Carry_in;
  output SUM;
  output Carry_out;

  wire x;
  wire y;
  wire z;


  xor(x, A, B);
  and(y, x, Carry_in);
  and(z, A, B);
  xor(SUM, x, Carry_in);
  or(Carry_out, y, z);

endmodule

module IC74LS83(A3,S3,A2,B2,VCC,S1,B1,A1,S0,A0,B0,GND,C0,C4,S2,B3,A4,B4,S4);
  input A4,A3,A2,A1,A0;
  input B4,B3,B2,B1,B0;
  input C0;           // Carry In
  output S4,S3,S2,S1,S0;
  output C4;          // Carry Out
  input VCC, GND;     //unused in this verilog model
                      //  only included to maintain pin ordering

  wire C1;
  wire C2;
  wire C3;



   full_adder_1bit adder_inst_0(.A(A0),.B(B0),.Carry_in(C0),.SUM(S0),.Carry_out(C1));

   full_adder_1bit adder_inst_1(.A(A1),.B(B1),.Carry_in(C1),.SUM(S1),.Carry_out(C2));

   full_adder_1bit adder_inst_2(.A(A2),.B(B2),.Carry_in(C2),.SUM(S2),.Carry_out(C3));

   full_adder_1bit adder_inst_3(.A(A3),.B(B3),.Carry_in(C3),.SUM(S3),.Carry_out(C4));

endmodule

module test_bench();

   /*anything that you set in the initial begin...end block should be declared as reg.  Here A, B, C stand as the switch operation.*/
   reg A, B, Carry_in;
   /* the outputs of instantiated module in the testbench are defined as wire*/
    wire SUM_1;
    wire Carry_out_1;
    wire SUM_2;
    wire Carry_out_2;

   /* Instantiate Circuit Here */
    full_adder_1bit           uut1 (.A(A), .B(B), .Carry_in(Carry_in), .SUM(SUM_1), .Carry_out(Carry_out_1));
    full_adder_1bit_LS_series  uut2 (.A(A), .B(B), .Carry_in(Carry_in), .SUM(SUM_2), .Carry_out(Carry_out_2));


   /* Testbench Logic */

   initial begin
      $monitor("(%t): A:%b B:%b Carry_in:%b SUM_1:%b Carry_out_1:%b SUM_2:%b Carry_out_2:%b",$time, A, B, Carry_in, SUM_1, Carry_out_1, SUM_2,Carry_out_2);
      /* here each 1000 unit timescale the value of A, B, Carry_in are chenged. It seems that we change the switches position*/
      A = 0; B = 0; Carry_in = 0;
      #1000;
      A = 0; B = 0; Carry_in = 1;
      #1000;
      A = 0; B = 1; Carry_in = 0;
      #1000;
      A = 0; B = 1; Carry_in = 1;
      #1000;
      A = 1; B = 0; Carry_in = 0;
      #1000;
      A = 1; B = 0; Carry_in = 1;
      #1000;
      A = 1; B = 1; Carry_in = 0;
      #1000;
      A = 1; B = 1; Carry_in = 1;
      #1000;
      $finish;
   end

endmodule // test_bench

