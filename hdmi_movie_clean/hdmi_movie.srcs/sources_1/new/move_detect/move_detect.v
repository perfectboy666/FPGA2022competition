
module move_detect
(
	//global clock
	input				clk,  				//cmos video pixel clock
	input				rst_n,				//global reset
	//Image data prepred to be processd
	
	input				v_active,	
    input               h_active,    
  input	wire	[7:0]	Threshold,   
	
	input				per_frame_vsync,	//Prepared Image data vsync valid signal
	input				per_frame_href,		//Prepared Image data href vaild  signal
	input				per_frame_clken,	//Prepared Image data output/capture enable clock
	input		[7:0]	per_img_red,		//Prepared Image red data to be processed
	input		[7:0]	per_img_green,		//Prepared Image green data to be processed
	input		[7:0]	per_img_blue,		//Prepared Image blue data to be processed
	//Image data has been processd
	output				post_frame_vsync,	//Processed Image data vsync valid signal
	output				post_frame_href,	//Processed Image data href vaild  signal
	output				post_frame_clken,	//Processed Image data output/capture enable clock
	output      [23:0]  post_img
);


wire post1_frame_vsync;	
wire post1_frame_href;	
wire post1_frame_clken;	

wire [7:0]post1_img_Y;		
wire [7:0]post1_img_Cb;		
wire [7:0]post1_img_Cr;		
reg  [23:0] post1_img;

//3 clock 
Video_Image_Processor	u0_Video_Image_Processor
(
	//global clock
	.clk					(clk),  			//cmos video pixel clock
	.rst_n					(rst_n),			//global reset

	//Image data prepred to be processd
	.per_frame_vsync		(v_active),		//Prepared Image data vsync valid signal
	.per_frame_href			(h_active),		//Prepared Image data href vaild  signal
	.per_frame_clken		(per_frame_clken),		//Prepared Image data output/capture enable clock
	.per_img_red			(per_img_red),			//Prepared Image red data to be processed
	.per_img_green			(per_img_green),		//Prepared Image green data to be processed
	.per_img_blue			(per_img_blue),			//Prepared Image blue data to be processed

	//Image data has been processd
	.post_frame_vsync		(post1_frame_vsync	),		//Processed Image data vsync valid signal
	.post_frame_href		(post1_frame_href	),		//Processed Image data href vaild  signal
	.post_frame_clken		(post1_frame_clken	),		//Processed Image data output/capture enable clock
	.post_img_Y				(post1_img_Y		),			//Processed Image brightness output
	.post_img_Cb			(post1_img_Cb		),			//Processed Image blue shading output
	.post_img_Cr			(post1_img_Cr		)			//Processed Image red shading output
);	

wire post2_frame_vsync	;
wire post2_frame_href	;
wire post2_frame_clken	;
wire post2_img_Bit	;

wire post_vsync;	
wire post_href;	
wire post_clken;	
wire [7:0] data;

//3 clock		
frame_difference u0_frame_difference(
	.sclk 				(clk				),           
	.rst_n 				(rst_n				), 
	.Threshold			(Threshold			),		
	.per_vsync			(post1_frame_vsync	),			
	.per_href			(post1_frame_href	),			
	.per_clken			(post1_frame_clken	),
	.per_data			(post1_img_Y		),			
	.post_vsync 		(post_vsync			),
	.post_href 			(post_href			),
	.post_clken			(post_clken			),
	.post_data 		    (data				)
);

//4 clock
VIP_Bit_Erosion_Detector
#(
	.IMG_HDISP	(10'd480),	//640*480
	.IMG_VDISP	(10'd272)
)
u0_VIP_Bit_Erosion_Detector
(
	//global clock
	.clk					(clk),  		//cmos video pixel clock
	.rst_n					(rst_n),			//global reset
	//Image data prepred to be processd
	.per_frame_vsync		(post_vsync	),	//Prepared Image data vsync valid signal
	.per_frame_href			(post_href	),		//Prepared Image data href vaild  signal
	.per_frame_clken		(post_clken	),	//Prepared Image data output/capture enable clock
	.per_img_Bit			(data[0]	),			//Processed Image Bit flag outout(1: Value, 0:inValid)
	//Image data has been processd
	.post_frame_vsync		(post2_frame_vsync	),		//Processed Image data vsync valid signal
	.post_frame_href		(post2_frame_href	),		//Processed Image data href vaild  signal
	.post_frame_clken		(post2_frame_clken	),		//Processed Image data output/capture enable clock
	.post_img_Bit			(post2_img_Bit		)			//Processed Image Bit flag outout(1: Value, 0:inValid)
);

wire [10:0]	x_max;
wire [10:0]	x_min;
wire [10:0]	y_max;
wire [10:0]	y_min;

reg [10:0] hcout;
reg [10:0] vcout;

reg  post2_frame_href_r;
wire nege;
wire pose;

wire v_pose; 
reg  post2_frame_vsync_r;

always@(posedge clk or negedge rst_n)
	if(!rst_n)
		post2_frame_vsync_r <= 'd0;
	else 
		post2_frame_vsync_r <= post2_frame_vsync;
		
assign v_pose = post2_frame_vsync&&~post2_frame_vsync_r; 

always@(posedge clk or negedge rst_n)
	if(!rst_n)
		hcout <= 'd0;
	else if(post2_frame_href==1)
		begin
			if(post2_frame_clken==1)   //1~640
				hcout <= hcout +1'b1;
			else
			    hcout <= 'd0;
		end
	else
		hcout <= 'd0;
		
always@(posedge clk or negedge rst_n)
	if(!rst_n)
		post2_frame_href_r <= 'd0;
	else 
		post2_frame_href_r <= post2_frame_href;
		
assign nege= ~post2_frame_href&&post2_frame_href_r;

assign pose= post2_frame_href&&~post2_frame_href_r;

always@(posedge clk or negedge rst_n)
	if(!rst_n)
		vcout <= 'd0;
	//else if(vcout == 10'd480)
	else if(vcout == 10'd272)
		vcout <= 'd0;
	else if( post2_frame_vsync == 1 && pose == 1)
		vcout <= vcout  + 1;   //1~480
	else
		vcout <= vcout;

position   u0_position( 
		.clk		(clk)	, 
		.rst_n		(rst_n)	, 
		.ie			(post2_frame_clken)	,
		.post_frame_href(v_pose),	//����Ч��׼����ʼ��λ  ��һclk�Ͳ��ǳ����������ˣ����ģ����һִ֡��һ��
		.hcnt		(hcout)  ,      //�ڶ�֡����ʱ�򣬽���һ֡���x_maxr��ֵ����x_max
		.vcnt		(vcout)  , 
		.idat		(post2_img_Bit)	, 
		.x_max		(x_max)	,     //��˸�ģ�������ֵ����һ֡��ľ���λ��
		.x_min		(x_min)	, 
		.y_max		(y_max)	, 
		.y_min      (y_min )
		);

wire [23:0]  cmos_frame_data_d; 

data_d #(
	.delay(10)   //�����ݽ�������Ŀ�����㷨������ʱ10��clk��  yes
)
u0_data_d
(
	.sclk		(clk),
	.rst_n		(rst_n),
	.wr_en		(per_frame_clken),
	.data		({per_img_red,per_img_green,per_img_blue}),	       
	.data_de     (cmos_frame_data_d)
);	
				
always@(posedge clk or negedge rst_n)//行扫�?
    if(!rst_n)
        post1_img <= 'd0;
    else if(post2_frame_clken)  //hcontΪ��ǰ֡��x_min,xmax,y_min,y_maxΪ��һ֡������ ???
        begin
            if( ( ((hcout==x_min)|(hcout==x_min+1)|(hcout==x_max)|(hcout==x_max+1)) && ((vcout>=y_min)&&(vcout<=y_max)) )  //�γɾ���
                 | ( ((vcout==y_min)|(vcout==y_min+1)|(vcout==y_max)|(vcout==y_max+1)) && ((hcout>=x_min)&&(hcout<=x_max)) ) )
               
                post1_img <= 24'hff0000;
            /* else
                post1_img<={24{post2_img_Bit}}; */   //�����������䣬���˶�����Ķ�ֵͼ���þ��ο���
            else
                post1_img <= cmos_frame_data_d;
        end
    else
        post1_img <= 0;			
			
reg 	post2_frame_clken_r	;	
	
always@(posedge clk or negedge rst_n)//行扫�?
    if(!rst_n)
        post2_frame_clken_r <= 'd0;
    else 
        post2_frame_clken_r <= post2_frame_clken; 
					
//lag 11 clocks signal sync  
reg	    [10:0]	    post_frame_vsync_r    ;
reg	    [10:0]	    post_frame_href_r     ;	

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
		begin
		post_frame_vsync_r <= 0;
		post_frame_href_r <= 0;
		end
	else
		begin
		post_frame_vsync_r <= {post_frame_vsync_r[9:0], per_frame_vsync};
		post_frame_href_r <= {post_frame_href_r[9:0], per_frame_href};
		end
end

assign	post_frame_vsync = post_frame_vsync_r[10];  //�ӷ����п�������1clk���ݽ�������4clk���ݳ�ȥ�������ʱ3��clk
assign	post_frame_href = post_frame_href_r[10];
assign  post_frame_clken = post2_frame_clken_r ;
assign  post_img = post1_img;  //��������post2_frame_clken_r����
						
endmodule 
