`timescale 1ns / 1ps

module segment_display(
        output [3:0] an,
        output [6:0] seg,
        input [3:0] sw
    );
    
    //or n_01 (an, 4'b0000, 4'b1110);
    or n_01 (an[0], 0, 0);
    or n_02 (an[1], 0, 1);
    or n_03 (an[2], 0, 1);
    or n_04 (an[3], 0, 1);
    
    //not gates
    wire s0_n, s1_n, s2_n, s3_n;
    not n0 (s0_n, sw[0]);
    not n1 (s1_n, sw[1]);
    not n2 (s2_n, sw[2]);
    not n3 (s3_n, sw[3]);
    
    //a output
    wire a1, a2, a3, a4;
    and ag1 (a1, s3_n, s2_n, s1_n, sw[0]);
    and ag2 (a2, s3_n, sw[2], s1_n, s0_n);
    and ag3 (a3, sw[3], s2_n, sw[1], sw[0]);
    and ag4 (a4, sw[3], sw[2], s1_n, sw[0]);
    or orA (seg[0], a1, a2, a3, a4);
    
    //b output
    wire b1, b2, b3;
    and bg1 (b1, sw[3], sw[2]);
    and bg2 (b2, sw[2], s1_n, sw[0]);
    and bg3 (b3, sw[3], sw[2], sw[1]);
    or orB (seg[1], b1, b2, b3);
    
    //c output
    wire c1, c2, c3;
    and cg1 (c1, s3_n, s2_n, sw[1], s0_n);
    and cg2 (c2, sw[3], sw[2], sw[1]);
    and cg3 (c3, sw[3], sw[2], s0_n);
    or orC (seg[2], c1, c2, c3);
    
    //d output
    wire d1, d2, d3, d4;
    and dg1 (d1, s3_n, s2_n, s1_n, sw[0]);
    and dg2 (d2, s3_n, sw[2], s1_n, s0_n);
    and dg3 (d3, sw[3], s2_n, sw[1], s0_n);
    and dg4 (d4, sw[2], sw[1], sw[0]);
    or orD (seg[3], d1, d2, d3, d4);
    
    //e output
    wire e1, e2, e3;
    and eg1 (e1, s3_n, sw[0]);
    and eg2 (e2, s2_n, s1_n, sw[0]);
    and eg3 (e3, s3_n, sw[2], s1_n);
    or orE (seg[4], e1, e2, e3);
    
    //f output
    wire f1, f2, f3, f4;
    and fg1 (f1, s3_n, s2_n, sw[0]);
    and fg2 (f2, s3_n, s2_n, sw[1]);
    and fg3 (f3, s3_n, sw[1], sw[0]);
    and fg4 (f4, sw[3], sw[2], s1_n, sw[0]);
    or orF (seg[5], f1, f2, f3, f4);
    
    //g output
    wire g1, g2, g3;
    and gg1 (g1, s3_n, s2_n, s1_n);
    and gg2 (g2, s3_n, sw[2], sw[1], sw[0]);
    and gg3 (g3, sw[3], sw[2], s1_n, s0_n);
    or orG (seg[6], g1, g2, g3, g4);
    
endmodule
