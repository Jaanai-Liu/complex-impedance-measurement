//通过按键控制测量开始，测试时默认循环测量不停止

//没有输出的ROM数据，可以先设置不同的参数进行测试，然后放进来测试单频点切换

module dds_control (
           input wire clk,
           input wire rstn,
           input wire end_cordic,
           //input wire [15: 0] data_sqrt,
           //input wire [18: 0] angle,

           input wire key_single,
           input wire key_single_start,
           input wire key_sweep,
           input wire key_sweep_start,

           input wire end_send_uart,


           //output reg [12: 0] step_freq,
           //output reg [9: 0] location,
           //output reg fword,
           //output reg pword,
           
           output reg [1: 0] method_state,

           output reg [5: 0] addr,
           output reg valid_dds
           //控制一次运行开始
       );
parameter addr_max = 6'd37;
parameter cnt_addr_max = 4'd4;

//静默状态，等待按键，跳转到下一个状态测量
parameter IDLE = 3'd0;
parameter S_single_pre = 3'd1;
parameter S_single_ing = 3'd2;
parameter S_single_end = 3'd3;
parameter S_sweep_pre = 3'd4;
parameter S_sweep_ing = 3'd5;
parameter S_sweep_end = 3'd6;
parameter S_ref = 3'd7;
//状态IDLE：等待启动
//状态1：使能信号为1，开始测量
//状态2：数据存入 FIFO，间隔不同，采样频率不同，输出写使能信号
//状态3：收到结束信号，存储测量数据，更改频率，
//       若测量频率完成，则回到IDLE，若未完成，回到S1

//parameter step = 32'd85899; //步长32'd85899=2k

reg [2: 0] state;
reg [2: 0] nstate;

reg [15: 0] reg_sqrt [128: 0];
reg [18: 0] reg_angle [128: 0];

reg [4: 0] cnt_valid_dds;
//reg [5: 0] addr;

wire end_sweep;
assign end_sweep = (addr == addr_max - 1'b1) && (state == S_sweep_ing) && (end_send_uart);

always @( * ) begin
    if(state == S_single_ing)
        method_state = 2'b10;
    else if(state == S_sweep_ing)
        method_state = 2'b11;
    else
        method_state = 2'b0;
end

//调试时，按键顺序输出，看数据是否正确。
wire end_send_sweep;//未定义条件，输出到串口，完成后跳转到IDLE

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        state <= IDLE;
    else
        state <= nstate;
end

always @( * ) begin
    if (!rstn)
        nstate = 0;
    else begin
        case (state)
            IDLE:
                if (key_single)
                    nstate = S_single_ing;
                else if (key_sweep)
                    nstate = S_sweep_pre;
                else
                    nstate = IDLE;
            S_single_pre:
                nstate = S_single_ing;
            S_single_ing:
                if (key_sweep)
                    nstate = S_sweep_pre;
                //else if (end_cordic)
                //    nstate = S_single_end;
                else
                    nstate = S_single_ing;
            S_single_end:
                if (end_send_uart) begin
                    nstate = S_single_ing;
                end
                else begin
                    nstate = S_single_end;
                end
            S_sweep_pre:
                nstate = S_sweep_ing;
            S_sweep_ing:
                if (end_sweep)
                    nstate = IDLE;///S_sweep_end;
                else
                    nstate = S_sweep_ing;
            S_sweep_end:
                if(end_send_sweep) begin//串口传输完成
                    nstate = IDLE;
                end
                else begin
                    nstate = S_sweep_end;
                end
            default:
                nstate = IDLE;
        endcase
    end
end

reg [3: 0] cnt_addr;
reg [5: 0] cnt_s_addr;
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        valid_dds <= 0;
        addr <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                valid_dds <= 0;
                addr <= 0;
                cnt_addr <= 0;
                cnt_s_addr <= 0;
            end
            S_single_pre: begin
                valid_dds <= 0;
                addr <= 0;
                cnt_addr <= 0;
            end
            S_single_ing: begin
                /******************************
                if (key_single_start) begin
                    valid_dds <= 1;
                    if (addr == (addr_max - 1))
                        addr <= 1'b0;
         
                    else if (addr < addr_max)
                        addr <= addr + 1'b1;
                end
                else begin
                    valid_dds <= 0;
                    addr <= addr;
                end
                /******************************/
                /******************************************/
                if (key_single_start) begin
                    valid_dds <= 1;
                    if (cnt_addr == (cnt_addr_max - 1))
                        cnt_addr <= 1'b0;
         
                    else if (cnt_addr < cnt_addr_max)
                        cnt_addr <= cnt_addr + 1'b1;
                end
                else begin
                    valid_dds <= 0;
                    addr <= addr;
                end

                case (cnt_addr)
                    //4'd0: addr <= 6'd0;
                    4'd0: addr <= 6'd10;
                    4'd1: addr <= 6'd18;
                    4'd2: addr <= 6'd22;
                    4'd3: addr <= 6'd27;
                    default: addr <= 6'd0;
                endcase
                /******************************************/
            end
            S_single_end: begin
                //输出到串口，保证不多发valid_dds
                ;
            end
            S_sweep_pre: begin
                valid_dds <= 0;
                addr <= 0;
                cnt_addr <= 0;
                cnt_s_addr <= 0;
            end
            S_sweep_ing: begin
                /*
                if (cnt_valid_dds <= 5'd10)
                    valid_dds <= 1'b1;
                else
                    valid_dds <= 1'b0;
                */
                valid_dds <= (end_send_uart || key_sweep) && (addr < addr_max - 1'b1);
                /*******************************/
                if (end_send_uart)
                    if (addr < addr_max)
                        addr <= addr + 1'b1;
                    else
                        addr <= addr;
                else 
                    addr <= addr;
                /*******************************/
                /*******************************
                if (end_send_uart)
                    if (cnt_s_addr <= 6'd38)
                        cnt_s_addr <= cnt_s_addr + 1'b1;
                    else
                        cnt_s_addr <= cnt_s_addr;
                else 
                    cnt_s_addr <= cnt_s_addr;
                
                addr <= cnt_s_addr - 1'b1;
                /*******************************/
            end
            default: begin
                valid_dds <= 0;
                addr <= 0;
            end
        endcase
    end
end

always @(posedge clk) begin
    if (key_sweep_start || end_cordic)
        cnt_valid_dds <= 0;
    else if (cnt_valid_dds <= 5'b10)
        cnt_valid_dds <= cnt_valid_dds + 1'b1;
    else
        cnt_valid_dds <= cnt_valid_dds;
end


//最好移动到外面，或者把串口模块放在这里
/**********************将数据储存到寄存器组中******************
always @( posedge clk ) begin
    if (end_cordic) begin
        reg_angle[cnt_test - 1] = angle;
        reg_sqrt[cnt_test - 1] = data_sqrt;
    end
    else begin
        reg_angle[cnt_test - 1] <= reg_angle[cnt_test - 1];
        reg_sqrt[cnt_test - 1] <= reg_sqrt[cnt_test - 1];
    end
end
/*************************************************************/


//译码器或者使用ROM
/*****修改为state == S1，频率变化一次？ IDLE时复位为0************
always @( * ) begin
    case (cnt_test)
        10'd1: ;
        default: ;
    endcase
end
/*************************************************************/

/*
always @( posedge clk ) begin
    if(state == IDLE) begin
        fword <= 0;
    end
    else if (end_cordic) begin
        fword <= fword + step;
    end
    else begin
        fword <= fword;
    end
end
/*************************************************************/

endmodule
