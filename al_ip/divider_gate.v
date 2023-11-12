// Verilog netlist created by Tang Dynasty v5.6.71036
// Mon Oct 23 16:28:04 2023

`timescale 1ns / 1ps
module divider
  (
  clk,
  denominator,
  numerator,
  rst,
  start,
  done,
  quotient,
  remainder
  );

  input clk;
  input [12:0] denominator;
  input [12:0] numerator;
  input rst;
  input start;
  output done;
  output [12:0] quotient;
  output [12:0] remainder;

  parameter S_DEN = "UNSIGNED";
  parameter S_NUM = "UNSIGNED";
  parameter W_DEN = 13;
  parameter W_NUM = 13;
  // localparam W_CNT = 4;
  wire [3:0] al_1deac949;
  wire [3:0] al_d0dc52fd;
  wire [24:0] al_11033702;
  wire [24:0] al_1c1b24e7;
  wire [12:0] al_1315ed94;
  wire [12:0] al_9bfb1470;
  wire [24:0] al_c67bebad;
  wire [12:0] al_327525b3;
  wire al_9673d977;
  wire al_a9fbe072;
  wire al_3973d008;
  wire al_4c40b6e5;
  wire al_d63e42fe;
  wire al_b4fc1000;
  wire al_ab829401;
  wire al_b7ca2ed;
  wire al_22a7ce9f;
  wire al_f5902502;
  wire al_b83a67b2;
  wire al_540b209;
  wire al_27e1f3bc;
  wire al_e64e5f1c;
  wire al_e761a920;
  wire al_42ead886;
  wire al_f5a327ab;
  wire al_b23e28b5;
  wire al_283f8d98;
  wire al_516747bd;
  wire al_88a2e01;
  wire al_424d2e3a;
  wire al_5d3a435a;
  wire al_4a5ad68f;
  wire al_9646e713;
  wire al_6cee34b4;
  wire al_955595a3;
  wire al_b31da46b;
  wire al_dfd4a7b0;
  wire al_5a23a824;
  wire al_40fca01c;
  wire al_7fc49024;
  wire al_ce2d27ed;
  wire al_5e8c29e5;
  wire al_8c86c74b;
  wire al_b0dd8135;
  wire al_22690046;
  wire al_4078d2ac;
  wire al_4eb1aec6;
  wire al_114eba31;
  wire al_c61b4192;

  AL_MAP_LUT4 #(
    .EQN("(D*C*B*~A)"),
    .INIT(16'h4000))
    al_dc50342 (
    .a(al_1deac949[0]),
    .b(al_1deac949[1]),
    .c(al_1deac949[2]),
    .d(al_1deac949[3]),
    .o(al_114eba31));
  AL_MAP_LUT5 #(
    .EQN("~(~A*~(~B*(C*~(D)*~(E)+~(C)*D*~(E)+C*D*~(E)+~(C)*~(D)*E+C*~(D)*E+~(C)*D*E)))"),
    .INIT(32'habbbbbba))
    al_f17cd423 (
    .a(start),
    .b(al_1deac949[0]),
    .c(al_1deac949[1]),
    .d(al_1deac949[2]),
    .e(al_1deac949[3]),
    .o(al_d0dc52fd[0]));
  AL_MAP_LUT5 #(
    .EQN("(~A*(B*~(C)*~((E*D))+~(B)*C*~((E*D))+B*~(C)*(E*D)))"),
    .INIT(32'h04141414))
    al_147e6a1b (
    .a(start),
    .b(al_1deac949[0]),
    .c(al_1deac949[1]),
    .d(al_1deac949[2]),
    .e(al_1deac949[3]),
    .o(al_d0dc52fd[1]));
  AL_MAP_LUT5 #(
    .EQN("(~A*(B*C*~(D)*~(E)+~(B)*~(C)*D*~(E)+B*~(C)*D*~(E)+~(B)*C*D*~(E)+B*C*~(D)*E+~(B)*~(C)*D*E+B*~(C)*D*E))"),
    .INIT(32'h05401540))
    al_c8620855 (
    .a(start),
    .b(al_1deac949[0]),
    .c(al_1deac949[1]),
    .d(al_1deac949[2]),
    .e(al_1deac949[3]),
    .o(al_d0dc52fd[2]));
  AL_MAP_LUT5 #(
    .EQN("(~A*(B*(D*C)*~(E)+~(B)*~((D*C))*E+B*~((D*C))*E))"),
    .INIT(32'h05554000))
    al_6614de08 (
    .a(start),
    .b(al_1deac949[0]),
    .c(al_1deac949[1]),
    .d(al_1deac949[2]),
    .e(al_1deac949[3]),
    .o(al_d0dc52fd[3]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_14abf2aa (
    .a(denominator[0]),
    .b(start),
    .c(al_11033702[13]),
    .o(al_1c1b24e7[12]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_c4e8f3cf (
    .a(denominator[1]),
    .b(start),
    .c(al_11033702[14]),
    .o(al_1c1b24e7[13]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_5fbcb4a4 (
    .a(denominator[2]),
    .b(start),
    .c(al_11033702[15]),
    .o(al_1c1b24e7[14]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_bab72fe4 (
    .a(denominator[3]),
    .b(start),
    .c(al_11033702[16]),
    .o(al_1c1b24e7[15]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_5c6d3b2b (
    .a(denominator[4]),
    .b(start),
    .c(al_11033702[17]),
    .o(al_1c1b24e7[16]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_d2344c96 (
    .a(denominator[5]),
    .b(start),
    .c(al_11033702[18]),
    .o(al_1c1b24e7[17]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_faf89982 (
    .a(denominator[6]),
    .b(start),
    .c(al_11033702[19]),
    .o(al_1c1b24e7[18]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_22b9e4c0 (
    .a(denominator[7]),
    .b(start),
    .c(al_11033702[20]),
    .o(al_1c1b24e7[19]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_b1b9ffd0 (
    .a(denominator[8]),
    .b(start),
    .c(al_11033702[21]),
    .o(al_1c1b24e7[20]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_b2cd7517 (
    .a(denominator[9]),
    .b(start),
    .c(al_11033702[22]),
    .o(al_1c1b24e7[21]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_e0f50da5 (
    .a(denominator[10]),
    .b(start),
    .c(al_11033702[23]),
    .o(al_1c1b24e7[22]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    al_f95f5f0d (
    .a(denominator[11]),
    .b(start),
    .c(al_11033702[24]),
    .o(al_1c1b24e7[23]));
  AL_DFF_0 al_35b11324 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_114eba31),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(done));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B_CARRY"))
    al_2c0796e5 (
    .a(1'b1),
    .o({al_9673d977,open_n2}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_c203f32c (
    .a(al_11033702[4]),
    .b(al_1315ed94[4]),
    .c(al_d63e42fe),
    .o({al_b4fc1000,open_n3}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_5a2e66a8 (
    .a(al_11033702[5]),
    .b(al_1315ed94[5]),
    .c(al_b4fc1000),
    .o({al_ab829401,open_n4}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_2f287d12 (
    .a(al_11033702[6]),
    .b(al_1315ed94[6]),
    .c(al_ab829401),
    .o({al_b7ca2ed,open_n5}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_9ce86edd (
    .a(al_11033702[7]),
    .b(al_1315ed94[7]),
    .c(al_b7ca2ed),
    .o({al_22a7ce9f,open_n6}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_29f6525 (
    .a(al_11033702[8]),
    .b(al_1315ed94[8]),
    .c(al_22a7ce9f),
    .o({al_f5902502,open_n7}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_f171b4f4 (
    .a(al_11033702[0]),
    .b(al_1315ed94[0]),
    .c(al_9673d977),
    .o({al_a9fbe072,open_n8}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e9c7012b (
    .a(al_11033702[9]),
    .b(al_1315ed94[9]),
    .c(al_f5902502),
    .o({al_b83a67b2,open_n9}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_4226b3d1 (
    .a(al_11033702[10]),
    .b(al_1315ed94[10]),
    .c(al_b83a67b2),
    .o({al_540b209,open_n10}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_3f6fc47e (
    .a(al_11033702[11]),
    .b(al_1315ed94[11]),
    .c(al_540b209),
    .o({al_27e1f3bc,open_n11}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e17073e0 (
    .a(al_11033702[12]),
    .b(al_1315ed94[12]),
    .c(al_27e1f3bc),
    .o({al_e64e5f1c,open_n12}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_ba5a9770 (
    .a(al_11033702[13]),
    .b(1'b0),
    .c(al_e64e5f1c),
    .o({al_e761a920,open_n13}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_cb976531 (
    .a(al_11033702[14]),
    .b(1'b0),
    .c(al_e761a920),
    .o({al_42ead886,open_n14}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e5cd5640 (
    .a(al_11033702[15]),
    .b(1'b0),
    .c(al_42ead886),
    .o({al_f5a327ab,open_n15}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e4d1cd55 (
    .a(al_11033702[16]),
    .b(1'b0),
    .c(al_f5a327ab),
    .o({al_b23e28b5,open_n16}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_dc7e8c2c (
    .a(al_11033702[17]),
    .b(1'b0),
    .c(al_b23e28b5),
    .o({al_283f8d98,open_n17}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_9ed345ca (
    .a(al_11033702[18]),
    .b(1'b0),
    .c(al_283f8d98),
    .o({al_516747bd,open_n18}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_441ad9b2 (
    .a(al_11033702[1]),
    .b(al_1315ed94[1]),
    .c(al_a9fbe072),
    .o({al_3973d008,open_n19}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_36cc28eb (
    .a(al_11033702[19]),
    .b(1'b0),
    .c(al_516747bd),
    .o({al_88a2e01,open_n20}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_e18ee10 (
    .a(al_11033702[20]),
    .b(1'b0),
    .c(al_88a2e01),
    .o({al_424d2e3a,open_n21}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_99bd7325 (
    .a(al_11033702[21]),
    .b(1'b0),
    .c(al_424d2e3a),
    .o({al_5d3a435a,open_n22}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_8aa83152 (
    .a(al_11033702[22]),
    .b(1'b0),
    .c(al_5d3a435a),
    .o({al_4a5ad68f,open_n23}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_1c94cea5 (
    .a(al_11033702[23]),
    .b(1'b0),
    .c(al_4a5ad68f),
    .o({al_9646e713,open_n24}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_d0c6e291 (
    .a(al_11033702[24]),
    .b(1'b0),
    .c(al_9646e713),
    .o({al_6cee34b4,open_n25}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_b1db9e6d (
    .a(1'b0),
    .b(1'b1),
    .c(al_6cee34b4),
    .o({open_n26,al_c61b4192}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_9395428b (
    .a(al_11033702[2]),
    .b(al_1315ed94[2]),
    .c(al_3973d008),
    .o({al_4c40b6e5,open_n27}));
  AL_MAP_ADDER #(
    .ALUTYPE("A_LE_B"))
    al_f7ac689a (
    .a(al_11033702[3]),
    .b(al_1315ed94[3]),
    .c(al_4c40b6e5),
    .o({al_d63e42fe,open_n28}));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_affc23c8 (
    .a(numerator[0]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[0]),
    .e(al_c67bebad[0]),
    .o(al_9bfb1470[0]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_7e4247d5 (
    .a(numerator[10]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[10]),
    .e(al_c67bebad[10]),
    .o(al_9bfb1470[10]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_8f76e334 (
    .a(numerator[11]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[11]),
    .e(al_c67bebad[11]),
    .o(al_9bfb1470[11]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_43c29c9e (
    .a(numerator[12]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[12]),
    .e(al_c67bebad[12]),
    .o(al_9bfb1470[12]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_db832082 (
    .a(numerator[1]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[1]),
    .e(al_c67bebad[1]),
    .o(al_9bfb1470[1]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_3e04c0e7 (
    .a(numerator[2]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[2]),
    .e(al_c67bebad[2]),
    .o(al_9bfb1470[2]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_b86e3fac (
    .a(numerator[3]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[3]),
    .e(al_c67bebad[3]),
    .o(al_9bfb1470[3]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_1f499def (
    .a(numerator[4]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[4]),
    .e(al_c67bebad[4]),
    .o(al_9bfb1470[4]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_8f1711f3 (
    .a(numerator[5]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[5]),
    .e(al_c67bebad[5]),
    .o(al_9bfb1470[5]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_6e1c653d (
    .a(numerator[6]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[6]),
    .e(al_c67bebad[6]),
    .o(al_9bfb1470[6]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_b46e3fd7 (
    .a(numerator[7]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[7]),
    .e(al_c67bebad[7]),
    .o(al_9bfb1470[7]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_d21f8608 (
    .a(numerator[8]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[8]),
    .e(al_c67bebad[8]),
    .o(al_9bfb1470[8]));
  AL_MAP_LUT5 #(
    .EQN("((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(A)*~(B)+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*~(B)+~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*A*B+(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*A*B)"),
    .INIT(32'hbbb88b88))
    al_42e41119 (
    .a(numerator[9]),
    .b(start),
    .c(al_c61b4192),
    .d(al_1315ed94[9]),
    .e(al_c67bebad[9]),
    .o(al_9bfb1470[9]));
  AL_DFF_0 al_b26d62bf (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_d0dc52fd[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1deac949[0]));
  AL_DFF_0 al_809f7104 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_d0dc52fd[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1deac949[1]));
  AL_DFF_0 al_c1468025 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_d0dc52fd[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1deac949[2]));
  AL_DFF_0 al_c19d8344 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_d0dc52fd[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1deac949[3]));
  AL_DFF_0 al_b40e8e05 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[9]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[8]));
  AL_DFF_0 al_2259e8d1 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[10]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[9]));
  AL_DFF_0 al_5f624aaf (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[11]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[10]));
  AL_DFF_0 al_d532b054 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[12]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[11]));
  AL_DFF_0 al_9d987fc8 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[12]));
  AL_DFF_0 al_220744cc (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[13]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[13]));
  AL_DFF_0 al_e241f44a (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[14]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[14]));
  AL_DFF_0 al_897da5eb (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[15]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[15]));
  AL_DFF_0 al_9e863954 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[16]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[16]));
  AL_DFF_0 al_a186fcad (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[17]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[17]));
  AL_DFF_0 al_fd544ba8 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[1]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[0]));
  AL_DFF_0 al_21ba363c (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[18]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[18]));
  AL_DFF_0 al_c602bc36 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[19]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[19]));
  AL_DFF_0 al_be443a52 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[20]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[20]));
  AL_DFF_0 al_961a8bb7 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[21]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[21]));
  AL_DFF_0 al_6d594c9b (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[22]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[22]));
  AL_DFF_0 al_5e95843a (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_1c1b24e7[23]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_11033702[23]));
  AL_DFF_0 al_d701a9b8 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(denominator[12]),
    .en(1'b1),
    .sr(~start),
    .ss(1'b0),
    .q(al_11033702[24]));
  AL_DFF_0 al_40ebe0d4 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[2]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[1]));
  AL_DFF_0 al_b4cd3408 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[3]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[2]));
  AL_DFF_0 al_16607eff (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[4]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[3]));
  AL_DFF_0 al_2e1082f (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[5]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[4]));
  AL_DFF_0 al_806f02ed (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[6]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[5]));
  AL_DFF_0 al_e97bb64b (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[7]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[6]));
  AL_DFF_0 al_f7f2da08 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_11033702[8]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_11033702[7]));
  AL_DFF_0 al_596b0fc4 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[8]));
  AL_DFF_0 al_5cfa2c1e (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[9]));
  AL_DFF_0 al_c56c02f8 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[10]));
  AL_DFF_0 al_60ec2662 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[11]));
  AL_DFF_0 al_ea3f598e (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[12]));
  AL_DFF_0 al_16ad90bc (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[0]));
  AL_DFF_0 al_e1044ec0 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[1]));
  AL_DFF_0 al_16da6de4 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[2]));
  AL_DFF_0 al_e819e904 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[3]));
  AL_DFF_0 al_4990808d (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[4]));
  AL_DFF_0 al_d51e17ed (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[5]));
  AL_DFF_0 al_b67f884b (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[6]));
  AL_DFF_0 al_ff3308ea (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_9bfb1470[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(al_1315ed94[7]));
  AL_DFF_0 al_c1e3ea45 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[8]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[8]));
  AL_DFF_0 al_b7aa029f (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[9]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[9]));
  AL_DFF_0 al_2f4f18cf (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[10]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[10]));
  AL_DFF_0 al_42a7eb97 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[11]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[11]));
  AL_DFF_0 al_f77c099a (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[12]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[12]));
  AL_DFF_0 al_53efe64b (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[0]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[0]));
  AL_DFF_0 al_26890f76 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[1]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[1]));
  AL_DFF_0 al_802c7023 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[2]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[2]));
  AL_DFF_0 al_9c45670 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[3]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[3]));
  AL_DFF_0 al_b0a0e999 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[4]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[4]));
  AL_DFF_0 al_739d9f2f (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[5]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[5]));
  AL_DFF_0 al_7f9eee7d (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[6]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[6]));
  AL_DFF_0 al_741313a7 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[7]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(quotient[7]));
  AL_DFF_0 al_ce6e5997 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[7]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[8]));
  AL_DFF_0 al_7c322425 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[8]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[9]));
  AL_DFF_0 al_1f65ec13 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[9]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[10]));
  AL_DFF_0 al_63457b5b (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[10]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[11]));
  AL_DFF_0 al_11fe6cd4 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[11]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[12]));
  AL_DFF_0 al_5e904a35 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_c61b4192),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[0]));
  AL_DFF_0 al_116f1db3 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[0]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[1]));
  AL_DFF_0 al_6c993e82 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[1]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[2]));
  AL_DFF_0 al_23963ea6 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[2]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[3]));
  AL_DFF_0 al_6c25cf29 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[3]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[4]));
  AL_DFF_0 al_e7cc423c (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[4]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[5]));
  AL_DFF_0 al_2c6ea385 (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[5]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[6]));
  AL_DFF_0 al_a356779f (
    .ar(1'b0),
    .as(1'b0),
    .clk(clk),
    .d(al_327525b3[6]),
    .en(1'b1),
    .sr(start),
    .ss(1'b0),
    .q(al_327525b3[7]));
  AL_DFF_0 al_f27b108d (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[8]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[8]));
  AL_DFF_0 al_d1a67c2f (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[9]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[9]));
  AL_DFF_0 al_a7f95d18 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[10]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[10]));
  AL_DFF_0 al_da9c9cea (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[11]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[11]));
  AL_DFF_0 al_40fd9462 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[12]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[12]));
  AL_DFF_0 al_cbbb4490 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[0]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[0]));
  AL_DFF_0 al_30153836 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[1]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[1]));
  AL_DFF_0 al_37ead40d (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[2]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[2]));
  AL_DFF_0 al_7625712c (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[3]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[3]));
  AL_DFF_0 al_2531de5d (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[4]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[4]));
  AL_DFF_0 al_2ccbdc6d (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[5]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[5]));
  AL_DFF_0 al_2c62c395 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[6]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[6]));
  AL_DFF_0 al_ee1990ef (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(al_1315ed94[7]),
    .en(al_114eba31),
    .sr(1'b0),
    .ss(1'b0),
    .q(remainder[7]));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_8b9c8457 (
    .a(al_1315ed94[7]),
    .b(al_11033702[7]),
    .c(al_5e8c29e5),
    .o({al_8c86c74b,al_c67bebad[7]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_5e613dd7 (
    .a(al_1315ed94[8]),
    .b(al_11033702[8]),
    .c(al_8c86c74b),
    .o({al_b0dd8135,al_c67bebad[8]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_27c8842d (
    .a(al_1315ed94[9]),
    .b(al_11033702[9]),
    .c(al_b0dd8135),
    .o({al_22690046,al_c67bebad[9]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_462a01f1 (
    .a(al_1315ed94[10]),
    .b(al_11033702[10]),
    .c(al_22690046),
    .o({al_4078d2ac,al_c67bebad[10]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_9b3bce39 (
    .a(al_1315ed94[11]),
    .b(al_11033702[11]),
    .c(al_4078d2ac),
    .o({al_4eb1aec6,al_c67bebad[11]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_f829bb24 (
    .a(al_1315ed94[12]),
    .b(al_11033702[12]),
    .c(al_4eb1aec6),
    .o({open_n29,al_c67bebad[12]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    al_f5224f5b (
    .a(1'b0),
    .o({al_955595a3,open_n32}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_e6e3dfcf (
    .a(al_1315ed94[0]),
    .b(al_11033702[0]),
    .c(al_955595a3),
    .o({al_b31da46b,al_c67bebad[0]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_68abff86 (
    .a(al_1315ed94[1]),
    .b(al_11033702[1]),
    .c(al_b31da46b),
    .o({al_dfd4a7b0,al_c67bebad[1]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_8de058bd (
    .a(al_1315ed94[2]),
    .b(al_11033702[2]),
    .c(al_dfd4a7b0),
    .o({al_5a23a824,al_c67bebad[2]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_bbd4c846 (
    .a(al_1315ed94[3]),
    .b(al_11033702[3]),
    .c(al_5a23a824),
    .o({al_40fca01c,al_c67bebad[3]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_222b6767 (
    .a(al_1315ed94[4]),
    .b(al_11033702[4]),
    .c(al_40fca01c),
    .o({al_7fc49024,al_c67bebad[4]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_9c7fbfa5 (
    .a(al_1315ed94[5]),
    .b(al_11033702[5]),
    .c(al_7fc49024),
    .o({al_ce2d27ed,al_c67bebad[5]}));
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    al_fd218d47 (
    .a(al_1315ed94[6]),
    .b(al_11033702[6]),
    .c(al_ce2d27ed),
    .o({al_5e8c29e5,al_c67bebad[6]}));

endmodule 

