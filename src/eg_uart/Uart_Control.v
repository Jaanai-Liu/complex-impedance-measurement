module Uart_Control (
           input wire clk,
           //input wire rstn,
           //input wire [15: 0] data_in,
           input wire [7: 0] method,
           input wire [19: 0] freq,
           input wire [19: 0] sqrt_data,
           input wire [11: 0] angle_data,
           input wire [7: 0] angle_sign,

           input wire [31: 0] sqrt_data_wave,
           input wire [11: 0] angle_data_wave,

           input wire switch,

           input wire start_send,

           output reg tx_en,

           output reg end_send,/* synthesis keep */
           input wire tx_rdy,
           output wire [7: 0] data_out_out
       );

//parameter cnt_max = 10'd5;
wire [9: 0] cnt_max;
/*
reg [31: 0] data_reg;
always @(posedge clk) begin
    if(start_send)
        data_reg <= data_in;
    else
        data_reg <= data_reg;
end
*/

reg [7: 0] data_out_wave;
reg [7: 0] data_out;
assign data_out_out = switch ? data_out_wave : data_out;
assign cnt_max = switch ? 10'd9 : 10'd46;

reg [9: 0] cnt;

reg [29: 0] cnt_clk;
always @(posedge clk) begin
    if (cnt_clk == 30'd10000) begin
        cnt_clk <= 0;
    end
    else begin
        cnt_clk <= cnt_clk + 1'b1;
    end
end

/**********循环使能发送信号**********/
always @(posedge clk) begin
    if (cnt_clk == 30'd9999) begin
        if(cnt <= cnt_max - 1'b1)
            tx_en <= 1'b1;
        else
            tx_en <= 1'b0;
    end
    else begin
        tx_en <= 0;
    end
end
/***********************************/


reg reg_tx_rdy;
wire cond_out; /* synthesis keep */
wire cond_en;
reg [9: 0] cnt_cond;
/**********************准备发送生成使能信号*******************/
always @(posedge clk) begin
    reg_tx_rdy <= tx_rdy;
end
assign cond_en = (reg_tx_rdy != tx_rdy) && (reg_tx_rdy == 0);
always @(posedge clk) begin
    if(cond_en) begin
        cnt_cond <= 1'b0;
    end
    else
        if(cnt_cond <= 10'd100)
            cnt_cond <= cnt_cond + 1'b1;
        else
            cnt_cond <= cnt_cond;
end
assign cond_out = (cnt_cond == 10'd99) && (cnt <= cnt_max - 1'b1);
/***********************************************************/


always @(posedge clk) begin
    if(start_send)
        cnt <= 1'b0;
    else begin
        if (cond_out) begin
            if (cnt <= cnt_max)
                cnt = cnt + 1'b1;
                //cnt <= 0;
            else 
                cnt <= cnt;
        end
        else begin
            cnt = cnt;
        end
    end
end

reg [11: 0] reg_angle_data_wave;
always @(posedge clk) begin
    if(start_send)
        reg_angle_data_wave <= angle_data_wave;
    else
        reg_angle_data_wave <= reg_angle_data_wave;
end

reg [11: 0] reg_angle_data;
always @(posedge clk) begin
    if(start_send)
        reg_angle_data <= angle_data;
    else
        reg_angle_data <= reg_angle_data;
end

reg [7: 0] reg_angle_sign;
always @(posedge clk) begin
    if(start_send)
        reg_angle_sign <= angle_sign;
    else
        reg_angle_sign <= reg_angle_sign; 
end

wire [7: 0] freq_5;
wire [7: 0] freq_4;
wire [7: 0] freq_3;
wire [7: 0] freq_2;
wire [7: 0] freq_1;
wire [7: 0] sqrt_data_5;
wire [7: 0] sqrt_data_4;
wire [7: 0] sqrt_data_3;
wire [7: 0] sqrt_data_2;
wire [7: 0] sqrt_data_1;
wire [7: 0] angle_3;
wire [7: 0] angle_2;
wire [7: 0] angle_1;
ascii  ascii_freq5 (
    .i                       ( freq[19: 16] ),
    .o                       ( freq_5[7: 0] )
);
ascii  ascii_freq4 (
    .i                       ( freq[15: 12] ),
    .o                       ( freq_4[7: 0] )
);
ascii  ascii_freq3 (
    .i                       ( freq[11: 8] ),
    .o                       ( freq_3[7: 0] )
);
ascii  ascii_freq2 (
    .i                       ( freq[7: 4] ),
    .o                       ( freq_2[7: 0] )
);
ascii  ascii_freq1 (
    .i                       ( freq[3: 0] ),
    .o                       ( freq_1[7: 0] )
);
ascii  ascii_sqrt5 (
    .i                       ( sqrt_data[19: 16] ),
    .o                       ( sqrt_data_5[7: 0] )
);
ascii  ascii_sqrt4 (
    .i                       ( sqrt_data[15: 12] ),
    .o                       ( sqrt_data_4[7: 0] )
);
ascii  ascii_sqrt3 (
    .i                       ( sqrt_data[11: 8] ),
    .o                       ( sqrt_data_3[7: 0] )
);
ascii  ascii_sqrt2 (
    .i                       ( sqrt_data[7: 4] ),
    .o                       ( sqrt_data_2[7: 0] )
);
ascii  ascii_sqrt1 (
    .i                       ( sqrt_data[3: 0] ),
    .o                       ( sqrt_data_1[7: 0] )
);
ascii  ascii_angle3 (
    .i                       ( reg_angle_data[11: 8] ),
    .o                       ( angle_3[7: 0] )
);
ascii  ascii_angle2 (
    .i                       ( reg_angle_data[7: 4] ),
    .o                       ( angle_2[7: 0] )
);
ascii  ascii_angle1 (
    .i                       ( reg_angle_data[3: 0] ),
    .o                       ( angle_1[7: 0] )
);
/*************************************************************/
always @( * ) begin
    case (cnt)
        10'd0://表示模式：单频点0100_0000或者扫频1000_0000
            data_out = 8'h66;//f method;//{4'b0100, 4'b0};
        10'd1:
            data_out = 8'h72;//r
        10'd2:
            data_out = 8'h65;//e
        10'd3:
            data_out = 8'h71;//q
        10'd4:
            data_out = 8'h3A;//:
        10'd5:
            data_out = 8'h20;//space
        10'd6://表示频率字节1，频率后面两个0不传输
            data_out = freq_5;//{4'b0, freq[19: 16]};
        10'd7://表示频率字节2
            data_out = freq_4;//{4'b0, freq[15: 12]};
        10'd8://表示频率字节3
            data_out = freq_3;//{4'b0, freq[11: 8]};
        10'd9://表示频率字节4
            data_out = freq_2;//{4'b0, freq[7: 4]};
        10'd10://表示频率字节5
            data_out = freq_1;//{4'b0, freq[3: 0]};
        10'd11:
            data_out = 8'h30;//0
        10'd12:
            data_out = 8'h30;
        10'd13:
            data_out = 8'h48;//H
        10'd14:
            data_out = 8'h7A;//z
        10'd15:
            data_out = 8'h20;
        10'd16:
            data_out = 8'h20;
        10'd17:
            data_out = 8'h20;//space
        10'd18://字符Z，输出最大4050，输出最小50，1k电阻，阻抗最大为5位数
            data_out = 8'h5A;//Z
        10'd19:
            data_out = 8'h3A;//:
        10'd20:
            data_out = 8'h20;//space
        10'd21://表示阻抗字节1
            data_out = sqrt_data_5;//{4'b0, sqrt_data[19: 16]};
        10'd22://表示阻抗字节2
            data_out = sqrt_data_4;//{4'b0, sqrt_data[15: 12]};
        10'd23://表示阻抗字节3
            data_out = sqrt_data_3;//{4'b0, sqrt_data[11: 8]};
        10'd24://表示阻抗字节4
            data_out = sqrt_data_2;//{4'b0, sqrt_data[7: 4]};
        10'd25://表示阻抗字节5
            data_out = sqrt_data_1;//{4'b0, sqrt_data[3: 0]};
        10'd26:
            data_out = 8'h20;
        10'd27:
            data_out = 8'h20;
        10'd28:
            data_out = 8'h20;//space
        10'd29://角度
            data_out = 8'h61;//a
        10'd30://角度
            data_out = 8'h6E;//n
        10'd31://角度
            data_out = 8'h67;//g
        10'd32://角度
            data_out = 8'h6C;//l
        10'd33://角度
            data_out = 8'h65;//e
        10'd34://角度
            data_out = 8'h3A;//:
        10'd35://角度
            data_out = 8'h20;//space
        10'd36://表示角度正负：正2B，负：2D
            data_out = reg_angle_sign[7: 0];
        10'd37://表示角度字节1
            data_out = angle_3;//{4'b0, reg_angle_data[11: 8]};
        10'd38://表示角度字节2
            data_out = angle_2;//{4'b0, reg_angle_data[7: 4]};
        10'd39://表示角度字节3
            data_out = angle_1;//{4'b0, reg_angle_data[3: 0]};
        10'd40:// 
            data_out = 8'h20;
        10'd41:// 
            data_out = 8'h20;
        10'd42://
            data_out = 8'h20;//space
        10'd43:// 
            data_out = 8'h20;
        10'd44:// 
            data_out = 8'h20;
        10'd45://
            data_out = 8'h20;//space
        default:
            data_out = 8'b0000_0000;
    endcase
end
/*******************************************************************/

/**********************************************************
always @( * ) begin
    case (cnt)
        10'd0://表示模式：单频点0100_0000或者扫频1000_0000
            data_out = 8'h66;//f method;//{4'b0100, 4'b0};
        10'd1:
            data_out = 8'h72;//r
        10'd2:
            data_out = 8'h65;//e
        10'd3:
            data_out = 8'h71;//q
        10'd4:
            data_out = 8'h3A;//:
        10'd5:
            data_out = 8'h20;//space
        10'd6://表示频率字节1，频率后面两个0不传输
            data_out = {4'b0, freq[19: 16]};
        10'd7://表示频率字节2
            data_out = {4'b0, freq[15: 12]};
        10'd8://表示频率字节3
            data_out = {4'b0, freq[11: 8]};
        10'd9://表示频率字节4
            data_out = {4'b0, freq[7: 4]};
        10'd10://表示频率字节5
            data_out = {4'b0, freq[3: 0]};
        10'd11://字符Z，输出最大4050，输出最小50，1k电阻，阻抗最大为5位数
            data_out = 8'h5A;//Z
        10'd12:
            data_out = 8'h3A;//:
        10'd13:
            data_out = 8'h20;//space
        10'd14://表示阻抗字节1
            data_out = {4'b0, sqrt_data[19: 16]};
        10'd15://表示阻抗字节2
            data_out = {4'b0, sqrt_data[15: 12]};
        10'd16://表示阻抗字节3
            data_out = {4'b0, sqrt_data[11: 8]};
        10'd17://表示阻抗字节4
            data_out = {4'b0, sqrt_data[7: 4]};
        10'd18://表示阻抗字节5
            data_out = {4'b0, sqrt_data[3: 0]};
        10'd19://角度
            data_out = 8'h61;//a
        10'd20://角度
            data_out = 8'h6E;//n
        10'd21://角度
            data_out = 8'h67;//g
        10'd22://角度
            data_out = 8'h6C;//l
        10'd23://角度
            data_out = 8'h65;//e
        10'd24://角度
            data_out = 8'h3A;//:
        10'd25://角度
            data_out = 8'h20;//space
        10'd26://表示角度正负：正00011000，负：00011100
            data_out = reg_angle_sign[7: 0];
        10'd27://表示角度字节1
            data_out = {4'b0, reg_angle_data[11: 8]};
        10'd28://表示角度字节2
            data_out = {4'b0, reg_angle_data[7: 4]};
        10'd29://表示角度字节3
            data_out = {4'b0, reg_angle_data[3: 0]};
        10'd30:// \
            data_out = 8'h5C;// \
        10'd31:// n
            data_out = 8'h72;// r
        10'd32://角度
            data_out = 8'h20;//space
        10'd33:// \
            data_out = 8'h5C;// \
        10'd34:// n
            data_out = 8'h6E;// n
        10'd35://角度
            data_out = 8'h20;//space
        default:
            data_out = 8'b0000_0000;
    endcase
end
/**********************************************************/

reg [9: 0] cnt_reg;
always @(posedge clk) begin
    cnt_reg <= cnt;
end
always @( * ) begin
    if((cnt_reg == cnt_max - 1'b1) && (cnt == cnt_max))
        end_send = 1'b1;
end

/*************************************/
always @( * ) begin
    case (cnt)
        10'd0:
            data_out_wave = 8'hAA;
        10'd1:
            data_out_wave = sqrt_data_wave[7: 0];
        10'd2:
            data_out_wave = sqrt_data_wave[15: 8];
        10'd3:
            data_out_wave = sqrt_data_wave[23: 16];
        10'd4:
            data_out_wave = sqrt_data_wave[31: 24];
        10'd5:
            data_out_wave = reg_angle_data_wave[7: 0];
        10'd6:
            data_out_wave = {4'b0, reg_angle_data_wave[11: 8]};
        10'd7:
            data_out_wave = 8'b0;
        10'd8:
            data_out_wave = 8'b0;
        default:
            data_out_wave = 8'b1111_0000;
    endcase
end
/*************************************/

endmodule
