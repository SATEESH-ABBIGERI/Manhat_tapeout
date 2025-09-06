/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_Manhat_tapeout (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  assign SO = ui_in[0];
  assign IO = ui_in[1];
  assign I1 = ui_in[2];

  wire Y0;
  assign Y0 = S0?I1:IO;
  assign uo_out[0] = Y0;
  assign uo_out[7:1] = 7'b0;
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;


  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0,ui_in[7:3], uio_in[7:0],};

endmodule
