`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 17:21:17
// Design Name: 
// Module Name: jk_flipflop
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


module jk_ff(
    input clk, reset, j, k,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else begin
            case ({j,k})
                2'b00: q <= q;       // No change
                2'b01: q <= 0;       // Reset
                2'b10: q <= 1;       // Set
                2'b11: q <= ~q;      // Toggle
            endcase
        end
    end
endmodule
