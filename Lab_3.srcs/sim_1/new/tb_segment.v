`timescale 1ns / 1ps

module tb_segment;

    reg [3:0] sw;
    wire [3:0] an;
    wire [6:0] seg;

    segment_display uut(
        .seg(seg),
        .sw(sw),
        .an(an)
    );
    
    initial begin
    
    sw = 4'b0000;
    #50;
    
    sw = 4'b0001;
    #50;
    
    sw = 4'b0010;
    #50;
    
    sw=4'b0011;
    #50;

    end
    

endmodule
