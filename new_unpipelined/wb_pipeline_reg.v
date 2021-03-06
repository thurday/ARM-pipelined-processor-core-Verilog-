module wb_pipeline_reg(clock,wb_control_in,wb_content_in,base_register_update_content_in,wb_add_in,reg_update_address_in,
  wb_control,wb_content,base_register_update_content,wb_add,reg_update_address);
  
  parameter wb_control_width=2;
  
  input wire [31:0] wb_content_in,base_register_update_content_in;
  input wire [3:0] wb_add_in,reg_update_address_in;
  input wire clock;
  input wire [wb_control_width-1:0] wb_control_in;
  
  output wire [31:0] wb_content,base_register_update_content;
  output wire [3:0] wb_add,reg_update_address;
  output wire [wb_control_width-1:0] wb_control;
  
  reg [31:0] wb_content_reg,base_register_update_content_reg;
  reg [3:0] wb_add_reg,reg_update_address_reg;
  reg [wb_control_width-1:0] wb_control_reg;
  
  initial
  begin
    wb_content_reg=0;
    base_register_update_content_reg=0;
    wb_add_reg=0;
    reg_update_address_reg=0;
    wb_control_reg=0;
  end
  
  assign wb_content=wb_content_reg,
         base_register_update_content=base_register_update_content_reg,
         wb_add=wb_add_reg,
         reg_update_address=reg_update_address_reg,
         wb_control=wb_control_reg;
         
  always@(posedge clock)
  begin
    wb_content_reg<=wb_content_in;
    base_register_update_content_reg<=base_register_update_content_in;
    wb_add_reg<=wb_add_in;
    reg_update_address_reg<=reg_update_address_in;
    wb_control_reg<=wb_control_in;
  end
  
endmodule
    
  
  
  
  

