module EX_MEM_Latch(clk, rst, en, wreg_in, MemRead_in, MemWrite_in, MemtoReg_in, RegWrite_in, PCS_in, npc_in, b_in, alu_in, 
                    wreg_out, MemRead_out, MemWrite_out, MemtoReg_out, RegWrite_out, PCS_out, npc_out, b_out, alu_out);

input clk, rst, en, MemRead_in, MemWrite_in, MemtoReg_in, RegWrite_in, PCS_in;
input [3:0] wreg_in;
input [15:0] npc_in, b_in, alu_in;
output MemRead_out, MemWrite_out, MemtoReg_out, RegWrite_out, PCS_out;
output [3:0] wreg_out;
output [15:0] npc_out, b_out, alu_out;

dff memread(.q(MemRead_out), .d(MemRead_out), .wen(en), .clk(clk), .rst(rst));
dff memwrite(.q(MemWrite_out), .d(MemWrite_out), .wen(en), .clk(clk), .rst(rst));
dff memtoreg(.q(MemtoReg_out), .d(MemtoReg_in), .wen(en), .clk(clk), .rst(rst));
dff regwrite(.q(RegWrite_out), .d(RegWrite_in), .wen(en), .clk(clk), .rst(rst));
dff pcs(.q(PCS_out), .d(PCS_in), .wen(en), .clk(clk), .rst(rst));

dff b_ff0(.q(wreg_out[0]), .d(wreg_in[0]), .wen(en), .clk(clk), .rst(rst));
dff b_ff1(.q(wreg_out[1]), .d(wreg_in[1]), .wen(en), .clk(clk), .rst(rst));
dff b_ff2(.q(wreg_out[2]), .d(wreg_in[2]), .wen(en), .clk(clk), .rst(rst));
dff b_ff3(.q(wreg_out[3]), .d(wreg_in[3]), .wen(en), .clk(clk), .rst(rst));

Register npc_reg(.clk(clk), .rst(rst), .WriteReg(en), .ReadEnable1(1'b1), .ReadEnable2(1'b0), .Bitline1(npc_out), .Bitline2(), .D(npc_in));
Register alu_reg(.clk(clk), .rst(rst), .WriteReg(en), .ReadEnable1(1'b1), .ReadEnable2(1'b0), .Bitline1(alu_out), .Bitline2(), .D(alu_in));
Register b_reg(.clk(clk), .rst(rst), .WriteReg(en), .ReadEnable1(1'b1), .ReadEnable2(1'b0), .Bitline1(b_out), .Bitline2(), .D(b_in));

endmodule