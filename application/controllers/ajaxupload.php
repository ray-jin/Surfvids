<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Ajaxupload extends CI_Controller
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
        
        
	
        public function addVideo(){
            if (!isset($_POST['category_id'])){
                 $result['status']=0;
                 $result['error']="Select the category";
                 echo json_encode($result);
                 return;
            }
            $post_id = $_POST['category_id'];
                
            if ($post_id==null || $post_id=="") {   
                
                 $result['status']=0;
                 $result['error']="Select the category";
                 echo json_encode($result);
                 return;
            }
            if ($_FILES['video']['name']==""){
                 $result['status']=0;
                 $result['error']="Select the File";
                 echo json_encode($result);
                 return;
            }
            
            $prev=$this->categories->get_specific_data($post_id);
            $this->load->library('upload');
            $this->upload->set_upload_path($this->config->item('upload_path')."/".$prev->name."/video/");
            $this->upload->set_max_filesize($this->config->item('max_video_size'));                                                                
            $video_name=$this->upload->do_upload("video");
                  
             if (!$video_name) {                
                $result['status']=0;
                $result['error']=$this->upload->display_errors();
                echo json_encode($result);
                return;
            }
            $video_name=$this->upload->file_name;
            $id=$this->categories->add_clip($post_id,$video_name);
            $result['status']=1;
            $result['video_url']=$video_name;            
            $result['full_url']=HOST. $this->config->item('upload_path')."/".$prev->name."/video/".$video_name;
            $result['id']=$id;
            echo json_encode($result);
        }
      
        public function updateImg(){
          
            if (!isset($_POST['category_id'])){
                 $result['status']=0;
                 $result['error']="Select the category";
                 echo json_encode($result);
                 return;
            }
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
            $this->upload->set_upload_path($this->config->item('upload_path')."/".$prev->name."/image/");
            $this->upload->set_max_filesize($this->config->item('max_img_size'));                                                                
            $img_name=$this->upload->do_upload("img");
                  
             if (!$img_name) {
                
                $result['status']=0;
                $result['error']=$this->upload->display_errors();
                echo json_encode($result);
                return;
            }
            $tmp=$this->config->item('upload_path')."/".$prev->name."/image/".$prev['image_url'];
            if (file_exists($tmp))
                unlink($tmp); //delete physical image file
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
            
            $result['status']=1;
            $result['img_url']=HOST. $this->config->item('upload_path')."/".$prev->name."/image/".$img_name;
            
            echo json_encode($result);
        }
        
       /**
	 * List car img url file
	 *
	 * @param	array
	 * @return	array
	 */
	 public function list_clips()
	{
            if (!isset($_POST['category_id'])){
                 $result['status']=0;
                 $result['error']="Select the category";
                 echo json_encode($result);
                 return;
            }
            $category_id = $_POST['category_id'];
            $this->db->where('category_id', $category_id);            
            $query = $this->db->get("clips");
            
            $category=$this->categories->get_specific_data($category_id);
            
            $clips=array(); $i=0;
            
            foreach ($query->result() as $row)
            {
                $clips[$i] = array( 'id' => $row->id,
                        'video_url' => $row->video_url,
                        'full_url'=> VIDEO_PATH."/".$category['name'].$row->video_url,
                    );                
                $i++;
            }
            $result['status']=1;
            $result['clips']=$clips;
            echo json_encode($result);
                         
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */


//Watch list completed