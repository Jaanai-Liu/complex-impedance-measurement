module bcd_12 (
           input [11: 0]hum,
           output [11: 0]data

       );
reg [23: 0] idata;
integer i;
always@( * ) begin
    idata = hum;
    for (i = 0; i < 12; i = i + 1) begin
        //               if(idata[11:8]>4'd4)
        //                    idata[11:8] =idata[11:8] + 4'd3;
        if (idata[15: 12] > 4'd4)
            idata[15: 12] = idata[15: 12] + 4'd3;
        if (idata[19: 16] > 4'd4)
            idata[19: 16] = idata[19: 16] + 4'd3;
        if (idata[23: 20] > 4'd4)
            idata[23: 20] = idata[23: 20] + 4'd3;
        //					 if(idata[27:24]>4'd4)
        //                    idata[27:24] =idata[27:24] + 4'd3;
        //					 if(idata[31:28]>4'd4)
        //                    idata[31:28] =idata[31:28] + 4'd3;
        idata = idata << 1;
    end
end
assign data = idata[23: 12];

endmodule
