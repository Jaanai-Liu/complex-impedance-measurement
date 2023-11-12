module top (
           input clk,
           input rstn,

           input wire key_col,
           output wire key_row,
           output wire led,

           output txd
       );

wire [31: 0] fre;
wire [31: 0] data_bcd;
assign fre = 32'd60000;
wire [7: 0] data_out;

wire end_send;/* synthesis keep */
wire tx_en;/* synthesis keep */
//assign data_bcd = 16'b1110_1010_0110_0000;

/*****************************************************/
bcd_32  bcd_32_inst (
    .fre                     ( fre   [31: 0] ),
 
    .data                    ( data_bcd  [31: 0] )
);
/*****************************************************/


/********************矩阵键盘控制*******************/
wire key_in;
assign led = key_in;
assign key_row = 0;
assign key_in = !key_col;
wire key_flag;
key_filter key_filter_inst (
    .sys_clk                 ( clk         ),
    .sys_rst_n               ( rstn        ),
    .key_in                  ( key_in      ),

    .key_flag                ( key_flag    )
);
/*************************************************/


/*****************************************************/
uart_send uart_send_inst (
              .sys_clk ( clk ),
              .sys_rst_n ( rstn ),
              .uart_en ( tx_en ),
              .uart_din ( data_out [7: 0] ),

              .uart_tx_busy ( uart_tx_busy ),
              .uart_txd ( txd )
          );
/*****************************************************/

/*****************************************************/
Uart_Control Uart_Control_inst (
                 .clk ( clk ),
                 .data_in ( data_bcd [19: 4] ),

                 .start_send ( key_flag ),
                 .tx_rdy ( !uart_tx_busy ),

                 .end_send ( end_send ),

                 .tx_en ( tx_en ),
                 .data_out ( data_out [7: 0] )
             );
/*****************************************************/


endmodule
