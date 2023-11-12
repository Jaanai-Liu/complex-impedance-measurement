module dds (
           input clk,//100MHz
           input rstn,
           input [31: 0] fword,//频率参数，不是实际频率
           input [11: 0] pword,
           output reg [10: 0] addr,/* synthesis keep */
           output [7: 0] data
       );

reg [31: 0] r_fword;
reg [11: 0] r_pword;
reg [31: 0] cnt;

/***************寄存器，储存输入的频率和相位***************/
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        r_fword <= 0;
        //r_pword <= 0;
    end
    else begin
        r_fword <= fword;
        //r_pword <= pword;
    end
end

/**************计数器***************/
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        cnt <= 0;
    end
    else begin
        cnt <= cnt + r_fword;
    end
end

/**************ROM地址***************/
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        addr <= 0;
    end
    else begin
        //addr <= r_pword + cnt[31: 21];//计数器取前面的位数，做除法
        addr <= cnt[31: 21];//计数器取前面的位数，做除法
    end
end

/**************ROM，取出波形对应的电压***************/
rom_dac rom_dac (
            .clka(clk),
            .addra(addr),
            .doa(data)
        );

endmodule
