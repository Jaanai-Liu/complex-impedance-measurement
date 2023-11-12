module bcd_fre (
           input [31: 0] fre,
           output [31: 0]data

       );
reg [63: 0] idata;
integer i;
always@( * ) begin
    idata = fre;
    for (i = 0;i < 32;i = i + 1) begin
        if (idata[35: 32] > 4'd4)
            idata[35: 32] = idata[35: 32] + 4'd3;
        if (idata[39: 36] > 4'd4)
            idata[39: 36] = idata[39: 36] + 4'd3;
        if (idata[43: 40] > 4'd4)
            idata[43: 40] = idata[43: 40] + 4'd3;
        if (idata[47: 44] > 4'd4)
            idata[47: 44] = idata[47: 44] + 4'd3;
        if (idata[51: 48] > 4'd4)
            idata[51: 48] = idata[51: 48] + 4'd3;
        if (idata[55: 52] > 4'd4)
            idata[55: 52] = idata[55: 52] + 4'd3;
        if (idata[59: 56] > 4'd4)
            idata[59: 56] = idata[59: 56] + 4'd3;
        if (idata[63: 60] > 4'd4)
            idata[63: 60] = idata[63: 60] + 4'd3;
        idata = idata << 1;
    end
end
assign data = idata[63: 32];

endmodule
