`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 17:22:40
// Design Name: 
// Module Name: 8_bit_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module updown_counter_8bit(
    input clk, reset, up, en,     // en=1 -> count, en=0 -> hold
    output [7:0] q
);

    wire [7:0] j, k;

    // FF0 (LSB)
    assign j[0] = en ? 1'b1 : 1'b0;
    assign k[0] = en ? 1'b1 : 1'b0;

    // Higher FFs
    genvar i;
    generate
        for (i = 1; i < 8; i = i + 1) begin : gen_counter
            assign j[i] = (en) ? ((up) ? &q[i-1:0] : ~(|q[i-1:0])) : 1'b0;
            assign k[i] = j[i];
        end
    endgenerate

    // Instantiate JK flip-flops
    jk_ff ff0(clk, reset, j[0], k[0], q[0]);
    jk_ff ff1(clk, reset, j[1], k[1], q[1]);
    jk_ff ff2(clk, reset, j[2], k[2], q[2]);
    jk_ff ff3(clk, reset, j[3], k[3], q[3]);
    jk_ff ff4(clk, reset, j[4], k[4], q[4]);
    jk_ff ff5(clk, reset, j[5], k[5], q[5]);
    jk_ff ff6(clk, reset, j[6], k[6], q[6]);
    jk_ff ff7(clk, reset, j[7], k[7], q[7]);

endmodule
