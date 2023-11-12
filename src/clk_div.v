module clk_div (
           input clk_100m,//10ns
           input rstn,
           //output reg clk_10k,//100_000ns
           //output reg clk_20k,//50_000ns
           //output reg clk_30k,
           //output reg clk_100k,
           //output reg clk_500k,
           output reg clk_51_2k
       );

//reg [19: 0] cnt_10k;
//reg [19: 0] cnt_20k;
//reg [19: 0] cnt_30k;
//reg [19: 0] cnt_100k;
//reg [19: 0] cnt_500k;
reg [19: 0] cnt_51_2k;

/************************10k***************************
always @(posedge clk_100m or negedge rstn) begin
    if(!rstn) begin
        cnt_10k <= 0;
    end
    else begin
        if (cnt_10k == 20'd5000) begin
            cnt_10k <= 0;
        end
        else begin
            cnt_10k <= cnt_10k + 1'b1;
        end
    end
end
always @(posedge clk_100m or negedge rstn) begin
    if (!rstn) begin
        clk_10k <= 0;
    end
    else begin
        if (cnt_10k == 20'd5000 - 1'b1) begin
            clk_10k <= !clk_10k;
        end
        else begin
            clk_10k <= clk_10k;
        end
    end
end
/******************************************************/

/************************20k***************************
always @(posedge clk_100m or negedge rstn) begin
    if(!rstn) begin
        cnt_20k <= 0;
    end
    else begin
        if (cnt_20k == 20'd2500) begin
            cnt_20k <= 0;
        end
        else begin
            cnt_20k <= cnt_20k + 1'b1;
        end
    end
end
always @(posedge clk_100m or negedge rstn) begin
    if (!rstn) begin
        clk_20k <= 0;
    end
    else begin
        if (cnt_20k == 20'd2500 - 1'b1) begin
            clk_20k <= !clk_20k;
        end
        else begin
            clk_20k <= clk_20k;
        end
    end
end
/*****************************************************/

/************************30k***************************
always @(posedge clk_100m or negedge rstn) begin
    if(!rstn) begin
        cnt_30k <= 0;
    end
    else begin
        if (cnt_30k == 20'd1667) begin
            cnt_30k <= 0;
        end
        else begin
            cnt_30k <= cnt_30k + 1'b1;
        end
    end
end
always @(posedge clk_100m or negedge rstn) begin
    if (!rstn) begin
        clk_30k <= 0;
    end
    else begin
        if (cnt_30k == 20'd1667 - 1'b1) begin
            clk_30k <= !clk_30k;
        end
        else begin
            clk_30k <= clk_30k;
        end
    end
end
/*****************************************************/

/************************100k***************************
always @(posedge clk_100m or negedge rstn) begin
    if(!rstn) begin
        cnt_100k <= 0;
    end
    else begin
        if (cnt_100k == 20'd499) begin
            cnt_100k <= 0;
        end
        else begin
            cnt_100k <= cnt_100k + 1'b1;
        end
    end
end
always @(posedge clk_100m or negedge rstn) begin
    if (!rstn) begin
        clk_100k <= 0;
    end
    else begin
        if (cnt_100k == 20'd499 - 1'b1) begin
            clk_100k <= !clk_100k;
        end
        else begin
            clk_100k <= clk_100k;
        end
    end
end
/******************************************************/

/************************500k***************************
always @(posedge clk_100m or negedge rstn) begin
    if(!rstn) begin
        cnt_500k <= 0;
    end
    else begin
        if (cnt_500k == 20'd99) begin
            cnt_500k <= 0;
        end
        else begin
            cnt_500k <= cnt_500k + 1'b1;
        end
    end
end
always @(posedge clk_100m or negedge rstn) begin
    if (!rstn) begin
        clk_500k <= 0;
    end
    else begin
        if (cnt_500k == 20'd99 - 1'b1) begin
            clk_500k <= !clk_500k;
        end
        else begin
            clk_500k <= clk_500k;
        end
    end
end
/******************************************************/

/************************51_2k***************************/
always @(posedge clk_100m or negedge rstn) begin
    if(!rstn) begin
        cnt_51_2k <= 0;
    end
    else begin
        if (cnt_51_2k == 20'd388) begin//20'd973
            cnt_51_2k <= 0;
        end
        else begin
            cnt_51_2k <= cnt_51_2k + 1'b1;
        end
    end
end
always @(posedge clk_100m or negedge rstn) begin
    if (!rstn) begin
        clk_51_2k <= 0;
    end
    else begin
        if (cnt_51_2k == 20'd388 - 1'b1) begin//20'd973
            clk_51_2k <= !clk_51_2k;
        end
        else begin
            clk_51_2k <= clk_51_2k;
        end
    end
end
/******************************************************/

endmodule
