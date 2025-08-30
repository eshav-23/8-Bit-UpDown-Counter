`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 17:41:44
// Design Name: 
// Module Name: clk_divider
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


module clock_divider #(
    parameter DIV = 100_000_000  // 1-second at 100 MHz
)(
    input clk, reset,
    output reg tick
);
    reg [$clog2(DIV)-1:0] cnt;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            cnt  <= 0;
            tick <= 0;
        end else begin
            if (cnt == DIV-1) begin
                cnt  <= 0;
                tick <= 1;   // generate 1-cycle pulse every DIV cycles
            end else begin
                cnt  <= cnt + 1;
                tick <= 0;
            end
        end
    end
endmodule
