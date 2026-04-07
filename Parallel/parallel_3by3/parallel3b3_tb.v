module b3_tb();
    reg clk,rst;
    reg  [0:35] A, B;
    wire [0:71] C;
    parallel dut(clk,rst,A,B,C);
    initial clk=0;
    always #2 clk=~clk;
    initial begin
    rst=1;
    #20;
    rst=0;
    A=36'b001010010101011100100110001100000001; B=36'b001010010101011100100110001100000001;
    #200 $finish;
    end
endmodule
