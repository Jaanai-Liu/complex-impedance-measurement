// Verilog netlist created by Tang Dynasty v5.6.71036
// Fri Oct 20 18:35:28 2023

`timescale 1ns / 1ps
module fifo  // fifo.v(14)
  (
  clkr,
  clkw,
  di,
  re,
  rst,
  we,
  do,
  empty_flag,
  full_flag
  );

  input clkr;  // fifo.v(25)
  input clkw;  // fifo.v(24)
  input [7:0] di;  // fifo.v(23)
  input re;  // fifo.v(25)
  input rst;  // fifo.v(22)
  input we;  // fifo.v(24)
  output [7:0] do;  // fifo.v(27)
  output empty_flag;  // fifo.v(28)
  output full_flag;  // fifo.v(29)

  wire empty_flag_syn_2;  // fifo.v(28)
  wire full_flag_syn_2;  // fifo.v(29)

  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  not empty_flag_syn_1 (empty_flag_syn_2, empty_flag);  // fifo.v(28)
  EG_PHY_FIFO #(
    .AE(32'b00000000000000000000000001100000),
    .AEP1(32'b00000000000000000000000001110000),
    .AF(32'b00000000000000000001111110100000),
    .AFM1(32'b00000000000000000001111110010000),
    .ASYNC_RESET_RELEASE("SYNC"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .E(32'b00000000000000000000000000000000),
    .EP1(32'b00000000000000000000000000010000),
    .F(32'b00000000000000000010000000000000),
    .FM1(32'b00000000000000000001111111110000),
    .GSR("DISABLE"),
    .MODE("FIFO8K"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"))
    fifo_inst_syn_2 (
    .clkr(clkr),
    .clkw(clkw),
    .csr({2'b11,empty_flag_syn_2}),
    .csw({2'b11,full_flag_syn_2}),
    .dia({open_n47,di}),
    .orea(1'b0),
    .oreb(1'b0),
    .re(re),
    .rprst(rst),
    .rst(rst),
    .we(we),
    .doa({open_n59,do}),
    .empty_flag(empty_flag),
    .full_flag(full_flag));  // fifo.v(41)
  not full_flag_syn_1 (full_flag_syn_2, full_flag);  // fifo.v(29)

endmodule 

