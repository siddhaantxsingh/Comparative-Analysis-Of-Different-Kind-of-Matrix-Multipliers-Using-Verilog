module parallel #(
    parameter N = 3,
    parameter BITS = 4
)(
    input clk,
    input rst,
    input [0:N*N*BITS-1] A, B,
    output reg [0:N*N*(2*BITS)-1] C
);

    wire [BITS-1:0] A2D [0:N-1][0:N-1];
    wire [BITS-1:0] B2D [0:N-1][0:N-1];
    wire [2*BITS-1:0] partial [0:N-1][0:N-1][0:N-1];
    wire [2*BITS+$clog2(N)-1:0] acc [0:N-1][0:N-1][0:N-1];

    genvar i, j, k;

    reg [$clog2(N):0] gi, gj;

    generate
        for (i = 0; i < N; i = i + 1)
            for (j = 0; j < N; j = j + 1) begin : UNPACK
                assign A2D[i][j] = A[(i*N + j)*BITS +: BITS];
                assign B2D[i][j] = B[(i*N + j)*BITS +: BITS];
            end
    endgenerate

    generate
        for (i = 0; i < N; i = i + 1)
            for (j = 0; j < N; j = j + 1)
                for (k = 0; k < N; k = k + 1) begin : PARTIAL
                    assign partial[i][j][k] = A2D[i][k] * B2D[k][j];
                end
    endgenerate

    generate
        for (i = 0; i < N; i = i + 1)
            for (j = 0; j < N; j = j + 1) begin : ACC_INIT
                assign acc[i][j][0] = partial[i][j][0];
            end
    endgenerate

    generate
        for (i = 0; i < N; i = i + 1)
            for (j = 0; j < N; j = j + 1)
                for (k = 0; k < N - 1; k = k + 1) begin : ACC_CHAIN
                    assign acc[i][j][k + 1] = acc[i][j][k] + partial[i][j][k + 1];
                end
    endgenerate

    always @(posedge clk) begin
        if (rst) begin
            C <= 0;
        end
        else begin
            for (gi = 0; gi < N; gi = gi + 1)
                for (gj = 0; gj < N; gj = gj + 1)
                    C[(gi*N + gj)*(2*BITS) +: (2*BITS)] <= acc[gi][gj][N - 1];
        end
    end

endmodule
