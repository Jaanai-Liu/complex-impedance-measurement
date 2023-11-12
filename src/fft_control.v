module fft_control (
           input wire clk,
           input wire rstn,
           input wire end_cordic,
           input wire valid_fft,
           input wire [10: 0] addr,

           input wire empty_flag,
           input wire [10: 0] step_freq,

           output wire fifo_we,/* synthesis keep */
           output reg fifo_re,/* synthesis keep */

           output reg fft_reset,
           output reg [10: 0] reg_addr
       );

parameter IDLE = 3'd0;//静默状态，FFT复位信号为1
parameter S1 = 3'd1;//数据存储到fifo
parameter S2 = 3'd2;//输出到fft
parameter S3 = 3'd3;//计算模长及角度差
parameter S4 = 3'd4;//计算模长及角度差

reg [2: 0] state;/* synthesis keep */
reg [2: 0] nstate;/* synthesis keep */

reg [12: 0] cnt_freq;
reg [9: 0] cnt_fifo;
wire end_fifo;
assign end_fifo = (cnt_fifo == 10'd256);

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
                if(valid_fft)
                    nstate = S1;
                else
                    nstate = IDLE;
            S1:
                if(end_fifo)
                    nstate = S2;
                else
                    nstate = S1;
            S2:
                nstate = S3;
            S3: 
                if(empty_flag)
                    nstate = S4;
                else
                    nstate = S3;
            S4:
                if(end_cordic)
                    nstate = IDLE;
                else
                    nstate = S4;
            default:
                nstate = IDLE;
        endcase
    end
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        fft_reset <= 0;
        cnt_fifo <= 0;
        //reg_addr <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                fft_reset <= 1;
                cnt_fifo <= 0;
                cnt_freq <= 0;
                //reg_addr <= reg_addr;
            end
            S1: begin
                fft_reset <= 1;
                if(cnt_freq == (step_freq - 1'b1)) begin
                    cnt_freq <= 0;
                end
                else begin
                    cnt_freq <= cnt_freq + 1'b1;
                end

                if(cnt_freq == (step_freq - 1'b1))
                    cnt_fifo <= cnt_fifo + 1'b1;
                else
                    cnt_fifo <= cnt_fifo;
                //reg_addr <= reg_addr;//addr
            end
            S2: begin
                fft_reset <= 1;
                cnt_freq <= 0;
                cnt_fifo <= 0;
                fifo_re <= 1;
            end
            S3: begin
                fft_reset <= 0;
                cnt_freq <= 0;
                cnt_fifo <= 0;
                if(!empty_flag)
                    fifo_re <= 1;
                else
                    fifo_re <= 0;
            end
            S4: begin
                fft_reset <= 0;
                fifo_re <= 0;
            end
            default: begin
                fft_reset <= 1;
                //reg_addr <= 0;
            end
        endcase
    end
end

always @(posedge clk) begin
    if(fifo_we && (cnt_fifo == 1'b0))
        reg_addr <= addr;
    else
        reg_addr <= reg_addr;
end

assign fifo_we = (cnt_freq == (step_freq - 1'b1)) && (state == S1) && (cnt_fifo < 10'd256);

endmodule
