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
    
    sw = 4'b0100;
    #50;
    
    sw = 4'b0101;
    #50;
    
    sw = 4'b0110;
    #50;
    
    sw=4'b0111;
    #50;
    
    sw = 4'b1000;
    #50;
    
    sw = 4'b1001;
    #50;
    
    sw = 4'b1010;
    #50;
    
    sw=4'b1011;
    #50;
    
    sw = 4'b1100;
    #50;
    
    sw = 4'b1101;
    #50;
    
    sw = 4'b1110;
    #50;
    
    sw=4'b1111;
    #50;

    end
    

endmodule
