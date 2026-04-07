module b3_tb();
    reg clk,rst;
    reg  [0:63] A, B;
    wire [0:127] C;
    parallel dut(clk,rst,A,B,C);
    initial clk=0;
    always #2 clk=~clk;
    initial begin
    rst=1;
    #20;
    rst=0;
    A=64'b0001001000110100000100100011010000010010001101000001001000110100; B=64'b0001001000110100000100100011010000010010001101000001001000110100;
    #200 $finish;
    end
endmodule
