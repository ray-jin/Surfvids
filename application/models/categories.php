<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Users
 *
 * This model represents user authentication data. It operates the following tables:
 * - user account data,
 * - user profiles
 *
 * @package	Tank_auth
 * @author	Ilya Konyukhov (http://konyukhov.com/soft/)
 */
class Categories extends CI_Model
{
	private $table_name			= 'categories';			// cars
        private $tbl_name='categories';	
        
        private $comment_car_table_name = "comment_cars";
        

	function __construct()
	{
            parent::__construct();

            $ci =& get_instance();
            $this->table_name			= $ci->config->item('db_table_prefix', 'tank_auth').$this->table_name;
            $this->comment_car_table_name   = $ci->config->item('db_table_prefix', 'tank_auth').$this->comment_car_table_name;            
            $this->load->helper('url');
            
	}

       
        
        /**
	 * Get comment record by Id
	 *
	 * @param	int
	 * @return	object
	 */
	function get_comment_by_id($comment_id)
	{
		$this->db->where('id', $comment_id);
		$query = $this->db->get("comments");

                if ($query->num_rows() == 1) return $query->row();
		return NULL;
	}

        /**
	 * List video clip url
	 *
	 * @param	array
	 * @return	array
	 */
        public function get_clip_urls($category_id)
	{
            $this->db->where('category_id', $category_id);            
            $query = $this->db->get("clips");            
            
            $urls="";
            $i=0;
            foreach ($query->result() as $row)
            {
                if ($i==0){
                    $urls.=$row->video_url;
                }
                else{
                    $urls.="&nbsp;|&nbsp;".$row->video_url;
                }
                $i++;

            }
            return $urls;
                         
	}
        
        /**
	 * get first car img url file
	 *
	 * @param	array
	 * @return	array
	 */
	 public function get_first_car_img_loc($car_id)
	{
            $this->db->where('car_id', $car_id);
            
            $query = $this->db->get($this->car_img_table_name);
            
            if (sizeof ($query->result()) >0){
                $row=$query->result();
                return $row[0]->img_loc;
            }
            else
                return null;
                         
	}
        
    
        
        /**
	 * get list of cars watched by user
	 *
	 * @param	array
	 * @return	array
	 */
	 function list_watch_car($uid)
	{
            $this->db->where('uid', $uid);
            $this->db->where('cid !=', 'NULL');
            $query = $this->db->get($this->watch_car_table_name);
            
            $list=array(); $i=0;
            foreach ($query->result() as $row)
            {
                $id=$row->cid;                     
                $acar=$this->get_car_by_id($id);
                //'user'	=>	'Users',	
                $list[$i] = array( 'cid' => $acar->id,
                    'make' => $acar->make,
                        'model' => $acar->model,
                    'year' => $acar->year,
                    'fuel_type' => $acar->fuel_type,
                    'transmission' => $acar->transmission,
                    'mileage' => $acar->mileage,
                    'desc' => $acar->desc,);
                
                $i++;
                
            }
            
            return $list;
           
	}
        
        /**
	 * Remove watch car record
	 *
	 * @param	int
         * @param       int
	 * @return	void
	 */
	function remove_watch_car($cid,$uid)
	{
            $this->db->where('cid', $cid);
            $this->db->where('uid', $uid);

            $this->db->delete($this->watch_car_table_name);
	}
        
        /**
	 * Remove watch car record by id
	 *
	 * @param	int 
	 * @return	void
	 */
	function remove_watch_car_by_id($wc_id)
	{
            $this->db->where    ('id', $wc_id);            

            $this->db->delete($this->watch_car_table_name);
	}
       
       
        /**
	 * Create new item into comment_car table
	 *
	 * @cid :car id
         * @uid : user_id
         * @comment : comment text
	 * @return	array
	 */
	 function insert($qry)
	{
             
            $this->db->set('cid', $cid);
            $this->db->set('uid', $uid);
            $this->db->set('comment', $comment);
            
            
             if ($this->db->insert($this->comment_car_table_name)) {
                   $comm_id = $this->db->insert_id();                          
                   return $comm_id;
            }
            
            return "-1"; //false
            
	}
        
        /**
	 * Create new item into comment_car table
	 *
	 * @cid :car id
         * @uid : user_id
         * @comment : comment text
	 * @return	array
	 */
	 function add_comment_car($cid,$uid,$comment)
	{
             
            $this->db->set('cid', $cid);
            $this->db->set('uid', $uid);
            $this->db->set('comment', $comment);
            
            
             if ($this->db->insert($this->comment_car_table_name)) {
                   $comm_id = $this->db->insert_id();                          
                   return $comm_id;
            }
            
            return "-1"; //false
            
	}
        
         /**
	 * Create new clip
	 *
	 * @cid :category id
         * @uid : user_id
         * @comment : comment text
	 * @return	array
	 */
	 function add_clip($category_id,$video_url)
	{
             
            $this->db->set('category_id', $category_id);
            $this->db->set('video_url', $video_url);
            
             if ($this->db->insert("clips")) {
                   $clip_id = $this->db->insert_id();                          
                   return $clip_id;
            }
            
            return "-1"; //false
            
	}
        
        /**
	 * Create new clip
	 *
	 * @cid :category id
         * @uid : user_id
         * @comment : comment text
	 * @return	array
	 */
	 function getClipById($clip_id)
	{             
            $this->db->where('id', $clip_id);            
            $query = $this->db->get("clips");
            if ($query->num_rows() == 1) return $query->row();
		return NULL;
	}
        
         /**
	 * get list of comments watched by users for a specific car
	 *
	 * 
	 * @return	array
	 */
	 function list_comments($category_id)
	 {
            $this->db->where('category_id', $category_id);
            
            $query = $this->db->get("comments");
            
            $list=array(); $i=0;
            foreach ($query->result() as $row)
            {
                $list[$i] = array( 'id' => $row->id,
                        'comment' => $row->comment,                
                );
                $i++;                
            }            
            return $list;           
	}
        
        /**
	 * Remove comment car record by id
	 *
	 * @param	int 
	 * @return	void
	 */
	function remove_comment_by_id($comm_id)
	{
            $this->db->where('id', $comm_id);            

            $this->db->delete("comments");
	}
        
        

        
        
         function &get_object_list( $start=0, $count=1000, $search_option='') {

		$strSql = "SELECT COUNT(*) AS cnt FROM $this->tbl_name";
		$query = $this->db->query($strSql);		
		$row = $query->row_array();
		$return_arr['total'] = $row['cnt'];
                $strSql = "SELECT * FROM $this->tbl_name WHERE 1=1 LIMIT $start, $count";
                

                $query = $this->db->query($strSql);
		$return_arr['rows'] = $query->result_array();
		
		return $return_arr;
	}
	
	function &get_specific_data($idx) {
            
            $strSql = "SELECT * FROM $this->tbl_name WHERE id='$idx'";
            
            $query = $this->db->query($strSql);
            $row = $query->row_array();
            return $row;
	}
	
	function get_next_insert_idx($tbl_name) {

		$next_increment = 0;
		$strSql = "SHOW TABLE STATUS WHERE Name='$this->tbl_name'";
		$query = $this->db->query($strSql);
		$row = $query->row_array();
		$next_increment = $row['Auto_increment'];
		
		return $next_increment;
	}
	
	function &_create_pagenation($per_page,$total,$base_url) {
    	
                $this->load->library('pagination');
		$config['base_url'] = $base_url;
		$config['page_query_string'] = TRUE;
		$config['total_rows'] = $total;
		$config['per_page'] = $per_page;
		$config['full_tag_open'] = "<div style='padding:8px;'>";
		$config['full_tag_close'] = "</div>";
		
		$this->pagination->initialize($config); 
		$pagenation = $this->pagination->create_links();
			
		return $pagenation;
    }
    
     /*
         * list products_attributes
         * @param	int
	 * @return	array of array
         */
	function list_categories() {                        

            $query = $this->db->get("categories");
            
            $list=array(); $i=0;
            foreach ($query->result() as $row)
            {
                
                if ($row->image_url!=""){
                    $list[$i] = array( 'id' => $row->id, 
                            'image_url' => UPLOAD_PATH.$row->id."/image/".$row->image_url,
                            'price' => $row->price ,
                            'video_info' => $row->video_info ,
                    );
                    $i++;
                }
            }
            return $list;  
	}
        
        /*
         * list products_attributes
         * @param	int
	 * @return	array of array
         */
	function list_clips($category_id) {                        
            $this->db->where('category_id', $category_id);
            
            $query = $this->db->get("clips");
            
            $list=array(); $i=0;
            foreach ($query->result() as $row)
            {
                $list[$i] = array( 'id' => $row->id,
                        'video_url' => UPLOAD_PATH.$category_id."/video/".$row->video_url,              
                );
                $i++;                
            }            
            return $list;     
            
	}
        
}

/* End of file users.php */
/* Location: ./application/models/auth/users.php */