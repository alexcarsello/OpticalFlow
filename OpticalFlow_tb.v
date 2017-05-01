`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2017 11:35:03 PM
// Design Name: 
// Module Name: OpticalFlow_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OpticalFlow_tb();
reg reset = 0;
reg clk = 0;

reg [15:0] img1_addr = 16'h0000;
reg [15:0] img2_addr = 16'h0000;
reg [7:0] img1 [(36864-1):0];
reg [7:0] img2 [(36864-1):0];
reg [7:0] img1_data;
reg [7:0] img2_data;
reg write_to_line_buf_1;
reg write_to_line_buf_2;
reg u_fifo_read;
reg v_fifo_read;
wire [31:0] u_data;
wire [31:0] v_data;
wire line_buf_full_1;
wire line_buf_full_2;
wire u_fifo_empty;
wire v_fifo_empty;

reg [31:0] array_u [(144-12) * (256-12) - 1:0];
reg [31:0] array_v [(144-12) * (256-12) - 1:0];
//submodule
design_1_wrapper DUT (
.clk_in    (clk),
.reset_rtl_0  (reset),
.img  (img1_data),
.nxt_img  (img2_data),
.u_out     (u_data),
.v_out     (v_data),
.img_full    (line_buf_full_1),
.nxt_img_full    (line_buf_full_2),   
.img_wr_en   (write_to_line_buf_1),
.nxt_img_wr_en   (write_to_line_buf_2),
.u_rd (u_fifo_read),
.v_rd (v_fifo_read),
.u_empty (u_fifo_empty),
.v_empty (v_fifo_empty)
);
integer i,j,file,rv;
initial begin

#0
reset = 1;
clk = 0;
img1_data = 0;
img2_data = 0;

//reading the file, and storing it to ram
$readmemh("hall1.txt", img1);
$readmemh("hall2.txt", img2);

#2000
reset = 0;
#40000000

file = $fopen("Uout.txt", "w");
    for( i = 0; i < 144 - 12; i = i + 1) begin
        for( j = 0; j < 256 - 12; j = j + 1) begin
            $fwrite(file,"%d\t",$signed(array_u[i*(256-12) + j]));
        end
            $fwrite(file, "\n");
    end
    $fclose(file);
    file = $fopen("Vout.txt", "w");
    for( i = 0; i < 144 - 12; i = i + 1) begin
        for( j = 0; j < 256 - 12; j = j + 1) begin
            $fwrite(file,"%d\t",$signed(array_v[i*(256-12) + j]));
        end
            $fwrite(file, "\n");
    end
    $fclose(file);
$finish;

end

reg prev_read;
reg [31:0]count;
//write to image 1 buffer when it's not full
always @(posedge clk) begin
    if (!reset) begin
		// write to line buffer 1 whenever possible
        if (!line_buf_full_1 & img1_addr < 36864) begin
            write_to_line_buf_1 <= 1;
            img1_data <= img1[img1_addr];
            img1_addr <= img1_addr + 1;
        end
        else begin
            write_to_line_buf_1 <= 0;
        end
		// write to line buffer 2 whenever possible
        if (!line_buf_full_2 & img2_addr < 36864) begin
            write_to_line_buf_2 <= 1;
            img2_data <= img2[img2_addr];
            img2_addr <= img2_addr + 1;
        end
        else begin
            write_to_line_buf_2 <= 0;
        end
        
        prev_read <= u_fifo_read;
        
		//read from u result fifo whenever possible
		if (!u_fifo_empty) begin
			u_fifo_read <= 1;
		end else begin
			u_fifo_read <= 0;
		end
		//read from v result fifo whenever possible
		if (!v_fifo_empty) begin
			v_fifo_read <= 1;
		end else begin
			v_fifo_read <= 0;
		end
		
		if(prev_read) begin
			array_u[count] <= u_data;
			array_v[count] <= v_data;
			count <= count + 1;
		end
    end else begin
    	count <= 0;
    end
end


always
    #525 clk = !clk;

endmodule


