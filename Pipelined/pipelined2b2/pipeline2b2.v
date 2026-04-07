

module pipelined #(parameter N=2, parameter BITS=4)(
  input clk, rst,
  input  [0:N*N*BITS-1]         A, B,
  output reg [0:N*N*(2*BITS)-1] C
);

wire [BITS-1:0]   A2D     [0:N-1][0:N-1];
wire [BITS-1:0]   B2D     [0:N-1][0:N-1];
reg  [2*BITS-1:0] mul_reg [0:N-1][0:N-1];
reg  [2*BITS + $clog2(N) - 1 : 0] acc[0:N-1][0:N-1];

genvar i, j;
reg [$clog2(N):0] gi, gj;

generate
  for (i=0; i<N; i=i+1) begin
    for (j=0; j<N; j=j+1) begin : UNPACK
      assign A2D[i][j] = A[(i*N+j)*BITS +: BITS];
      assign B2D[i][j] = B[(i*N+j)*BITS +: BITS];
    end
  end
endgenerate

reg [$clog2(N):0] k;
reg [$clog2(N):0] k_reg;

always @(posedge clk) begin
  if (rst) begin
    k       <= 0;
    k_reg   <= 0;
    for (gi=0; gi<N; gi=gi+1) begin
      for (gj=0; gj<N; gj=gj+1) begin
        mul_reg[gi][gj] <= 0;
      end
    end
  end else begin
    k_reg   <= k;
    k <= (k == N-1) ? 0 : k + 1;
    for (gi=0; gi<N; gi=gi+1) begin
      for (gj=0; gj<N; gj=gj+1) begin
        mul_reg[gi][gj] <= A2D[gi][k] * B2D[k][gj];
      end
    end
  end
end

always @(posedge clk) begin
  if (rst) begin
    C <= 0;
    for (gi=0; gi<N; gi=gi+1) begin
      for (gj=0; gj<N; gj=gj+1) begin
        acc[gi][gj] <= 0;
      end
    end
  end else begin
      for (gi=0; gi<N; gi=gi+1) begin
        for (gj=0; gj<N; gj=gj+1) begin
          acc[gi][gj] <= (k_reg == 0) ? mul_reg[gi][gj]
                       : acc[gi][gj] + mul_reg[gi][gj];
        end
      end
      if (k_reg == N-1) begin
        for (gi=0; gi<N; gi=gi+1) begin
          for (gj=0; gj<N; gj=gj+1) begin
            C[(gi*N+gj)*(2*BITS) +: (2*BITS)] <= acc[gi][gj] + mul_reg[gi][gj];
            acc[gi][gj] <= 0;
          end
        end
      end
    end
  end

endmodule



