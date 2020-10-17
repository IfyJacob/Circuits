Author: Ify Jacob
Description: Truth Set for SR Latch

module SR_Latch(S, R, Q, Q_n, E);

   input S, R, E;
   output Q, Q_n;
   wire   E_and_R, E_and_S;

   and #1 and00(E_and_S, S, E);
   and #1 and01(E_and_R, R, E);


   nor #1 i1(Q, R, Q_n);
   nor #1 i2(Q_n, S, Q);

endmodule

module Test_SR_latch2();

   reg S, R, E;
   wire Q, Q_n;

   SR_Latch i3(.S(S),.R(R),.Q(Q),.Q_n(Q_n));

   initial
     begin

        $dumpfile("lab09.vcd");
        $dumpvars;

        $monitor("%10t: E=%b,S=%b,R=%b,Q=%b,Q_n=%b", $time,E,S,R,Q,Q_n);
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b1; R=1'b0;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b0; R=1'b0;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b0; R=1'b1;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b0; R=1'b0;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b0; R=1'b1;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b1; R=1'b0;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b1; R=1'b0;
        #10
        $display("---------------------------------------------------------");
        E=1'b1; S=1'b1; R=1'b1;
        #10
        $finish;
    end

endmodule