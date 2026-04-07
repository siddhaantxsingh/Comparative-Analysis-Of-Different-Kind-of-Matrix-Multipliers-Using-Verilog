module serial #(
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

    reg [1:0] PS;

    genvar i, j;

    generate
        for (i = 0; i < N; i = i + 1)
            for (j = 0; j < N; j = j + 1) begin : UNCPACK
                assign A2D[i][j] = A[(i*N + j)*BITS +: BITS];
                assign B2D[i][j] = B[(i*N + j)*BITS +: BITS];
            end
    endgenerate

    localparam START   = 2'b00;
    localparam COMPUTE = 2'b01;
    localparam OUT     = 2'b10;
    localparam DONE    = 2'b11;

    reg [2*BITS+$clog2(N)-1:0] acc;
    reg [$clog2(N):0] gk, gj, gi;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            gk  <= 0;
            gj  <= 0;
            gi  <= 0;
            acc <= 0;
            PS  <= START;
        end
        else begin
            case (PS)

                START: begin
                    gi  <= 0;
                    gj  <= 0;
                    gk  <= 0;
                    acc <= 0;

                    if (A != 0 || B != 0)
                        PS <= COMPUTE;
                    else
                        PS <= PS;
                end

                COMPUTE: begin
                    acc <= acc + A2D[gi][gk] * B2D[gk][gj];

                    if (gk < N - 1)
                        gk <= gk + 1;
                    else
                        PS <= OUT;
                end

                OUT: begin
                    C[(gi*N + gj)*(2*BITS) +: (2*BITS)] <= acc;

                    if (gj < N - 1) begin
                        gj  <= gj + 1;
                        acc <= 0;
                        gk  <= 0;
                        PS  <= COMPUTE;
                    end
                    else if (gi < N - 1) begin
                        gj  <= 0;
                        gi  <= gi + 1;
                        acc <= 0;
                        gk  <= 0;
                        PS  <= COMPUTE;
                    end
                    else
                        PS <= DONE;
                end

                DONE: PS <= START;

                default: PS <= START;

            endcase
        end
    end

endmodule
