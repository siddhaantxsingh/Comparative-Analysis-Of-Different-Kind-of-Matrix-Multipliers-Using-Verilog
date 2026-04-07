module common_tb();
    reg clk,rst;
    reg  [0:15] A, B;
    wire [0:31] C;
    pipelined dut(clk,rst,A,B,C);
    initial clk=0;
    always #2 clk=~clk;
    initial begin
    rst=1;
    #20;
    rst=0;
    A=16'b0011010001010110; B=16'b0011010001010110;
    #200 $finish;
    end
endmodule


