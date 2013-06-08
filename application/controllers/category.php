<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Category extends CI_Controller
{
	function __construct()
	{
		parent::__construct();

		$this->load->library('security');
		$this->load->library('tank_auth');
		$this->load->model('categories'); // a little different
                $this->load->helper('url');
                $this->load->helper('file');
                $this->load->library('form_validation');
                
	}
	
        function _remap($method) {
		$this->load->view('header_v');
		$this->{$method}();
		$this->load->view('footer_v');
	}
        
	function index()
	{
            $start_no = empty($_REQUEST['per_page'])? 0:$_REQUEST['per_page'];		
            $per_page = $this->config->item('max_count_per_page');

            $result = $this->categories->get_object_list($start_no,$per_page);
            $total_page = $result['total'];
            $data['category_list'] = $result['rows'];

            $base_url = site_url("category?a=1");
            $data['pagenation'] = $this->categories->_create_pagenation($per_page, $total_page, $base_url);
            $data['post_key'] = "category";
            $this->load->view('category/category_list_v',$data);	
	}
        
        function category_del() {
		$post_id = $this->uri->segment(3, 0);
		if (empty($post_id)) {
			echo "select task!";
			return;
		}
                $prev=$this->categories->get_specific_data($post_id);
          
                
                //unlink($this->config->item('upload_path')."/".$post_id."/image/".$prev['image_url']); //delete physical image file
                //unlink($this->config->item('upload_path')."/".$post_id."/video/".$prev['video_url']); //delete physical image file
               var_dump( $this->load->helper('file'));
                delete_files($this->config->item('upload_path')."/".$post_id,TRUE);                
                rmdir($this->config->item('upload_path')."/".$post_id);
                
		$this->_proc_post_del($post_id);
		redirect("category");
    }
	
        function category_add() {
            $data = $this->_proc_post_add();
            $data['post_key'] = "category";
            $this->load->view('category/category_add_v', $data);
	}
        
       function category_edit() {		
		$post_id = $this->uri->segment(3, 0);
		if (empty($post_id)) {
			echo "select car!";
			return;
		}
		
		$data = $this->_proc_post_edit($post_id);
		$data['post_key'] = "category";	
		$data['post'] = $this->categories->get_specific_data($post_id);
		$this->load->view('category/category_edit_v', $data);
	}
        
        private function &_proc_post_add() {
		
		$this->form_validation->set_rules('name', 'Name', 'trim|required');
                		
		$qry = array();
		$data = array();
		
		if ($this->form_validation->run())
		{					
			$tbl_name = "categories";
			$new_idx = $this->categories->get_next_insert_idx($tbl_name);
			if ( empty($data['show_errors']) || count($data['show_errors'])==0 ) {				
			             
                                $qry = array_merge(	
                                        $qry,
                                        array(
                                                'id'		=> $new_idx,						
                                                'name'  =>    $this->input->post('name'),                                                
                                                'price'		=> $this->input->post('price'),
                                                'video_info'	=> $this->input->post('video_info'),
                                                'image_url'     => "",
                                                'video_url'     => "",
                                        )
                                );
                                $data['show_message'] = "Successfully added!";
                                if($this->db->insert($tbl_name,$qry)){
                                //	
                                        redirect("category");
                                }
				
			}			
		}//end run
		
		return $data;
        }
        
        public function updateImg(){
          
            $post_id = $_POST['category_id'];
                
            if ($post_id==null || $post_id=="") {                 
                 $result['status']=0;
                 $result['error']="Select the category";
                 echo json_encode($result);
                 return;
            }
            if ($_FILES['img']['name']==""){
                 $result['status']=0;
                 $result['error']="Select the File";
                 echo json_encode($result);
                 return;
            }
            
            $prev=$this->categories->get_specific_data($post_id);
            $this->load->library('upload');
            $this->upload->set_upload_path($this->config->item('upload_path')."/".$post_id."/image/");
            $this->upload->set_max_filesize($this->config->item('max_img_size'));                                                                
            $img_name=$this->upload->do_upload("img");
                  
             if (!$img_name) {//error;{}
                echo "<script>window.top.window.stopUpload(0,".$this->upload->display_errors().");</script>";   
                return;
            }
            
            unlink($this->config->item('upload_path')."/".$post_id."/image/".$prev['image_url']); //delete physical image file
            $img_name=$this->upload->file_name;
             $qry = array();
            $qry = array_merge(	
                    $qry,
                    array(
                            'id' => $post_id,                            
                            'image_url'     => $img_name,
                    )
            );

            $this->db->where('id', $post_id);
            $this->db->update("categories", $qry);
            $result = 1;
            echo "<script>window.top.window.stopUpload(".$result.",'','".
                HOST. $this->config->item('upload_path')."/".$post_id."/image/".$img_name.
                    "');</script>";   

        }
        
        private function &_proc_post_edit($new_idx) { 
    
                $this->form_validation->set_rules('name', 'Name', 'trim|required');
                $this->form_validation->set_rules('price', 'Price', 'trim|required|is_natural|numeric');


                $qry = array();
		$data = array();
		
		if ($this->form_validation->run())
		{	
			$tbl_name = "categories";	
			if ( empty($data['show_errors']) || count($data['show_errors'])==0 ) {
				
                            $this->load->library('upload');   
                            $prev=$this->categories->get_specific_data($new_idx);
                            $img_name=$prev['image_url'];
                            $video_name=$prev['video_url'];
                            
                            if ($_FILES['img']['name']!=""){

                                $this->upload->set_upload_path($this->config->item('upload_path')."/".$new_idx."/image/");
                                $this->upload->set_max_filesize($this->config->item('max_img_size'));                                                                
                                $img_name=$this->upload->do_upload("img");

                                if ( !$img_name) {//error;{}
                                    $this->form_validation->set_message("image_file",$this->upload->display_errors());                                
                                    return $data;
                                }
                                 $img_name=$this->upload->file_name;
                                 unlink($this->config->item('upload_path')."/".$new_idx."/image/".$prev['image_url']); //delete physical image file
                            }
                            
                            if ($_FILES['video']['name']!=""){
                                
                                $this->upload->set_upload_path($this->config->item('upload_path')."/".$new_idx."/video/");
                                $this->upload->set_max_filesize($this->config->item('max_video_size'));
                                $video_name=$this->upload->do_upload("video");

                                if (!$video_name) {
                                    $this->form_validation->set_message("video_file",$this->upload->display_errors());
                                    return $data;
                                }
                                $video_name=$this->upload->file_name;
                                unlink($this->config->item('upload_path')."/".$new_idx."/video/".$prev['video_url']); //delete physical video file
                            }
                            
                            
                            $qry = array_merge(	
					$qry,
					array(
						'id'		=> $new_idx,						
                                                'name'  =>    $this->input->post('name'),                                                
                                                'price'		=> $this->input->post('price'),
                                                'video_info'	=> $this->input->post('video_info'),
                                                'image_url'     => $img_name,
                                                'video_url'     => $video_name,
					)
				);
				
				$this->db->where('id', $new_idx);
				$this->db->update($tbl_name, $qry);
				
				$data['show_message'] = "Successfully updated!";

			}			
		}//end run	
			
		return $data;	
		
    } //end function
    
    private function _proc_post_del($idx) {    	
            $strSql = "DELETE FROM categories WHERE id='$idx' ";
            $this->db->query($strSql);
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */


//Watch list completed