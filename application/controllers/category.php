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
            if(!$this->tank_auth->is_logged_in()) {
                redirect('auth/login');
                return;
            }
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
            $data['start_no'] =$start_no;
            
            $this->load->view('category/category_list_v',$data);	
	}
        
        function category_del() {
		$post_id = $this->uri->segment(3, 0);
		if (empty($post_id)) {
			echo "select task!";
			return;
		}
                $prev=$this->categories->get_specific_data($post_id);
               
                delete_files($this->config->item('upload_path')."/".$post_id,TRUE);                
                rmdir($this->config->item('upload_path')."/".$post_id);
                
		$this->_proc_post_del($post_id);
		redirect("category");
        }
        
         function clip_del() {
		
                $clip_id = $this->uri->segment(3, 0);
		if (empty($clip_id)) {
			echo "select Clip!";
			return;
		}
                $prev=$this->categories->getClipById($clip_id);
                $category_id = $prev->category_id;
                $category=$this->categories->get_specific_data($category_id);
                unlink(VIDEO_UPLOAD_PATH."/".$category['name']."/".$prev->video_url); //delete physical image file
                $strSql = "DELETE FROM clips WHERE id='$clip_id' ";
                $this->db->query($strSql);
                redirect("category/category_edit/".$category_id);
        }
        
         function comment_del() {
		
                $clip_id = $this->uri->segment(3, 0);
		if (empty($clip_id)) {
			echo "select Clip!";
			return;
		}
                $prev=$this->categories->get_comment_by_id($clip_id);
                $category_id = $prev->category_id;
                
                $prev=$this->categories->remove_comment_by_id($clip_id);
                redirect("category/category_comment/".$category_id);
        }
	
        function category_add() {
            $data = $this->_proc_post_add();
            $data['post_key'] = "category";
            $this->load->view('category/category_add_v', $data);
	}
        
       function category_edit() {		
		$post_id = $this->uri->segment(3, 0);
		if (empty($post_id)) {
			echo "select category!";
			return;
		}
		
		$data = $this->_proc_post_edit($post_id);
		$data['post_key'] = "category";	
		$data['post'] = $this->categories->get_specific_data($post_id);
		$this->load->view('category/category_edit_v', $data);
	}
        
        function category_comment() {
		$post_id = $this->uri->segment(3, 0);
		if (empty($post_id)) {
			echo "select category!";
			return;
		}
		
		$data = $this->_proc_post_edit($post_id);
		$data['post_key'] = "category";	
		$data['post'] = $this->categories->get_specific_data($post_id);
		$this->load->view('category/category_comment_v', $data);
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
                                                'purchase_id'  => $new_idx,
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
        
      
        
        private function &_proc_post_edit($new_idx) { 
    
                $this->form_validation->set_rules('name', 'Name', 'trim|required');
             
                $qry = array();
		$data = array();
		
		if ($this->form_validation->run())
		{	
			$tbl_name = "categories";	
			if ( empty($data['show_errors']) || count($data['show_errors'])==0 ) {
				
                            $this->load->library('upload');   
                            $prev=$this->categories->get_specific_data($new_idx);
                                                        
                            $qry = array_merge(	
					$qry,
					array(
						'id'		=> $new_idx,						
                                                'name'  =>    $this->input->post('name'),                                                
                                                'price'		=> $this->input->post('price'),
                                                'video_info'	=> $this->input->post('video_info'),
                                                
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