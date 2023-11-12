module fft_control (
           input wire clk,
           input wire rstn,
           input wire en_start,
           input wire valid_dds,
           input wire [10: 0] addr,

           output reg fft_reset,
           output reg [10: 0] reg_addr
       );

parameter IDLE = 2'd0;//静默状态，FFT复位信号为1
parameter S1 = 2'd1;//存储输入起始位置的ROM数据，同时rst = 1
parameter S2 = 2'd2;//wait en信号
parameter S3 = 2'd3;//计算模长及角度差，如果是时序逻辑

reg [1: 0] state;/* synthesis keep */
reg [1: 0] nstate;/* synthesis keep */

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        state <= 0;
    end
    else begin
        state <= nstate;
    end
end

always @( * ) begin
    if (!rstn) begin
        nstate = 0;
    end
    else begin
        case (state)
            IDLE:
                if(valid_dds)
                    nstate = S1;
                else
                    nstate = IDLE;
            S1:
                nstate = S2;
            S2:
                nstate = S3;
            S3:
                if (en_start)
                    nstate = IDLE;
                else
                    nstate = S3;
            default:
                nstate = IDLE;
        endcase
    end
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        fft_reset <= 0;
        reg_addr <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                fft_reset <= 1;
                reg_addr <= reg_addr;
            end
            S1: begin
                fft_reset <= 0;
                reg_addr <= addr;//addr
            end
            S2: begin
                fft_reset <= 0;
                reg_addr <= reg_addr;
            end
            S3: begin
                fft_reset <= 0;
                reg_addr <= reg_addr;
            end
            default: begin
                fft_reset <= 0;
                reg_addr <= 0;
            end
        endcase
    end
end

endmodule
