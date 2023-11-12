module ascii (
    input wire [3: 0] i,
    output reg [7: 0] o
);
always @( * ) begin
    case ( i )
        4'd0: o = 8'b0011_0000;
        4'd1: o = 8'b0011_0001;
        4'd2: o = 8'b0011_0010;
        4'd3: o = 8'b0011_0011;
        4'd4: o = 8'b0011_0100;
        4'd5: o = 8'b0011_0101;
        4'd6: o = 8'b0011_0110;
        4'd7: o = 8'b0011_0111;
        4'd8: o = 8'b0011_1000;
        4'd9: o = 8'b0011_1001;
        default: 
            o = 8'b0;
    endcase
end
endmodule